package com.meeting.core.service;

import com.meeting.core.bean.Register;
import com.meeting.core.bean.Thesis;
import com.meeting.core.db.DBUtil;
import com.meeting.core.email.MailInfo;
import com.meeting.core.email.MailUtil;
import com.meeting.core.exception.SystemException;
import com.meeting.core.util.StringUtil;
import com.swetake.util.Qrcode;
import org.apache.commons.mail.EmailAttachment;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 2016/9/14 22:14:29
 *
 * @author 白云飞
 */
public class RegisterService {

	private DBUtil db;

	public RegisterService() {
		db = new DBUtil();
	}

	//后台管理员更新注册信息
	public boolean updateRegisterInfo(Register reg) {
		boolean success = true;

		StringBuffer sql = new StringBuffer("update t_register set gjzt=?,zfflag=?,invoice=?," +
				"yqhfszt=?,zzyqhfszt=?,registertime=?,hwzbz=?,zsjssj=?,zskssj=?," +
				"nickname=?,sex=?," +
				"job=?,title=?,company=?,officephone=?,telphone=?," +
				"email=?,address=?,postcode=?,sfztlw=?," +
				"sfsqhyfy=?,fytm=?,fynrzy=?," +
				"fyrjj=?,sffblw=?,journalname=?,gjbh=?,gjtm=?,zsyq=? where id=?");
		System.out.println(sql.toString());
		success = db.execute(sql.toString(), new Object[]{
				reg.getGjzt(), reg.getZfflag(), reg.getInvoice()
				, reg.getYqhfszt(), reg.getZzyqhfszt(), reg.getRegistertime(), reg.getHwzbz(),
				reg.getZsjssj(),reg.getZskssj(),
				reg.getNickname(),reg.getSex(),
				reg.getJob(),reg.getTitle(),reg.getCompany(),reg.getOfficephone(),reg.getTelphone(),
				reg.getEmail(),reg.getAddress(),reg.getPostcode(),reg.getSfztlw(),
				reg.getSfsqhyfy(),reg.getFytm(),reg.getFynrzy(),
				reg.getFyrjj(),reg.getSffblw(),reg.getJournalname(),reg.getGjbh(),reg.getGjtm(),reg.getZsyq(),
				reg.getId()});
		return success;
	}
	//后台管理员更新注册信息
	public boolean updateRegisterInfo2(Register reg) {
		boolean success = true;

		StringBuffer sql = new StringBuffer("update t_register set gjzt=?,zfflag=?,invoice=?," +
				"yqhfszt=?,zzyqhfszt=?,registertime=?,hwzbz=? where id=?");
		System.out.println(sql.toString());
		success = db.execute(sql.toString(), new Object[]{
				reg.getGjzt(), reg.getZfflag(), reg.getInvoice()
				, reg.getYqhfszt(), reg.getZzyqhfszt(), reg.getRegistertime(), reg.getHwzbz(), reg.getId()});
		return success;
	}


	public Map getThesisByRegisterId(String registerid) {
		String sql = "select status , id,filename,type,registerid, registeremail, date_format(uploadtime,'%Y/%m/%d %H:%i') as uploadtime, comments from t_thesis where registerid = ? ";
		return db.queryOne(sql, new Object[]{registerid});
	}

	public boolean insertThesis(Thesis lunwen, InputStream in) {
		String sql = "insert into t_thesis(file,registerid,registeremail,uploadtime,filename,type,comments) values(?,?,?,?,?,?,?) ";
		return db.execute_upload(sql, in, new Object[]{lunwen.getRegisterid(), lunwen.getRegisteremail(), new Date(), lunwen.getFilename(), lunwen.getType(), lunwen.getComments()});
	}

	public boolean updateThesis(Thesis lunwen, InputStream in) {
		String sql = "update t_thesis set file = ? , filename = ? , type = ? , comments = ? where id = ? ";
		return db.execute_upload(sql, in, new Object[]{lunwen.getFilename(), lunwen.getType(), lunwen.getComments(), lunwen.getId()});
	}

	public Map getThesis(String fileid) throws SQLException {
		String sql = "select file , filename , type , id from t_thesis where id = ?";
		return db.queryBlob(sql, new Object[]{fileid});
	}

