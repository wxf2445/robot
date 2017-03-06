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
import com.zlzkj.app.service.HandleService;
import com.zlzkj.app.service.UserService;
import com.zlzkj.app.service.WarningService;
import com.zlzkj.core.base.BaseController;
import com.zlzkj.core.sql.Row;

/**
 * 首页控制器
 */
@Controller
public class AppController extends BaseController{

	@Autowired
	private UserService userService;
	@Autowired
	private WarningService warningService;
	@Autowired
	private DataService dataService;
	@Autowired
	private HandleService handleService;


	@RequestMapping(value={"/app/getwarning"})
	public void getwarning(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String callbackFunName  = request.getParameter("callback");  
        PrintWriter out = response.getWriter(); 
        JSONObject json = new JSONObject();
        json.put("warnings", warningService.findWarningByStatus());
	    out.write(callbackFunName +"("+json.toString()+")");
	}

	@RequestMapping(value={"/app/login"})
	public void checkLogin(Model model,HttpServletRequest request,HttpServletResponse response,String account,String password) throws IOException {
       
		//response.setHeader("Access-Control-Allow-Origin", "*");
		//response.setHeader("P3P","CP=CAO PSA OUR");  
		List<Row> user = userService.checkLogin(account,password);
		String callbackFunName  = request.getParameter("callback");  
        PrintWriter out = response.getWriter(); 
        JSONObject json = new JSONObject();
        if(user.size()>0){
			HttpSession session = request.getSession();
			session.setAttribute("user", user.get(0));
			json.put("status", 1);
		}else{
			json.put("status", -1);
		}
	    out.write(callbackFunName +"("+json.toString()+")");
		/*if(user.size()>0){
			HttpSession session = request.getSession();
			session.setAttribute("user", user.get(0));
			return ajaxReturn(response, 1);
		}else
			return ajaxReturn(response, -1);*/
	}

	@RequestMapping(value={"/app/move"})
	public void move(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
       
		//response.setHeader("Access-Control-Allow-Origin", "*");
		//response.setHeader("P3P","CP=CAO PSA OUR");  
		String callbackFunName  = request.getParameter("callback");  
        PrintWriter out = response.getWriter(); 
        JSONObject json = new JSONObject();
        handleService.sendAction("30.31578120.34069");
        json.put("status", 1);
	    out.write(callbackFunName +"("+json.toString()+")");
		/*if(user.size()>0){
			HttpSession session = request.getSession();
			session.setAttribute("user", user.get(0));
			return ajaxReturn(response, 1);
		}else
			return ajaxReturn(response, -1);*/
	}

}