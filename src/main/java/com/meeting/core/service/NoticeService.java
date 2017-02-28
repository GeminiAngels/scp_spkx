package com.meeting.core.service;

import com.meeting.core.bean.Notice;
import com.meeting.core.db.DBUtil;
import com.meeting.core.exception.SystemException;
import org.apache.log4j.Logger;

import java.util.List;
import java.util.Map;

/**
 * Created by 戴森 on 2017/2/21.
 */
public class NoticeService {

	private DBUtil db;
	private final Logger logger = Logger.getLogger(this.getClass());
	public NoticeService() {
		db = new DBUtil();
	}

	public boolean addNotice(Notice notice){
		String sql = "insert into t_notice(title,content,contentHtml) values(?,?,?)";
		return db.execute(sql, new Object[]{notice.getTitle(),notice.getContent(),notice.getContentHtml()});
	}

	@SuppressWarnings("rawtypes")
	public List getAllNotice(){
		String sql = "select * from t_notice";
		return db.queryForList(sql);
	}

	public List getAllEnabledNotice(){
		String sql = "select * from t_notice where status=1 order by id desc limit 1";
		return db.queryForList(sql);
	}

	@SuppressWarnings("rawtypes")
	public Map getNotice(int id){
		String sql = "select * from t_notice where id=?";
		return db.queryOne(sql, new Object[]{id});
	}

	public boolean updateNotice(Notice notice){
		try {
			String sql = "update t_notice set title=?,content=?,contentHtml=? where id=?";
			return db.execute(sql, new Object[]{notice.getTitle(),notice.getContent(),notice.getContentHtml(),notice.getId()});
		} catch (Exception e) {
			throw new SystemException("更新通知发生异常:"+e.getMessage());
		}
	}

	public boolean updateNoticeStatus(String id,String status){
		return db.execute("update t_notice set status = ? where id = ? ", new Object[]{status,id});
	}
	public boolean deleteNotice(String id){
		return db.execute("delete from t_notice where id = ?", new Object[]{id});
	}

}
