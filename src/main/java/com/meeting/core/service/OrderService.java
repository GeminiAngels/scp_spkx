package com.meeting.core.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.meeting.core.bean.Order;
import com.meeting.core.db.DBUtil;
import com.meeting.core.util.NoUtil;
import com.meeting.core.util.StringUtil;

import cn.beecloud.BCEumeration.PAY_CHANNEL;
import cn.beecloud.BCPay;
import cn.beecloud.BeeCloud;
import cn.beecloud.bean.BCOrder;
import cn.beecloud.bean.BCQueryParameter;

/**
 * 2016/9/14 22:14:29
 * @author 白云飞
 *
 */
public class OrderService extends Thread{
	
	private DBUtil db;
	
	public OrderService() {
		db = new DBUtil();
	}
	
	public Map addOrderAndPay(Order order) throws Exception{
		
		Map ret = new HashMap();
		String sql = "insert into t_order "
				+ "(orderregisterid,orderuname,ordertype,orderno,orderaccount"
				+ ",ordertitle,ordermoney,orderstatus) values(?,?,?,?,?,?,?,?)";
		String prefix = "";
		if("1".equals(order.getOrdertype()))
			prefix = "ZFB";
		else if("2".equals(order.getOrdertype()))
			prefix = "WX";
		else if("3".equals(order.getOrdertype()))
			prefix = "YL";
		else
			prefix = "QT";
		String orderNo = NoUtil.getOrderNo(prefix,"");
		Thread.sleep(1000);
		boolean success = db.execute(sql, new Object[]{
				order.getOrderregisterid(),order.getOrderuname(),order.getOrdertype(),
				orderNo,order.getOrderaccount(),order.getOrdertitle(),
				order.getOrdermoney(),order.getOrderstatus()
				});
		Map id = db.queryOne("select max(id) as id from t_order ", null);
		db.execute("update t_order set orderno = concat(orderno,'C',id) where id = ? ", new Object[]{id.get("id")});
		order.setOrderno(orderNo+"C"+id.get("id").toString());
		
		db.execute("update t_register set zfflag = 1 where id = ? ", new Object[]{order.getOrderregisterid()});
		WebContext ctx = WebContextFactory.get();
		ctx.getSession().setAttribute("register",db.queryOne("select * from t_register where id = ? ", new Object[]{order.getOrderregisterid()}));
		ctx.getSession().setAttribute("orderList", db.queryForList("select * from t_order where orderregisterid = ? ", new Object[]{order.getOrderregisterid()}));
		ret.put("success", success);
		ret.put("order", order);
		return ret;
	}
	
	public boolean deleteOrder(Order order){
		boolean success = db.execute("delete from t_order where id = ? ", new Object[]{order.getId()});
		if(order.getOrderregisterid()!=0){
			WebContext ctx = WebContextFactory.get();
			ctx.getSession().setAttribute("orderList", db.queryForList("select * from t_order where orderregisterid = ? ", new Object[]{order.getOrderregisterid()}));
		}
		return success;
	}
	
	public boolean updateOrderStatus(Order order){
		boolean success = db.execute("update t_order set orderstatus = 1 where orderno = ? ", new Object[]{order.getOrderno()});
		WebContext ctx = WebContextFactory.get();
		ctx.getSession().setAttribute("orderList", db.queryForList("select * from t_order where orderregisterid = ? ", new Object[]{order.getOrderregisterid()}));
		return success;
	}
	
	public List getOrders(){
		return db.queryForList("select o.* , r.nickname , r.telphone , r.email , r.fptt , r.address from t_order o left outer join t_register r on(o.orderregisterid = r.id) order by o.orderdate desc ");
	}
	
	public Map getBCOrders(String paytype , Boolean payResult , Boolean refundResult , int pagenum , int limit){
		BeeCloud.registerApp("704d3f1f-adf3-4d3b-976e-2791d68d40ed", null, "b43a628a-f1ce-4735-9ad3-5f82d139e6f0", "96c7856e-af14-4b58-b62f-2707c23f392a");
		Map ret = new HashMap();
		try {
			BCQueryParameter param = new BCQueryParameter();
			if(payResult != null)
				param.setPayResult(payResult);
			if(refundResult != null)
				param.setRefundResult(refundResult);
			param.setSkip((pagenum-1)*limit);
			param.setLimit(limit);
	        if (StringUtil.isNotEmpty(paytype)) {
                PAY_CHANNEL channel = PAY_CHANNEL.valueOf(paytype);
                param.setChannel(channel);
	        }
	        param.setNeedDetail(true);
	        ret.put("count", BCPay.startQueryBillCount(param));
	        ret.put("data", BCPay.startQueryBill(param));
	        ret.put("pagenum", pagenum);
		} catch (Exception e) {
            e.printStackTrace();
        }
		return ret;
	}
}
