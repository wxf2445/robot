package com.zlzkj.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.app.service.DataService;
import com.zlzkj.app.service.UserService;
import com.zlzkj.app.service.WarningService;
import com.zlzkj.core.base.BaseController;
import com.zlzkj.core.sql.Row;

/**
 * 首页控制器
 */
@Controller
public class IndexController extends BaseController{

	@Autowired
	private UserService userService;
	@Autowired
	private WarningService warningService;
	@Autowired
	private DataService dataService;

	@RequestMapping(value={"/","/index","/index/index"})
	public String index(Model model,HttpServletRequest request,HttpServletResponse response) {
		model.addAttribute("warnings", warningService.findWarningByStatus());
		if(request.getSession().getAttribute("user")==null)
			return "index/signin";
		else
			return "index/index";
	}

	@RequestMapping(value={"/login"})
	public String login(Model model,HttpServletRequest request,HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return "index/signin";
	}

	@RequestMapping(value={"/check/login"})
	public String checkLogin(Model model,HttpServletRequest request,HttpServletResponse response,String account,String password) throws IOException {
       
		//response.setHeader("Access-Control-Allow-Origin", "*");
		//response.setHeader("P3P","CP=CAO PSA OUR");  
		List<Row> user = userService.checkLogin(account,password);
		if(user.size()>0){
			HttpSession session = request.getSession();
			session.setAttribute("user", user.get(0));
			return ajaxReturn(response, 1);
		}else
			return ajaxReturn(response, -1);
	}

	@RequestMapping(value={"index/gallery"})
	public String gallery(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "index/gallery";
	}

	@RequestMapping(value={"index/robot_manage"})
	public String robotManage(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "index/robotManage";
	}
	@RequestMapping(value={"index/warning"})
	public String warning(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "index/warning";
	}
	@RequestMapping(value={"index/statistical"})
	public String statistical(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "index/statistical";
	}
	
	@RequestMapping(value={"monitoring/charts"})
	public String monitoring(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "monitoring/charts";
	}

	@RequestMapping(value={"monitoring/list_data"})
	public String listData(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "monitoring/listData";
	}

	@RequestMapping(value={"monitoring/standard"})
	public String standard(Model model,HttpServletRequest request,HttpServletResponse response) {
		dataService.getStandard(model);
		return "monitoring/standard";
	}

	@RequestMapping(value={"equipment/area"})
	public String area(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "equipment/area";
	}
	@RequestMapping(value={"equipment/robot"})
	public String robot(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "equipment/robot";
	}
	@RequestMapping(value={"user/user"})
	public String user(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "user/user";
	}
	@RequestMapping(value={"user/role"})
	public String role(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "user/role";
	}
	

	@RequestMapping(value={"setup/account"})
	public String account(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "setup/account";
	}

	@RequestMapping(value={"setup/server"})
	public String server(Model model,HttpServletRequest request,HttpServletResponse response) {
		return "setup/server";
	}

	@RequestMapping(value={"server/getip"})
	public String getip(Model model,HttpServletRequest request,HttpServletResponse response) {
		
		   //System.out.println(getLocalHostAddr());  
		return ajaxReturn(response, getLocalHostAddr());
	}
	public String getLocalHostAddr(){    
		 Enumeration allNetInterfaces;  
		Vector<String> ipAddr = new Vector<String>();  
		String ipLocalAddr = null;  
		InetAddress ip = null;
		 try {    
		allNetInterfaces = NetworkInterface.getNetworkInterfaces();  
		while (allNetInterfaces.hasMoreElements())    {  
			NetworkInterface netInterface = (NetworkInterface)
			allNetInterfaces.nextElement();
			System.out.println(netInterface.getName()+"name");    
			Enumeration addresses = netInterface.getInetAddresses();    
			while (addresses.hasMoreElements())     {    
			ip = (InetAddress) addresses.nextElement();      
			ipAddr.add(ip.toString());
			if (ip != null && ip instanceof Inet4Address){         //IP是ipv4，ipv6换成Inet6Address  
			     String hostAddress = ip.getHostAddress();
			     /*System.out.println("本机的IP =" + hostAddress);
			      * 
			      */
			     if(!hostAddress.equals("127.0.0.1")  && !hostAddress.equals("/127.0.0.1")){                    
			    	 ipLocalAddr = ip.toString().split("[/]")[1];       //得到本地IP      
			     }
			     //System.out.println(ipLocalAddr+"===============ipLocalAddr");
			    }    
			}
		}
		 } catch (SocketException e) {
		 e.printStackTrace();  
		}
		 return ipLocalAddr;          
		}
}

