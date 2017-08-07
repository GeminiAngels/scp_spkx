package com.meeting.core.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.meeting.core.bean.Resources;
import com.meeting.core.service.ResourceService;

/**
 * 2016/9/13 01:40:53
 * @author 白云飞
 *
 */
public class ResourceServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unused")
	private final Logger logger = Logger.getLogger(this.getClass());
	
	public String upload(HttpServletRequest req , HttpServletResponse resp){
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		String path = req.getRealPath("/upload");//设置磁盘缓冲路径
	
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024*1024);//设置创建缓冲大小
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(-1);//设置上传文件限制大小,-1无上限

		List<FileItem> list = null;
		String comments = "",category = "",realFileName = "",type = "";
		InputStream in = null;
		try {
			list = upload.parseRequest(req);;
			for(FileItem item : list){
		//		String name = item.getFieldName();
				if(item.isFormField()){//判断是否是文件流
					
					if(item.getFieldName().equals("category"))
						category = item.getString("UTF-8");
					if(item.getFieldName().equals("comments"))
						comments = item.getString("UTF-8");
				//	System.out.println(name+"="+va);
			///		request.setAttribute(name, value);
				}else{
					String value = item.getName();//会将完整路径名传过来
					int start = value.lastIndexOf("\\");
					String fileName = value.substring(start+1);
			//		request.setAttribute(name, fileName);
					in = item.getInputStream();
					File dir = new File(path);
					if(!dir.exists())
						dir.mkdirs();
					item.write(new File(path,fileName));
					int index = fileName.lastIndexOf(".");
					realFileName = fileName.substring(0,index);
					type = fileName.substring(index+1);
				}
			}
			Resources resource = new Resources();
			resource.setFilename(realFileName);
			resource.setType(type);
			resource.setComments(comments);
			resource.setUploadtime(new Date());
			resource.setCategory(category);
			
			ResourceService resourceService = new ResourceService();
			
			if(resource.getId()==0){
				resourceService.insertResource(resource, in);
			} else {
				resourceService.updateResource(resource, in);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			if(in!=null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			for(FileItem item : list){
				if(!item.isFormField()){//判断是否是文件流
					item.delete();
				}
			}
			return "redirect:auth.do?method=resource";
		}
	}
	
	public String download(HttpServletRequest req , HttpServletResponse resp){
		String fileid = req.getParameter("fileid");
		ResourceService service = new ResourceService();
		InputStream in = null;
		OutputStream out = null;
		Map file = null;
		try {
			file = service.getResource(fileid);
			in = ((Blob)file.get("file")).getBinaryStream();
			out = resp.getOutputStream();
			resp.setContentType("application/x-msdownload");
			String filename = file.get("filename")+"."+file.get("type");
			filename = new String(filename.getBytes("utf-8"),"ISO-8859-1");
			resp.addHeader("Content-Disposition", "attachment; filename="+filename);
			resp.setCharacterEncoding("UTF-8");
			int b = -1;
			while((b=in.read())!=-1){
				out.write(b);
			}
			in.close();
			out.close();
			in = null;
			out = null;
			file = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
