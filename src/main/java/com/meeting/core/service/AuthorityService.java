package com.meeting.core.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.meeting.core.bean.Func;
import com.meeting.core.bean.Role;
import com.meeting.core.bean.User;
import com.meeting.core.db.DBUtil;
import com.meeting.core.exception.SystemException;
import com.meeting.core.util.StringUtil;

/**
 * 2016/9/14 22:10:14
 * @author 白云飞
 *
 */
public class AuthorityService {
	
	private final Logger logger = Logger.getLogger(this.getClass());
	
	private DBUtil db;
	
	
	public AuthorityService() {
		db = new DBUtil();
	}
	//--------------用户管理部分------------------
	@SuppressWarnings("rawtypes")
	public List getUsers(){
		String sql = "select * from t_users";
		return db.queryForList(sql);
	}
	
	@SuppressWarnings("rawtypes")
	public Map getUser(int userid){
		String sql = "select * from t_users where id=?";
		return db.queryOne(sql, new Object[]{userid});
	}
	
	public boolean insertUser(String name,String cnname,String password){
		String sql = "insert into t_users(name,cnname,password) values(?,?,?)";
		return db.execute(sql, new String[]{name,cnname,StringUtil.MD5(password)});
	}
	
	public boolean addUser(User user){
		return insertUser(user.getName(),user.getCnname(),user.getPassword());
	}
	
	public boolean updateUser(User user){
		try {
			logger.info(user);
			String sql = "update t_users set name=?,cnname=? where id=?";
			return db.execute(sql, new Object[]{user.getName(),user.getCnname(),user.getId()});
		} catch (Exception e) {
			throw new SystemException("更新用户发生异常:"+e.getMessage());
		}
	}
	
	public boolean deleteUser(String uids){
		String sql = "delete from t_users where id in("+uids+")";
		String cascSql = "delete from t_users_roles where userid in("+uids+")";
		return db.execute(sql, null)&&db.execute(cascSql, null);
	}
	
	@SuppressWarnings("rawtypes")
	public boolean updateUserPwd(User user){
		String sql = "update t_users set password=? where id=?";
		return db.execute(sql, new Object[]{StringUtil.MD5(user.getPassword()),user.getId()});
	}

	/**
	 * 更新用户启停状态
	 * @param userid
	 * @param status
	 * @return
	 */
	public boolean updateUserStatus(int userid,int status){
		String sql = "update t_users set status=? where id=?";
		return db.execute(sql, new Object[]{status,userid});
	}
	/**
	 * 根据用户名密码获取用户
	 * @param username
	 * @param password
	 * @return 返回单个用户
	 */
	@SuppressWarnings("rawtypes")
	public Map getUser(String username , String password){
		//1.将参数密码加密
		String md5pwd = StringUtil.MD5(password);
		//2.从数据库查询用户名密码符合要求的用户
		String sql = "select * from t_users where name = ? and password = ?";
		return db.queryOne(sql,new Object[]{username,md5pwd});
	}
	
	/**
	 * 根据用户ID获取其角色列表
	 * @param userid
	 * @return 用户拥有的角色列表
	 */
	@SuppressWarnings("rawtypes")
	public List getUserRoles(String userid){
		String sql = "select r.* from t_roles r where r.id in(select roleid from t_users_roles ur where ur.userid = "+userid+")";
		return db.queryForList(sql);
	}
	
	/**
	 * 给用户赋予角色
	 * @param userid
	 * @param roleids
	 * @return
	 */
	public boolean addUserRoles(String userid,String roleids){
		this.deleteUserRoles(userid);
		boolean is_success = false;
		for(String roleid : roleids.split(",")){
			String sql = "insert t_users_roles(userid,roleid) values(?,?)";
			is_success = db.execute(sql, new Object[]{userid,roleid});
			if(!is_success)
				logger.warn("角色："+roleid+"授权失败！");
		}
		return is_success;
	}
	
	public boolean deleteUserRoles(String userid){
		String sql = "delete from t_users_roles where userid="+userid;
		return db.execute(sql, null);
	}
	
	
	//----------------角色管理部分----------------
	/**
	 * 查询所有的角色列表
	 * @return 角色列表
	 */
	@SuppressWarnings("rawtypes")
	public List getAllRoles(){
		String sql = "select * from t_roles";
		return db.queryForList(sql);
	}
	
	@SuppressWarnings("rawtypes")
	public Map getRole(int roleid){
		String sql = "select * from t_roles where id=?";
		return db.queryOne(sql, new Object[]{roleid});
	}
	
	public boolean addRole(Role role){
		String sql = "insert into t_roles(name,code) values(?,?)";
		return db.execute(sql, new Object[]{role.getName(),role.getCode()});
	}
	
	public boolean updateRole(Role role){
		String sql = "update t_roles set name=?,code=? where id=?";
		return db.execute(sql, new Object[]{role.getName(),role.getCode(),role.getId()});
	}
	
	public boolean updateRoleStatus(int roleid,int status){
		String sql = "update t_roles set status=? where id=?";
		return db.execute(sql, new Object[]{status,roleid});
	}
	
	public boolean deleteRole(String rids){
		String sql = "delete from t_roles where id in("+rids+")";
		String cascSql1 = "delete from t_users_roles where roleid in("+rids+")";
		String cascSql2 = "delete from t_roles_funcs where roleid in("+rids+")";
		return db.execute(sql, null)&&db.execute(cascSql1, null)&&db.execute(cascSql2, null);
	}
	
