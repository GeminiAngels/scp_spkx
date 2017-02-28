package com.meeting.core.service;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.meeting.core.bean.Resources;
import com.meeting.core.db.DBUtil;

/**
 * 2016/9/14 22:14:29
 * @author 白云飞
 *
 */
public class ResourceService {
	
	private DBUtil db;
	
	public ResourceService() {
		db = new DBUtil();
	}

	public boolean insertResource(Resources resource , InputStream in){
		String sql = "insert into t_resources(file,uploadtime,filename,type,category,comments) values(?,?,?,?,?,?) ";
		return db.execute_upload(sql, in, new Object[]{new Date(),resource.getFilename(),resource.getType(),resource.getCategory(),resource.getComments()});
	}
	
	public boolean updateResource(Resources resource , InputStream in){
		String sql = "update t_resources set file = ? , filename = ? , type = ? , category = ? , comments = ? where id = ? ";
		return db.execute_upload(sql, in, new Object[]{resource.getFilename(),resource.getType(),resource.getCategory(),resource.getComments(),resource.getId()});
	}
	
	public boolean deleteResource(String id){
		return db.execute("delete from t_resources where id = ?", new Object[]{id});
	}
	
	/**
	 * 查询所有资料
	 * @return
	 */
	public List getResources(){
		return getResources(null);
	}
	
	public List getResources(String category){
		StringBuffer sql = new StringBuffer("select id,filename,type,date_format(uploadtime,'%Y/%m/%d %H:%i') as uploadtime, status , category , comments from t_resources ");
		sql.append(" where 1=1 ");
		if(category!=null){
			
			sql.append(" and category = ? ");
		}
			
		sql.append(" order by uploadtime ");
		return db.queryForList(sql.toString(),new Object[]{category});
	}
	
	/**
	 * 更新资料启停状态
	 * @param userid
	 * @param status
	 * @return
	 */
	public boolean updateResourcestatus(int fileid,int status){
		String sql = "update t_resources set status=? where id=?";
		return db.execute(sql, new Object[]{status,fileid});
	}

	public Map getResource(String fileid) throws SQLException {
		String sql = "select file , filename , type , id from t_resources where id = ?";
		return db.queryBlob(sql,new Object[]{fileid});
	}
}
