package com.zlzkj.app.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import chat.ChatHandler;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.service.DataService;
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
public class DataController extends BaseController{

	@Autowired
	private DataService dataService;
	@Autowired
	private WarningService warningService;
	

	@RequestMapping(value={"data/getdata"})
	public String getdata(Model model,HttpServletRequest request,HttpServletResponse response,String type,String page) {
		
		JSONObject jo = new JSONObject();
		jo.put("datas", new PageView(dataService.findDataByTypeAndPage(type, page)));
		return ajaxReturn(response,jo,"",1);

	}
	@RequestMapping(value={"data/getlistdata"})
	public String getlistdata(Model model,HttpServletRequest request,HttpServletResponse response,String type,String page,
			String starttime,String endtime) {
		
		JSONObject jo = new JSONObject();
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date start = null;
		java.util.Date end = null; 
		if(starttime!=null&&!starttime.equals("")&&endtime!=null&&!endtime.equals("")){
			try {
				start = sdf.parse(starttime);
				end=sdf.parse(endtime); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		  
		jo.put("datas", new PageView(dataService.findListDataByPage(page,starttime,starttime)));
		return ajaxReturn(response,jo,"",1);

	}
	

	@RequestMapping(value={"data/standard"})
	public String standard(Model model,HttpServletRequest request,HttpServletResponse response,
			String temp,String o2,String ph) {
		
		JSONObject jo = new JSONObject();
		jo.put("status", dataService.saveStandard(temp, o2, ph));
		return ajaxReturn(response,jo,"",1);

	}

	@RequestMapping(value={"file/openfile"})
	public void getFile(Model model,HttpServletRequest request,HttpServletResponse response,String filepath) throws IOException {
		

		filepath = URLDecoder.decode(filepath, "utf-8");
	    filepath = new String(filepath.getBytes("iso-8859-1"), "utf-8");
	    File file = new File(RobotUtil.FILE_SERVER + filepath);
	    FileInputStream in = new FileInputStream(file);
	    OutputStream o = response.getOutputStream();
	    //response.setHeader("Content-Disposition","attachment;filename=" + file.getName());

	        int l = 0;
	        byte[] buffer = new byte[in.available()];
	        while ((l = in.read(buffer)) != -1) {
	            o.write(buffer, 0, l);
	        }
	        o.flush();
	        in.close();
	        o.close();

	}



	@RequestMapping(value={"warning/getwarning"})
	public String getwarning(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String status) {
		return ajaxReturn(response,new PageView(dataService.getWarning(page,status)));

	}


	@RequestMapping(value={"warning/positioning"})
	public String positioning(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {
		JSONObject jo = new JSONObject();
		return ajaxReturn(response,dataService.positioning(id,jo));

	}
	@RequestMapping(value={"warning/rewarn"})
	public String rewarn(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {
		JSONObject jo = new JSONObject();
		dataService.rewarn(id);
		jo.put("warning", dataService.getWarningInfo(id));
		try {
			new ChatHandler().broadCast(jo.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ajaxReturn(response,1);

	}
	@RequestMapping(value={"warning/processing"})
	public String processing(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {
		JSONObject jo = new JSONObject();
		dataService.processing(id);
		jo.put("warning", dataService.getWarningInfo(id));
		try {
			new ChatHandler().broadCast(jo.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ajaxReturn(response,1);

	}
	@RequestMapping(value={"warning/done"})
	public String done(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {

		JSONObject jo = new JSONObject();
		dataService.done(id);
		jo.put("warning", dataService.getWarningInfo(id));
		try {
			new ChatHandler().broadCast(jo.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ajaxReturn(response,1);

	}
	@RequestMapping(value={"warning/getmapbysession"})
	public String getmapbysession(Model model,HttpServletRequest request,HttpServletResponse response) {
		String robotId = ((Row)request.getSession().getAttribute("user")).getString("robotId");
		return ajaxReturn(response,dataService.getMapByRobotId(robotId));

	}
	@RequestMapping(value={"warning/getwarningpoint"})
	public String getwarningpoint(Model model,HttpServletRequest request,HttpServletResponse response,String type,String start,String end) {
		String robotId = ((Row)request.getSession().getAttribute("user")).getString("robotId");
		return ajaxReturn(response,dataService.getAllWarning(robotId,type,start,end));

	}
}