	/**
	 * 注册
	 *
	 * @param reg
	 * @param isSendMail
	 * @param file
	 * @param fileName
	 * @return
	 */
	public boolean register(Register reg, boolean isSendMail, InputStream file, String fileName) {
		boolean success = true;
		if ("null".equals(String.valueOf(reg.getId())) || "0".equals(String.valueOf(reg.getId()))) {
			String sql = "insert into t_register"
					+ "(username,nickname,password,telphone,email,sex,company,job,journalname,message"
					+ ",degree,postcode,address,zsyq,invoice,sfcjsx,sxxl,fptt"
					+ ",officephone,fax,gzqk,title,sffblw,gjbh,gjtm,gjzt,sfztlw,sfsqhyfy,fytm,fynrzy,fyrjj,sfzs,zskssj,zsjssj,yqhfszt"
					+ ",registertime) "
					+ "values(?,?,?,?,?,?,?,?,?,?"
					+ ",?,?,?,?,?,?,?,?"
					+ ",?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?"
					+ ",?)";
			success = db.execute(sql, new Object[]{
					reg.getUsername(), reg.getNickname(), StringUtil.MD5(reg.getPassword()),
					reg.getTelphone(), reg.getEmail(), reg.getSex(),
					reg.getCompany(), reg.getJob(), reg.getJournalname(), reg.getMessage()
					, reg.getDegree(), reg.getPostcode(), reg.getAddress(), reg.getZsyq(), reg.getInvoice(), reg.getSfcjsx(), reg.getSxxl(), reg.getFptt()
					, reg.getOfficephone(), reg.getFax(), reg.getGzqk(), reg.getTitle(), reg.getSffblw()
					, reg.getGjbh(), reg.getGjtm(), reg.getGjzt(), reg.getSfztlw(), reg.getSfsqhyfy()
					, reg.getFytm(), reg.getFynrzy(), reg.getFyrjj(),reg.getSfzs(), "".equals(reg.getZskssj())?null:reg.getZskssj(), "".equals(reg.getZsjssj())?null:reg.getZsjssj(), reg.getYqhfszt()
					, new Date()});
		} else {//修改
			StringBuffer sql = new StringBuffer("update t_register set nickname=?,sex=?,company=?,job=?,journalname=?,message=?"
					+ ",degree=?,postcode=?,address=?,zsyq=?,sfcjsx=?,sxxl=?,fptt=?"
					+ ",officephone=?,fax=?,gzqk=?,title=?,sffblw=?,gjbh=?,gjtm=?,sfztlw=?,sfsqhyfy=?,fytm=?,fynrzy=?,fyrjj=?,sfzs=?,zskssj=?,zsjssj=?");
			if (reg.getPassword() != null && !"".equals(reg.getPassword())) {
				sql.append(",password='" + StringUtil.MD5(reg.getPassword()) + "'");
			}
			sql.append(" where id = " + reg.getId());
			System.out.println(sql.toString());
			success = db.execute(sql.toString(), new Object[]{
					reg.getNickname(), reg.getSex(),
					reg.getCompany(), reg.getJob(), reg.getJournalname(), reg.getMessage()
					, reg.getDegree(), reg.getPostcode(), reg.getAddress(), reg.getZsyq(), reg.getSfcjsx(), reg.getSxxl(), reg.getFptt()
					, reg.getOfficephone(), reg.getFax(), reg.getGzqk(), reg.getTitle(), reg.getSffblw()
					, reg.getGjbh(), reg.getGjtm(), reg.getSfztlw(), reg.getSfsqhyfy()
					, reg.getFytm(), reg.getFynrzy(), reg.getFyrjj(),reg.getSfzs(), "".equals(reg.getZskssj())?null:reg.getZskssj(), "".equals(reg.getZsjssj())?null:reg.getZsjssj()
			});
		}

		if (success) {
			WebContext ctx = WebContextFactory.get();
			Map sreg = db.queryOne("select * from t_register where email = ? ", new Object[]{reg.getEmail()});
			ctx.getSession().setAttribute("register", sreg);

			//文件上传
			if (file != null && fileName != null && !"".equals(fileName)) {
				Thesis thesis = new Thesis();
				thesis.setRegisterid(sreg.get("id").toString());
				thesis.setRegisteremail(sreg.get("email").toString());
				thesis.setUploadtime(new Date());
				thesis.setComments("");
				int index = fileName.lastIndexOf(".");
				thesis.setFilename(fileName.substring(fileName.lastIndexOf("\\") + 1, index));
				thesis.setType(fileName.substring(index + 1));

				if (ctx.getSession().getAttribute("thesis") != null) {
					Map lm = (Map) ctx.getSession().getAttribute("thesis");
					thesis.setId(Integer.parseInt(lm.get("id").toString()));
				}
				if (thesis.getId() == 0) {
					insertThesis(thesis, file);
				} else {
					updateThesis(thesis, file);
				}
				ctx.getSession().setAttribute("thesis", this.getThesisByRegisterId(sreg.get("id").toString()));
			}

			if (isSendMail)
				sendEmailToRegister(reg, "注册", "emailtemplate.html");
		}
		return success;
	}

