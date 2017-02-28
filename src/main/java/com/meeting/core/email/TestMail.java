package com.meeting.core.email;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.mail.EmailAttachment;

public class TestMail {

    /**
     * @return void
     */
    public static void main(String[] args) {
        MailInfo mailInfo = new MailInfo();
        List<String> toList = new ArrayList<String>();
        toList.add("462716@qq.com");
        
//        List<String> ccList = new ArrayList<String>();
//        ccList.add("sanbogemini@126.com");
        
        List<String> bccList = new ArrayList<String>();
        bccList.add("477@126.com");
        
        //添加附件
        EmailAttachment att = new EmailAttachment();
        att.setPath("C:\\Program Files\\meeting\\emails\\会议通知.docx");
        att.setName("会议通知.docx");
        List<EmailAttachment> atts = new ArrayList<EmailAttachment>();
        atts.add(att);
        mailInfo.setAttachments(atts);
        
        mailInfo.setToAddress(toList);//收件人
//        mailInfo.setCcAddress(ccList);//抄送人
        mailInfo.setBccAddress(bccList);//密送人
        
        mailInfo.setSubject("会议通知");
        mailInfo.setContent("<h2>会议标题</h2><p>会议内容</p>");
         
        MailUtil.sendEmail(mailInfo);

    }
}
