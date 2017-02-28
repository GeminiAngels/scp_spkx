package com.meeting.core.service;

import com.meeting.core.bean.Mailset;
import com.meeting.core.db.DBUtil;
import com.meeting.core.exception.SystemException;

import java.util.List;
import java.util.Map;

/**
 * Created by 戴森 on 2017/2/22.
 */
public class MailsetService {

	private DBUtil db;

	public MailsetService() {
		db = new DBUtil();
	}


	public boolean addMailset(Mailset mailset){
		String sql = "insert into t_mailset(serverhost,senderaddr,sendernick,senderuname,senderpwd) values(?,?,?,?,?)";
		return db.execute(sql, new Object[]{mailset.getServerhost(),mailset.getSenderaddr(),mailset.getSendernick(),mailset.getSenderuname(),mailset.getSenderpwd()});
	}

	@SuppressWarnings("rawtypes")
	public List getAllMailset(){
		String sql = "select * from t_mailset";
		return db.queryForList(sql);
	}

	public List getAllEnabledMailset(){
		String sql = "select * from t_mailset where isactive=1";
		return db.queryForList(sql);
	}

	@SuppressWarnings("rawtypes")
	public Map getMailset(int id){
		String sql = "select * from t_mailset where id=?";
		return db.queryOne(sql, new Object[]{id});
	}

	public boolean updateMailset(Mailset mailset){
		try {
			String sql = "update t_mailset set serverhost=?,senderaddr=?,sendernick=?,senderuname=?,senderpwd=? where id=?";
			return db.execute(sql, new Object[]{mailset.getServerhost(),mailset.getSenderaddr(),mailset.getSendernick(),mailset.getSenderuname(),mailset.getSenderpwd(),mailset.getId()});
		} catch (Exception e) {
			throw new SystemException("更新发生异常:"+e.getMessage());
		}
	}

	public boolean updateMailsetStatus(String id,String status){
		return db.execute("update t_mailset set isactive = ? where id = ? ", new Object[]{status,id});
	}
	public boolean deleteMailset(String id){
		return db.execute("delete from t_mailset where id = ?", new Object[]{id});
	}
}