	public boolean sendEmailToRegister(String email) {
		boolean success = false;
		String sql = "select * from t_register where email = ? and status = 0 ";
		Map m = db.queryOne(sql, new Object[]{email});
		if (m != null) {
			Register reg = new Register();
			reg.setId(Integer.parseInt(m.get("id").toString()));
			reg.setEmail(m.get("email").toString());
			reg.setNickname(m.get("nickname").toString());
			reg.setPassword(m.get("password").toString());
			success = sendEmailToRegister(reg, "重置密码", "forgotpwdtemplate.html");
		}
		return success;
	}

	public boolean sendEmailToRegister(Register reg, String flag, String templateFile) {
		Map ms = db.queryOne("select * from t_mailset where isactive = 1 ", null);
		MailUtil.init(ms);
		MailInfo mailInfo = new MailInfo();
		List<String> toList = new ArrayList<String>();
		toList.add(reg.getEmail());

//        List<String> ccList = new ArrayList<String>();
//        ccList.add("403274468@qq.com");

		List<String> bccList = new ArrayList<String>();
		bccList.add(MailUtil.getSenderEmail());

		//添加附件
		EmailAttachment att = new EmailAttachment();
		//暂时不带附件发送，需要时打开
//        att.setPath("C:\\Program Files\\meeting\\emails\\会议通知.docx");
//        att.setName("第八届全国地图学与地理信息系统学术大会通知.docx");
//        List<EmailAttachment> atts = new ArrayList<EmailAttachment>();
//        atts.add(att);
//        mailInfo.setAttachments(atts);

        try {
            File file = create_image("http://www.egeoscience.com.cn/scp_spkx/auth.do?method=signin&telphone="+reg.getTelphone());
            att.setPath(file.getAbsolutePath());
            att.setName("签到二维码.jpg");
            List<EmailAttachment> atts = new ArrayList<EmailAttachment>();
            atts.add(att);
            mailInfo.setAttachments(atts);
        } catch (Exception e) {
            e.printStackTrace();
        }

        mailInfo.setToAddress(toList);//收件人
//        mailInfo.setCcAddress(ccList);//抄送人
		mailInfo.setBccAddress(bccList);//密送人

		Map email = db.queryOne("select * from t_emails where status = 1 and type='" + flag + "' order by id desc limit 1", null);
		if (email != null && email.size() != 0) {
			mailInfo.setSubject(email.get("title").toString());//会议主题
			String mailMessage = email.get("contentHtml").toString();//会议内容
			if (StringUtil.isNotEmpty(templateFile))
				mailMessage = StringUtil.readFile2String(templateFile, this.getClass());
			mailMessage = mailMessage.replaceAll(":nickname", reg.getNickname()).replaceAll(":currentDate", new SimpleDateFormat("yyyy年MM月dd日").format(new Date()));
			mailMessage = mailMessage.replaceAll(":securityCode", reg.getId() + "");
			mailInfo.setContent(mailMessage);
		} else {
			mailInfo.setSubject(flag);//会议主题
			String mailMessage = flag;//会议内容
			if (StringUtil.isNotEmpty(templateFile))
				mailMessage = StringUtil.readFile2String(templateFile, this.getClass());
			mailMessage = mailMessage.replaceAll(":nickname", reg.getNickname()).replaceAll(":currentDate", new SimpleDateFormat("yyyy年MM月dd日").format(new Date()));
			mailMessage = mailMessage.replaceAll(":securityCode", reg.getId() + "");
			mailInfo.setContent(mailMessage);
		}

		MailUtil.sendEmail(mailInfo);
		return true;
	}

