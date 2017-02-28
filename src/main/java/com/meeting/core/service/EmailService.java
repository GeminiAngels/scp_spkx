package com.meeting.core.service;

import com.meeting.core.bean.Email;
import com.meeting.core.db.DBUtil;
import com.meeting.core.email.MailInfo;
import com.meeting.core.email.MailUtil;
import com.meeting.core.exception.SystemException;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EmailService {

	private final Logger logger = Logger.getLogger(this.getClass());

	private DBUtil db;


	public EmailService() {
		db = new DBUtil();
	}

	public boolean addEmail(Email email){
		String sql = "insert into t_emails(title,content,contentHtml,type) values(?,?,?,?)";
		return db.execute(sql, new Object[]{email.getTitle(),email.getContent(),email.getContentHtml(),email.getType()});
	}

	@SuppressWarnings("rawtypes")
	public List getAllEmails(){
		String sql = "select * from t_emails";
		return db.queryForList(sql);
	}
	
	@SuppressWarnings("rawtypes")
	public Map getEmail(int emailid){
		String sql = "select * from t_emails where id=?";
		return db.queryOne(sql, new Object[]{emailid});
	}

	public boolean updateEmailStatus(String id,String status){
		return db.execute("update t_emails set status = ? where id = ? ", new Object[]{status,id});
	}

	public boolean updateEmail(Email email){
		try {
			logger.info(email);
			String sql = "update t_emails set title=?,content=?,contentHtml=? ,type=? where id=?";
			return db.execute(sql, new Object[]{email.getTitle(),email.getContent(),email.getContentHtml(),email.getType(),email.getId()});
		} catch (Exception e) {
			throw new SystemException("更新Email发生异常:"+e.getMessage());
		}
	}
	
	public boolean deleteEmail(String eids){
		String sql = "delete from t_emails where id in("+eids+")";
		return db.execute(sql, null);
	}

	public boolean sendEmail(String emailAddress,String title,String content){
		MailInfo mailInfo = new MailInfo();
		List<String> toList = new ArrayList<String>();

		String[] emailAdds = emailAddress.split(";");
		for(String emailAdd : emailAdds){
			toList.add(emailAdd);
		}

//        List<String> ccList = new ArrayList<String>();
//        ccList.add("sanbogemini@126.com");

//		List<String> bccList = new ArrayList<String>();
//		bccList.add("477@126.com");

		//添加附件
		/*EmailAttachment att = new EmailAttachment();
		att.setPath("C:\\Program Files\\meeting\\emails\\会议通知.docx");
		att.setName("会议通知.docx");
		List<EmailAttachment> atts = new ArrayList<EmailAttachment>();
		atts.add(att);
		mailInfo.setAttachments(atts);*/

		mailInfo.setToAddress(toList);//收件人
//        mailInfo.setCcAddress(ccList);//抄送人
//		mailInfo.setBccAddress(bccList);//密送人

		mailInfo.setSubject(title);
		mailInfo.setContent(content);

		MailUtil.sendEmail(mailInfo);

		return true;
	}


}
