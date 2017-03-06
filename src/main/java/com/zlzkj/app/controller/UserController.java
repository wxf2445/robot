package com.zlzkj.app.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.service.EquipmentService;
import com.zlzkj.app.service.UserService;
import com.zlzkj.app.service.WarningService;
import com.zlzkj.app.util.PageView;
import com.zlzkj.app.util.RobotUtil;
import com.zlzkj.core.base.BaseController;
import com.zlzkj.core.sql.Row;

/**
 * 首页控制器
 */
@Controller
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	@Autowired
	private WarningService warningService;
	@Autowired
	private EquipmentService equipmentService;
	

	@RequestMapping(value={"user/getuser"})
	public String getdata(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String description) {
		
		JSONObject jo = new JSONObject();
		jo.put("users", new PageView(userService.findAllByPage(page)));
		return ajaxReturn(response,jo);

	}
	@RequestMapping(value={"user/getuserinfo"})
	public String getrobotinfo(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {

		JSONObject jo = new JSONObject();
		return ajaxReturn(response,userService.getUserInfo(jo,id));

	}

	@RequestMapping(value={"user/saveuser"})
	public String saveuser(Model model,HttpServletRequest request,HttpServletResponse response,
			String id,String roleId,String name,String phone,String description) {

		return ajaxReturn(response,userService.saveUser(id, name,phone, roleId, description));

	}
	@RequestMapping(value={"user/getroles"})
	public String getroles(Model model,HttpServletRequest request,HttpServletResponse response) {
		return ajaxReturn(response,userService.getroles());

	}
	@RequestMapping(value={"user/add"})
	public String addUser(Model model,HttpServletRequest request,HttpServletResponse response,
			String name,String description,String phone,String roleId,String account,String password) {
		return ajaxReturn(response,userService.addUser(name, phone, roleId, description,account,password));

	}

	@RequestMapping(value={"role/getrole"})
	public String getrole(Model model,HttpServletRequest request,HttpServletResponse response,
			String page) {

		return ajaxReturn(response,new PageView(userService.getRole(page)));

	}

	@RequestMapping(value={"role/getroleinfo"})
	public String getroleinfo(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {

		return ajaxReturn(response,userService.getRoleInfo(id));

	}
	@RequestMapping(value={"role/add"})
	public String roleadd(Model model,HttpServletRequest request,HttpServletResponse response,
			String name,String description) {

		return ajaxReturn(response,userService.addRole(name, description));

	}
	@RequestMapping(value={"headimage"})
	public String headimage(Model model,HttpServletRequest request,HttpServletResponse response,@RequestParam MultipartFile headImage) {
		/*MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
        MultipartFile file = multipartRequest.getFile("headImage");*/
        HttpSession session = request.getSession();
        Row user = (Row)request.getSession().getAttribute("user");
        
        File f = new File(RobotUtil.FILE_SERVER+user.getString("id"));
        if(!f.exists()){
        	f.mkdir();
        	//+"/"+
        }
        FileOutputStream fos;
        String fileName = "";
		try {
	        InputStream is = headImage.getInputStream();
	        fileName = user.getString("id")+"/"+System.currentTimeMillis()+".png";
			fos = new FileOutputStream(RobotUtil.FILE_SERVER+fileName);
			
	        byte[] b = new byte[1024];

	        while((is.read(b)) != -1){
	        	fos.write(b);
	        }

	        is.close();

	        fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		userService.changeHeadImage(user.getString("id"), fileName);
		
		user = userService.findByStringId(user.getString("id"));
		session.setAttribute("user", user);
		JSONObject jo = new JSONObject();
		jo.put("image", user.getString("headImage"));

		return ajaxReturn(response,jo);

	}

	@RequestMapping(value={"user/getallrobot"})
	public String roleadd(Model model,HttpServletRequest request,HttpServletResponse response) {

		return ajaxReturn(response,userService.getAllRobot());

	}
	@RequestMapping(value={"user/defaultrobot"})
	public String defaultrobot(Model model,HttpServletRequest request,HttpServletResponse response,String id) {

        Row user = (Row)request.getSession().getAttribute("user");

        HttpSession session = request.getSession();
		user = userService.findByStringId(user.getString("id"));
		userService.defaultRobot(id,user.getString("id"));

		user = userService.findByStringId(user.getString("id"));
		session.setAttribute("user", user);
		return ajaxReturn(response,user.getString("robotNo"));

	}
	@RequestMapping(value={"user/saveinfo"})
	public String saveinfo(Model model,HttpServletRequest request,HttpServletResponse response,String name,String phone,String description,String id) {

        Row user = (Row)request.getSession().getAttribute("user");

        HttpSession session = request.getSession();
		user = userService.findByStringId(user.getString("id"));
		userService.saveinfo(name, phone, description, user.getString("id"));

		user = userService.findByStringId(user.getString("id"));
		session.setAttribute("user", user);
		return ajaxReturn(response,1);

	}
}