	public boolean hasRegisterByTel(Register reg) {
		String sql = "select count(*) as hasone from t_register where email = ? or telphone = ? ";
		Map m = db.queryOne(sql, new Object[]{reg.getEmail(), reg.getTelphone()});
		int count = 0;
		if (m.get("hasone") == null)
			return false;
		count = Integer.parseInt(m.get("hasone").toString());
		return count != 0;
	}

	public String login(Register reg) throws Exception {
		String errorMsg = null;
		String sql = "select * from t_register where email = ? and password = ? ";
		Map register = db.queryOne(sql, new Object[]{reg.getEmail(), StringUtil.MD5(reg.getPassword())});
		WebContext ctx = WebContextFactory.get();
		if (register != null && register.get("id") != null) {
			ctx.getSession().setAttribute("register", register);
			ctx.getSession().setAttribute("thesis", this.getThesisByRegisterId(register.get("id").toString()));
			ctx.getSession().setAttribute("orderList", db.queryForList("select * from t_order where orderregisterid = ? ", new Object[]{register.get("id")}));
		} else {
			errorMsg = "用户名或密码错误！";
			ctx.getHttpServletRequest().setAttribute("errormsg", errorMsg);
		}
		return errorMsg;
	}

	public String loginWithoutPwd(Register reg) throws Exception {
		String errorMsg = null;
		String sql = "select * from t_register where telphone = ? ";
		Map register = db.queryOne(sql, new Object[]{reg.getTelphone()});
		WebContext ctx = WebContextFactory.get();
		if (register != null && register.get("id") != null) {
			ctx.getSession().setAttribute("register", register);
			ctx.getSession().setAttribute("thesis", this.getThesisByRegisterId(register.get("id").toString()));
			ctx.getSession().setAttribute("orderList", db.queryForList("select * from t_order where orderregisterid = ? ", new Object[]{register.get("id")}));
		} else {
			errorMsg = "对不起，改手机用户还没有报名注册！";
			ctx.getHttpServletRequest().setAttribute("errormsg", errorMsg);
		}
		return errorMsg;
	}

	public void logout() {
		WebContext ctx = WebContextFactory.get();
		ctx.getSession().invalidate();
	}

	public boolean updateRegisterPaystatus(Register reg) {
		boolean success = db.execute("update t_register set zfflag = 0 where id = ? ", new Object[]{reg.getId()});
		WebContext ctx = WebContextFactory.get();
		ctx.getSession().setAttribute("register", db.queryOne("select * from t_register where id = ? ", new Object[]{reg.getId()}));
		return success;
	}

	public boolean updateRegisterInvoice(String invoice, String fptt, String rid) {
		Object[] params = new Object[]{invoice, fptt, rid};
		boolean success = db.execute("update t_register set invoice = ? , fptt = ? where id = ? ", params);
		WebContext ctx = WebContextFactory.get();
		ctx.getSession().setAttribute("register", db.queryOne("select * from t_register where id = ? ", new Object[]{params[2]}));
		return success;
	}

	public List getRegisters() {
		return db.queryForList("select reg.*,th.id as tid from t_register reg left join t_thesis th on (th.registerid = reg.id )  order by reg.id ");
	}

	public List getRegisters(String condition) {
		String sql = "select reg.*,th.id as tid from t_register reg left join t_thesis th on (th.registerid = reg.id )  where 1=1 ";
		if (StringUtil.isNotEmpty(condition)) {
			sql += " and (reg.telphone like '%" + condition + "%' "
					+ " or reg.email like '%" + condition + "%' or reg.nickname like '%" + condition + "%') ";
		}
		return db.queryForList(sql);
	}

	public boolean deleteRegister(String id) {
		return db.execute("delete from t_register where id = ?", new Object[]{id});
	}