	/**
	 * 从角色列表中选中用户所拥有的角色
	 * @param userid
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getCheckedUserRoles(String userid){
		List<Map<String,Object>> allRoles = this.getAllRoles();
		List<Map<String,Object>> userRoles = this.getUserRoles(userid);
		for(Map<String,Object> r : allRoles){
			for(Map<String,Object> ur : userRoles){
				if(r.get("id").toString().equals(ur.get("id").toString())){
					r.put("checked", true);
				}
			}
		}
		return allRoles;
	}
	
	public boolean addRoleFuncs(String roleid,String funcids){
		logger.info(funcids);
		this.deleteRoleFuncs(roleid);
		boolean is_success = false;
		for(String funcid : funcids.split(",")){
			String sql = "insert t_roles_funcs(roleid,funcid) values(?,?)";
			is_success = db.execute(sql, new Object[]{roleid,funcid});
			if(!is_success)
				logger.warn("功能："+funcid+"授权失败！");
		}
		return is_success;
	}
	
	public boolean deleteRoleFuncs(String roleid){
		String sql = "delete from t_roles_funcs where roleid="+roleid;
		return db.execute(sql, null);
	}
	
	//-------------------模块管理部分---------------
	
	/**
	 * 根据用户ID获取其功能列表
	 * @param userid
	 * @return 用户拥有的功能列表
	 */
	@SuppressWarnings("rawtypes")
	public List getUserFuncs(String userid){
		List userFuncs = null;
		List userRoles = getUserRoles(userid);
		if(userRoles!=null&&userRoles.size()>0){
			StringBuffer roleids = new StringBuffer();
			roleids.setLength(0);
			for(int i=0;i<userRoles.size();i++){
				Map ur = (Map)userRoles.get(i);
				roleids.append(",").append(ur.get("id"));
			}
			String sql = "select * from t_funcs f where f.id in(select distinct funcid from t_roles_funcs rf where rf.roleid in("+roleids.toString().replaceFirst(",", "")+"))";
			userFuncs = db.queryForList(sql);
		}
		return userFuncs;
	}
	
	@SuppressWarnings("rawtypes")
	public List getRoleFuncs(String roleid){
		String sql = "select * from t_funcs f where f.id in(select distinct funcid from t_roles_funcs rf where rf.roleid in("+roleid+"))";
		return db.queryForList(sql);
	}
	
	/**
	 * 获取系统所有的功能列表
	 * @return 功能列表
	 */
	@SuppressWarnings("rawtypes")
	public List getAllFuncs(){
		String sql = "select * from t_funcs";
		return db.queryForList(sql);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getRoleFuncsTree(String roleid){
		String sql = "select * from t_funcs where parentid = 0";
		List<Map<String,Object>> level1 = db.queryForList(sql);
		
		List<Map<String,Object>> roleFuncs = getRoleFuncs(roleid);
		logger.info(roleFuncs);
		
		for(Map<String,Object> f : level1){
			for(Map<String,Object> uf : roleFuncs){
				if(f.get("id").toString().equals(uf.get("id").toString())){
					f.put("checked", true);
				}
			}
			f.put("parent", f.get("parentid"));
			String csql = "select * from t_funcs where parentid = "+f.get("id");
			List<Map<String,Object>> level2 = db.queryForList(csql);
			for(Map<String,Object> f2 : level2){
				f2.put("leaf", true);
				f2.put("parent", f2.get("parentid"));
				for(Map<String,Object> uf : roleFuncs){
					if(f2.get("id").toString().equals(uf.get("id").toString())){
						f2.put("checked", true);
					}
				}
			}
			f.put("children", level2);
		}
		return level1;
	}
	
	/**
	 * 根据模块ID获取单条数据
	 * @param funcid
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map getFunc(int funcid){
		String sql = "select * from t_funcs where id=?";
		return db.queryOne(sql, new Object[]{funcid});
	}
	
	/**
	 * 在功能列表中选中用户拥有的功能
	 * @param userid
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getCheckedUserFuncs(String userid){
		List<Map<String,Object>> allFuncs = getAllFuncs();
		List<Map<String,Object>> userFuncs = getUserFuncs(userid);
		for(Map<String,Object> f : allFuncs){
			for(Map<String,Object> uf : userFuncs){
				if(f.get("id").toString().equals(uf.get("id").toString())){
					f.put("checked", true);
				}
			}
		}
		return allFuncs;
	}
	
	public boolean addFunc(Func func){
		String sql = "insert into t_funcs(name,url,parentid) values(?,?,?)";
		return db.execute(sql, new Object[]{func.getName(),func.getUrl(),func.getParentid()});
	}
	
	public boolean updateFunc(Func func){
		String sql = "update t_funcs set name=?,url=?,parentid=? where id=?";
		return db.execute(sql, new Object[]{func.getName(),func.getUrl(),func.getParentid(),func.getId()});
	}
	
	public boolean updateFuncStatus(int funcid,int status){
		String sql = "update t_funcs set status=? where id=?";
		return db.execute(sql, new Object[]{status,funcid});
	}
	
	public boolean deleteFunc(String fids){
		String sql = "delete from t_funcs where id in("+fids+")";
		String cascadeSql = "delete from t_roles_funcs where funcid in("+fids+")";
		return db.execute(sql, null)&&db.execute(cascadeSql, null);
	}
}
