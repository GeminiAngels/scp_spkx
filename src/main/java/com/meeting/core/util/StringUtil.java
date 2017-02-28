package com.meeting.core.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.security.MessageDigest;

/**
 * 2016/9/13 00:25:33
 * @author 白云飞
 *
 */
public class StringUtil {
	
	
	/**
	 * 判断是否空值或空字符串
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
        return str == null || str.length() == 0 || "null".equalsIgnoreCase(str);
    }
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }
    
	/**
	 * MD5加密算法
	 * @param s
	 * @return
	 */
	public static String MD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] strTemp = s.getBytes();
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 获取sql文件并将其内容写入字符串返回
	 * @param fileName
	 * @param c
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String readFile2String(String fileName , Class clz){
		try{
			if(clz==null)
				clz = StringUtil.class;
			String rootPath = clz.getResource(fileName).getFile();
			rootPath = rootPath.replaceAll("%20", " ");
			//System.out.println(rootPath);
			File f = new File(rootPath);
			InputStreamReader reader = new InputStreamReader(new FileInputStream(f),"UTF-8");
			BufferedReader br = new BufferedReader(reader);
			StringBuffer sql = new StringBuffer("");
			sql.setLength(0);
			String s1 = null;
			while ((s1 = br.readLine()) != null) {
				//System.out.println(s1);
				sql.append(s1);
			}
			br.close();
			reader.close();
			return sql.toString();
		}catch(Exception e){
			return null;
		}
	}
}