	public boolean updateRegisterStatus(String id, String status) {
		return db.execute("update t_register set status = ? where id = ? ", new Object[]{status, id});
	}

	//更改支付状态
	public boolean confirmPayment(String id, String flag) {
		return db.execute("update t_register set zfflag = ? where id = ? ", new Object[]{flag, id});
	}


	public boolean uploadFile(Register reg, InputStream file, String fileName) {
		WebContext ctx = WebContextFactory.get();
		Map sreg = db.queryOne("select * from t_register where id = ? ", new Object[]{reg.getId()});
		//文件上传
		if (file != null && fileName != null && !"".equals(fileName)) {
			Thesis thesis = new Thesis();
			thesis.setRegisterid(sreg.get("id").toString());
			thesis.setRegisteremail(sreg.get("email").toString());
			thesis.setUploadtime(new Date());
			thesis.setComments("");
			int index = fileName.lastIndexOf(".");
			thesis.setFilename(fileName.substring(fileName.lastIndexOf("\\") + 1, index));
			thesis.setType(fileName.substring(index + 1));

			if (ctx.getSession().getAttribute("thesis") != null) {
				Map lm = (Map) ctx.getSession().getAttribute("thesis");
				thesis.setId(Integer.parseInt(lm.get("id").toString()));
			}
			if (thesis.getId() == 0) {
				insertThesis(thesis, file);
			} else {
				updateThesis(thesis, file);
			}
			ctx.getSession().setAttribute("thesis", this.getThesisByRegisterId(sreg.get("id").toString()));
			//更新用户信息
			db.execute("update t_register set zfflag = ?,usertype = ?, zsyq = ? where id = ? ", new Object[]{1, reg.getUsertype(), reg.getZsyq(), sreg.get("id").toString()});
			ctx.getSession().setAttribute("register", db.queryOne("select * from t_register where id = ? ", new Object[]{reg.getId()}));
		}
		return true;
	}

	public Map getRegisterById(String id) {
		String sql = "select * from t_register where id = ? ";
		return db.queryOne(sql, new Object[]{id});
	}

	public boolean updateRegisterPwd(String id, String password) {
		String sql = "update t_register set password = ? , status = 0 where id = ? ";
		return db.execute(sql, new Object[]{StringUtil.MD5(password), id});
	}


	public Map getRegisterByTelphone(String telphone) {
		String sql = "select * from t_register where telphone = ? ";
		return db.queryOne(sql, new Object[]{telphone});
	}

	/**
	 * 标记用户签到状态
	 *
	 * @param reg
	 * @return
	 */
	public boolean registerSignin(Register reg) {
		String sql = "update t_register set signin = 1 where telphone = ? ";
		return db.execute(sql, new Object[]{reg.getTelphone()});
	}
	/**
	 * 标记用户打印状态
	 * @return
	 */
	public boolean updateIsPrint(int id) {
		String sql = "update t_register set is_print = 1 where id = ? ";
		return db.execute(sql, new Object[]{id});
	}

	/**
	 * 后台标记用户签到状态
	 *
	 * @param id
	 * @param signin
	 * @return
	 */
	public boolean updateRegisterSignin(String id, String signin) {
		return db.execute("update t_register set signin = ? where id = ? ", new Object[]{signin, id});
	}

