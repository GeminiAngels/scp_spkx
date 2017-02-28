package com.meeting.core.db;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.meeting.core.exception.SystemException;

/**
 * 2016/9/13 00:10:39
 * @author 白云飞
 *
 */
public class DBUtil {
	private Logger logger = Logger.getLogger(DBUtil.class);
	private Connection conn = null;
	private PreparedStatement stat = null;
	private int dbType = 1;//1代表本地mysql，2代表oracle数据库
	
	public DBUtil(int dbType) {
		super();
		this.dbType = dbType;
	}

	public DBUtil() {
	}

	public Connection getConnection(){
		try {
			String connClass = null,connUrl = null,connUser = null,connPwd = null;
			if(dbType==1){
				connClass = "com.mysql.jdbc.Driver";
//				connUrl = "jdbc:mysql://db.dworld.net.cn:3306/meeting?useUnicode=true&characterEncoding=utf-8";
//				connUser = "meeting";
//				connPwd = "meeting";
				
				connUrl = "jdbc:mysql://localhost:3306/scp_spkx?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true";
				connUser = "root";
				connPwd = "mysql";
			} else {
				connClass = "oracle.jdbc.driver.OracleDriver";
				connUrl = "jdbc:oracle:thin:@localhost:1521/orcl";
				connUser = "root";
				connPwd = "mysql";
			}
			Class.forName(connClass);
			conn = DriverManager.getConnection(connUrl,connUser,connPwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			logger.error("找不到数据库驱动类，请检查驱动包依赖！");
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("连接数据库失败，因为:"+e.getMessage());
			closeConnection();
		}
		return conn;
	}
	
	public void closeConnection(){
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				logger.error("关闭连接错误："+e.getMessage());
			}
		}
	}
	
	public void rollback(){
		if(conn!=null){
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
				closeConnection();
			}
		}
	}
	
	public boolean execute(String sql,Object[] params){
		logger.info("开始执行:"+sql);
		boolean is_success = false;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			stat = conn.prepareStatement(sql);
			if(params!=null&&params.length>0){
				for(int i=1,len=params.length;i<=len;i++){
					Object p = params[i-1];
					if(p!=null){
						if(p instanceof Integer)
							stat.setInt(i, Integer.parseInt(p.toString()));
						else if(p instanceof Date){
							//将时间格式转换成符合Timestamp要求的格式  
							String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(p);  
							stat.setTimestamp(i, java.sql.Timestamp.valueOf(time));
						}else
							stat.setString(i, p.toString());
					}
				}
			}
			int zt = stat.executeUpdate();
			conn.commit();
			if(zt>-1){
				is_success = true;
				logger.info("执行成功！");
			} else {
				logger.warn("执行失败！");
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			rollback();
			logger.error("数字转换错误,sql执行失败！事务已回滚"+e.getMessage());
			throw new SystemException(e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
			rollback();
			logger.error("sql异常，sql执行失败！事务已回滚"+e.getMessage());
			throw new SystemException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			logger.error("程序逻辑异常："+e.getMessage());
			throw new SystemException(e.getMessage());
		} finally {
			closeConnection();
		}
		return is_success;
	}
	
	
	public boolean execute_upload(String sql,InputStream file , Object[] params){
		logger.info("开始执行:"+sql);
		boolean is_success = false;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			stat = conn.prepareStatement(sql);
			stat.setBlob(1, file);
			if(params!=null&&params.length>0){
				for(int i=0,len=params.length;i<len;i++){
					Object p = params[i];
					if(p!=null){
						if(p instanceof Integer)
							stat.setInt(i+2, Integer.parseInt(p.toString()));
						else if(p instanceof Date){
							//将时间格式转换成符合Timestamp要求的格式  
							String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(p);  
							stat.setTimestamp(i+2, java.sql.Timestamp.valueOf(time));
						} else
							stat.setString(i+2, p.toString());
					}
				}
			}
			int zt = stat.executeUpdate();
			conn.commit();
			if(zt>-1){
				is_success = true;
				logger.info("执行成功！");
			} else {
				logger.warn("执行失败！");
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			rollback();
			logger.error("数字转换错误,sql执行失败！事务已回滚"+e.getMessage());
			throw new SystemException(e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
			rollback();
			logger.error("sql异常，sql执行失败！事务已回滚"+e.getMessage());
			throw new SystemException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			logger.error("程序逻辑异常："+e.getMessage());
			throw new SystemException(e.getMessage());
		} finally {
			closeConnection();
		}
		return is_success;
	}
	
	@SuppressWarnings("rawtypes")
	public List queryForList(String sql){
		return queryForList(sql,null);
	}
	
	@SuppressWarnings({"unchecked", "rawtypes" })
	public List queryForList(String sql,Object[] params){
		logger.info("开始执行："+sql);
		List list = new ArrayList();
		try {
			conn = getConnection();
			stat = conn.prepareStatement(sql);
			if(params!=null&&params.length>0){
				for(int i=1,len=params.length;i<=len;i++){
					Object p = params[i-1];
					if(p!=null){
						if(p instanceof Integer)
							stat.setInt(i, Integer.parseInt(p.toString()));
						else if(p instanceof Date)
							stat.setTimestamp(i, Timestamp.valueOf(p.toString()));
						else
							stat.setString(i, p.toString());
					}
				}
			}
			ResultSet rs = stat.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				Map m = new HashMap();
				for(int i=1,len=rsmd.getColumnCount();i<=len;i++){
//					String cname = rsmd.getColumnName(i);
					String cname = rsmd.getColumnLabel(i);//getColumnLabel 解决列名重复起别名问题
					m.put(cname, rs.getString(cname));
				}
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("执行失败："+e.getMessage());
		} finally {
			closeConnection();
		}
		logger.info("执行成功！");
		return list;
	}
	
	@SuppressWarnings({"unchecked", "rawtypes" })
	public Map queryOne(String sql,Object[] params){
		logger.info("开始执行："+sql);
		Map m = null;
		try {
			conn = getConnection();
			stat = conn.prepareStatement(sql);
			if(params!=null&&params.length>0){
				for(int i=1,len=params.length;i<=len;i++){
					Object p = params[i-1];
					if(p!=null){
						if(p instanceof Integer)
							stat.setInt(i, Integer.parseInt(p.toString()));
						else if(p instanceof Date)
							stat.setTimestamp(i, Timestamp.valueOf(p.toString()));
						else
							stat.setString(i, p.toString());
					}
				}
			}
			ResultSet rs = stat.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				m = new HashMap();
				for(int i=1,len=rsmd.getColumnCount();i<=len;i++){
					String cname = rsmd.getColumnName(i);
					Object cvalue = rs.getObject(cname);
					m.put(cname, cvalue);
				}
				break;
			}
			if(rs.getRow()>1){
				logger.warn("期望1条记录，结果条数却为:"+rs.getFetchSize());
			}
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("执行失败："+e.getMessage());
		} finally {
			closeConnection();
		}
		logger.info("执行成功！");
		return m;
	}

	@SuppressWarnings({"unchecked", "rawtypes" })
	public Map queryBlob(String sql,Object[] params){
		logger.info("开始执行："+sql);
		Map m = null;
		try {
			conn = getConnection();
			stat = conn.prepareStatement(sql);
			if(params!=null&&params.length>0){
				for(int i=1,len=params.length;i<=len;i++){
					Object p = params[i-1];
					if(p!=null){
						if(p instanceof Integer)
							stat.setInt(i, Integer.parseInt(p.toString()));
						else if(p instanceof Date)
							stat.setTimestamp(i, Timestamp.valueOf(p.toString()));
						else
							stat.setString(i, p.toString());
					}
				}
			}
			ResultSet rs = stat.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				m = new HashMap();
				m.put(rsmd.getColumnName(1), rs.getBlob(1));
				for(int i=2,len=rsmd.getColumnCount();i<=len;i++){
					String cname = rsmd.getColumnName(i);
					Object cvalue = rs.getObject(cname);
					m.put(cname, cvalue);
				}
				break;
			}
			if(rs.getRow()>1){
				logger.warn("期望1条记录，结果条数却为:"+rs.getFetchSize());
			}
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("执行失败："+e.getMessage());
		} finally {
			closeConnection();
		}
		logger.info("执行成功！");
		return m;
	}
}
