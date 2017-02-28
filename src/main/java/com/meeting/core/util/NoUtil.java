package com.meeting.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NoUtil extends Thread{
	private static long orderNum = 0l;  
    private static String date ;  
      
    public static void main(String[] args) throws InterruptedException {  
        System.out.println(NoUtil.getOrderNo("ZFB",""));  
        Thread.sleep(1000);
    }  
  
    /** 
     * 生成订单编号 
     * @return 
     */  
    public static synchronized String getOrderNo(String prefix,String suffix) {  
        String str = new SimpleDateFormat("yyMMddHHmmss").format(new Date());  
        if(date==null||!date.equals(str)){  
            date = str;  
            orderNum  = 0l;  
        }  
        orderNum ++;  
        long orderNo = Long.parseLong((date)) * 10000;  
        orderNo += orderNum;;  
        return prefix+orderNo+suffix;  
    }  
}