	public String importFiles(InputStream file, String fileName) {
		String msg="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		//文件上传
		if (file != null && fileName != null && !"".equals(fileName)) {
			HSSFWorkbook hwb = null;
			try {
				List<Register> regList = new ArrayList<Register>();
				// 创建Excel工作薄
				hwb = new HSSFWorkbook(file);
				// 得到第一个工作表
				for (int i = 0; i < hwb.getNumberOfSheets(); i++) {
					HSSFSheet sheet = hwb.getSheetAt(i);
					HSSFRow row = null;
					for (int j = 2; j < sheet.getPhysicalNumberOfRows(); j++) {
						row = sheet.getRow(j);
						System.out.println("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行");
						if (row.getCell(1) == null || row.getCell(1).getCellType() == 3) {
							System.out.println("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行  ===跳出");
							break;
						}
						Register reg = new Register();
//						reg.setId(Integer.parseInt(m.get("id").toString()));
//						reg.setEmail(m.get("email").toString());
//						reg.setNickname(m.get("nickname").toString());
//						reg.setPassword(m.get("password").toString());


						try {
							String email = getCellValue(row.getCell(1));
							reg.setEmail(email);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第二格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第二格时出错,请检查！");
						}
						try {
//							String registertime = getCellValue(row.getCell(2));
//							reg.setRegistertime(registertime);

							if (row.getCell(2) != null && row.getCell(2).getDateCellValue() != null) {
								Date registertime = row.getCell(2).getDateCellValue();
								reg.setRegistertime(sdf.format(registertime));
							}

						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第3格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第三格时出错,请检查！");
						}

						try {
							String nickname = getCellValue(row.getCell(3));
							reg.setNickname(nickname);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第4格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第四格时出错,请检查！");
						}
						try {
							String sex = getCellValue(row.getCell(4));
							reg.setSex(sex);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第5格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第五格时出错,请检查！");
						}
						//工作单位
						try {
							String company = getCellValue(row.getCell(5));
							reg.setCompany(company);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第6格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第六格时出错,请检查！");
						}
						//职称
						try {
							String title = getCellValue(row.getCell(6));
							reg.setTitle(title);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第7格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第七格时出错,请检查！");
						}
						//职务
						try {
							String job = getCellValue(row.getCell(7));
							reg.setJob(job);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第8格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第八格时出错,请检查！");
						}
						//单位地址
						try {
							String address = getCellValue(row.getCell(8));
							reg.setAddress(address);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第9格时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第9格时出错,请检查！");
						}
						//邮编
						try {
							String postcode = getCellValue(row.getCell(9));
							reg.setPostcode(postcode);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第10格时出错,请检查！");
						}
						//办公电话
						try {
							String officephone = getCellValue(row.getCell(10));
							reg.setOfficephone(officephone);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第11格时出错,请检查！");
						}
						//手机
						try {
							String telphone = getCellValue(row.getCell(11));
							if(telphone==""||"".equals(telphone)){
								msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
								throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第12格手机号码时出错,手机号码不能为空！");
							}
							reg.setTelphone(telphone);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第12格时出错,请检查！");
						}
						//邮箱
						try {
							String email = getCellValue(row.getCell(12));
							reg.setEmail(email);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第13格时出错,请检查！");
						}
						//是否发表论文
						try {
							String sffblw = getCellValue(row.getCell(13));
							reg.setSffblw(sffblw);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第14格时出错,请检查！");
						}
						//投稿期刊
						try {
							String journalname = getCellValue(row.getCell(14));
							reg.setJournalname(journalname);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第15格时出错,请检查！");
						}
						//稿件编号
						try {
							String gjbh = getCellValue(row.getCell(15));
							reg.setGjbh(gjbh);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第16格时出错,请检查！");
						}
						//稿件题目
						try {
							String gjtm = getCellValue(row.getCell(16));
							reg.setGjtm(gjtm);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第17格时出错,请检查！");
						}
						//稿件状态
						try {
							String gjzt = getCellValue(row.getCell(17));
							reg.setGjzt(gjzt);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第18格时出错,请检查！");
						}
						//是否张贴论文
						try {
							String sfztlw = getCellValue(row.getCell(18));
							reg.setSfztlw(sfztlw);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第19格时出错,请检查！");
						}
						//是否申请会议发言
						try {
							String sfsqhyfy = getCellValue(row.getCell(19));
							reg.setSfsqhyfy(sfsqhyfy);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第20格时出错,请检查！");
						}
						//发言题目
						try {
							String fytm = getCellValue(row.getCell(20));
							reg.setFytm(fytm);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第21格时出错,请检查！");
						}
						//发言内容摘要
						try {
							String fynrzy = getCellValue(row.getCell(21));
							reg.setFynrzy(fynrzy);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第22格时出错,请检查！");
						}
						//发言人简介
						try {
							String fyrjj = getCellValue(row.getCell(22));
							reg.setFyrjj(fyrjj);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第23格时出错,请检查！");
						}
						//是否住宿
						try {
							String sfzs = getCellValue(row.getCell(23));
							reg.setSfzs(sfzs);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第24格时出错,请检查！");
						}
						//住宿类型
						try {
							String zsyq = getCellValue(row.getCell(24));
							reg.setZsyq(zsyq);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第25格时出错,请检查！");
						}
						//住宿开始时间
						try {
//							String zskssj = getCellValue(row.getCell(25));
//							reg.setZskssj(zskssj);

							if (row.getCell(25) != null && row.getCell(25).getDateCellValue() != null) {
								Date zskssj = row.getCell(25).getDateCellValue();
								reg.setZskssj(sdf.format(zskssj));
							}

						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第26格时出错,请检查！");
						}
						//住宿结束时间
						try {
//							String zsjssj = getCellValue(row.getCell(26));
//							reg.setZsjssj(zsjssj);

							if (row.getCell(26) != null && row.getCell(26).getDateCellValue() != null) {
								Date zsjssj = row.getCell(26).getDateCellValue();
								reg.setZsjssj(sdf.format(zsjssj));
							}
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第27格时出错,请检查！");
						}
						//会议费
						try {
							String invoice = getCellValue(row.getCell(27));
							reg.setInvoice(invoice);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第28格时出错,请检查！");
						}
						//缴费状态
						try {
							String zfflag = getCellValue(row.getCell(28));
							reg.setZfflag(zfflag);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第29格时出错,请检查！");
						}
						//电子版邀请函发送状态
						try {
							String yqhfszt = getCellValue(row.getCell(29));
							reg.setYqhfszt(yqhfszt);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第30格时出错,请检查！");
						}
						//纸质版邀请函发送状态
						try {
							String zzyqhfszt = getCellValue(row.getCell(30));
							reg.setZzyqhfszt(zzyqhfszt);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第31格时出错,请检查！");
						}
						//会务组备注
						try {
							String hwzbz = getCellValue(row.getCell(31));
							reg.setHwzbz(hwzbz);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第32格时出错,请检查！");
						}
						//备注
						try {
							String message = getCellValue(row.getCell(32));
							reg.setMessage(message);
						} catch (Exception e) {
							e.printStackTrace();
							msg="在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行时出错,请检查！";
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第33格时出错,请检查！");
						}

						/*try {
							if (row.getCell(8) != null && row.getCell(8).getDateCellValue() != null) {
								Date leadTime = row.getCell(8).getDateCellValue();
								eam.setLeadTime(leadTime);
							}
						} catch (Exception e) {
							e.printStackTrace();
							throw new SystemException("在导入第" + (i + 1) + "张表单的第" + (j + 1) + "行第九格时出错,请检查领用时间！");
						}*/
						reg.setPassword(reg.getTelphone().length()>=4?reg.getTelphone().substring(reg.getTelphone().length()-4,reg.getTelphone().length()):reg.getTelphone());
						regList.add(reg);
					}
					for (Register reg : regList) {
						String sql = "insert into t_register"
								+ "(username,nickname,password,telphone,email,sex,company,job,journalname,message"
								+ ",degree,postcode,address,zsyq,invoice,sfcjsx,sxxl,fptt"
								+ ",officephone,fax,gzqk,title,sffblw,gjbh,gjtm,gjzt,sfztlw,sfsqhyfy,fytm,fynrzy,fyrjj,sfzs,zskssj,zsjssj,yqhfszt"
								+ ",registertime) "
								+ "values(?,?,?,?,?,?,?,?,?,?"
								+ ",?,?,?,?,?,?,?,?"
								+ ",?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?"
								+ ",?)";
						boolean success = db.execute(sql, new Object[]{
								"", reg.getNickname(), StringUtil.MD5(reg.getPassword()),
								reg.getTelphone(), reg.getEmail(), reg.getSex(),
								reg.getCompany(), reg.getJob(), reg.getJournalname(), reg.getMessage()
								, "", "", reg.getAddress(), reg.getZsyq(), reg.getInvoice(), "", "", ""
								, reg.getOfficephone(), "", "", reg.getTitle(), reg.getSffblw()
								, reg.getGjbh(), reg.getGjtm(), reg.getGjzt(), reg.getSfztlw(), reg.getSfsqhyfy()
								, reg.getFytm(), reg.getFynrzy(), reg.getFyrjj(),reg.getSfzs(), reg.getZskssj()!=null?sdf.parse(reg.getZskssj()):null, reg.getZsjssj()!=null?sdf.parse(reg.getZsjssj()):null, reg.getYqhfszt()
								,reg.getRegistertime()!=null?sdf.parse(reg.getRegistertime()):null});
					}
				}
				msg="导入成功!!";
			} catch (Exception e) {
				e.printStackTrace();
				return msg;
			}
		}
		return msg;
	}
	// 判断从Excel文件中解析出来数据的格式
	private String getCellValue(HSSFCell cell) {
		String value = null;
		// 简单的查检列类型
		switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_STRING:// 字符串
				value = cell.getRichStringCellValue().getString();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:// 数字
				double dd = (double) cell.getNumericCellValue();
				value = dd + "";
				break;
			case HSSFCell.CELL_TYPE_BLANK: // 空
				value = "";
				break;
			case HSSFCell.CELL_TYPE_FORMULA:
				value = String.valueOf(cell.getCellFormula());
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:// boolean型值
				value = String.valueOf(cell.getBooleanCellValue());
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				value = String.valueOf(cell.getErrorCellValue());
				break;
			default:
				break;
		}
		return value;
	}
	/*public static void main(String[] args) throws ParseException {
		RegisterService s = new RegisterService();
		Register reg = new Register();
		reg.setEmail("462716@qq.com");
		reg.setNickname("dbangel");
		s.sendEmailToRegister(reg, "其他", "emailtemplate.html");

//		System.out.println(DateUtils.parseDate("2016-12-27 18:00", new String[]{"yyyy-MM-dd HH:mm"}));
	}
*/


	public File create_image(String sms_info)throws Exception{
        BufferedImage bufImg = null;
        try {
            Qrcode qrcodeHandler = new Qrcode();
            // 设置二维码排错率，可选L(7%)、M(15%)、Q(25%)、H(30%)，排错率越高可存储的信息越少，但对二维码清晰度的要求越小
            qrcodeHandler.setQrcodeErrorCorrect('M');
            qrcodeHandler.setQrcodeEncodeMode('B');
            // 设置设置二维码尺寸，取值范围1-40，值越大尺寸越大，可存储的信息越大
            qrcodeHandler.setQrcodeVersion(7);
            // 获得内容的字节数组，设置编码格式
            byte[] contentBytes = sms_info.getBytes("utf-8");
            // 图片尺寸
            int imgSize = 67 + 12 * (7 - 1);
            bufImg = new BufferedImage(imgSize, imgSize, BufferedImage.TYPE_INT_RGB);
            Graphics2D gs = bufImg.createGraphics();
            // 设置背景颜色
            gs.setBackground(Color.WHITE);
            gs.clearRect(0, 0, imgSize, imgSize);

            // 设定图像颜色> BLACK
            gs.setColor(Color.BLACK);
            // 设置偏移量，不设置可能导致解析出错
            int pixoff = 2;
            // 输出内容> 二维码
            if (contentBytes.length > 0 && contentBytes.length < 800) {
                boolean[][] codeOut = qrcodeHandler.calQrcode(contentBytes);
                for (int i = 0; i < codeOut.length; i++) {
                    for (int j = 0; j < codeOut.length; j++) {
                        if (codeOut[j][i]) {
                            gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);
                        }
                    }
                }
            } else {
                throw new Exception("QRCode content bytes length = " + contentBytes.length + " not in [0, 800].");
            }
            gs.dispose();
            bufImg.flush();

            File f = new File("a.jpg");
            if(!f.exists()) f.createNewFile();
            ImageIO.write(bufImg, "jpg", f);
            return f;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	public static void main(String[] args) throws Exception {
        File file = new File("a.jpg");
        System.out.println(file.getAbsolutePath());//获取绝对路径
		long start = System.currentTimeMillis();
		String string = "http://jss.360buy.com/outLinkServicePoint/e4f76f55-8661-4d76-8465-d4cd0e0cc4c5.0.3_Beta_signed_20130609_.apk";
        RegisterService a =new RegisterService();
        File f = a.create_image(string);

		long end = System.currentTimeMillis();
		long last = end  - start;
		System.out.println("time consume:" + last);
	}

}
