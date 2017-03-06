package com.zlzkj.app.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.service.DataService;
import com.zlzkj.app.service.EquipmentService;
import com.zlzkj.app.service.HandleService;
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
public class EquipmentController extends BaseController{

	@Autowired
	private DataService dataService;
	@Autowired
	private HandleService handleService;
	@Autowired
	private EquipmentService equipmentService;
	

	@RequestMapping(value={"area/add"})
	public String getdata(Model model,HttpServletRequest request,HttpServletResponse response,
			String no,String description) {
		
		JSONObject jo = new JSONObject();
		jo.put("status", equipmentService.AddArea(no, description));
		return ajaxReturn(response,jo,"",1);

	}

	@RequestMapping(value={"area/delete"})
	public String deleteArea(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {
		
		return ajaxReturn(response,equipmentService.deleteArea(id),"",1);

	}
	@RequestMapping(value={"area/getarea"})
	public String getarea(Model model,HttpServletRequest request,HttpServletResponse response,
			String page) {
		
		JSONObject jo = new JSONObject();
		jo.put("datas", new PageView(equipmentService.getArea(page)));
		return ajaxReturn(response,jo,"",1);

	}
	@RequestMapping(value={"area/getinfo"})
	public String getinfo(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {
		
		JSONObject jo = new JSONObject();
		return ajaxReturn(response,equipmentService.getInfo(jo,id),"",1);

	}
	@RequestMapping(value={"area/savechange"})
	public String savechange(Model model,HttpServletRequest request,HttpServletResponse response,
			String id,String no,String description) {
		
		JSONObject jo = new JSONObject();
		return ajaxReturn(response,equipmentService.updateArea(id, no, description),"",1);

	}
	@RequestMapping(value={"area/getmap"})
	public String getmap(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {
		
		return ajaxReturn(response,equipmentService.getMap(id),"",1);

	}
	@RequestMapping(value={"area/savemap"})
	public String savemap(Model model,HttpServletRequest request,HttpServletResponse response,
			String id,String center,int width,int height,String lefttop_coordinate,String rightbottom_coordinate) {
		//120.350576,30.316635
	    BufferedImage image = null;    
	    try {    
	        URL url = new URL("http://api.map.baidu.com/staticimage?center="+center+"&zoom=19&height="+height*1.4+"&width="+width+"&copyright=1");    
	        image = ImageIO.read(url);  
	        
	        File f = new File(RobotUtil.FILE_SERVER);
	        if(!f.exists()&& !f .isDirectory()){
	        	f.mkdir();
	        }
	        
	        String oldfile = equipmentService.getMap(id);
	        File f2 = new File(RobotUtil.FILE_SERVER +oldfile);
	        if(f2.exists())
	        	f2.delete();
	        
	        String filename = "mapImage"+System.currentTimeMillis()+".png";
	        ImageIO.write(image.getSubimage(0, (int)(height*0.17),(int) (width*0.97) ,(int) (height*1.03)), "png", new File(RobotUtil.FILE_SERVER +filename)); 
	        equipmentService.setMapImage(id, filename,lefttop_coordinate,rightbottom_coordinate);
	        
	    } catch (IOException e) {    
	        e.printStackTrace();    
			return ajaxReturn(response,-1,"",1);
	    }    
		return ajaxReturn(response,1,"",1);

	}

	@RequestMapping(value={"robot/getrobot"})
	public String getrobot(Model model,HttpServletRequest request,HttpServletResponse response,
			String page) {

		JSONObject jo = new JSONObject();
		jo.put("datas", new PageView(equipmentService.getRobot(page)));
		return ajaxReturn(response,jo,"",1);

	}
	@RequestMapping(value={"robot/getrobotbyarea"})
	public String getrobotbyarea(Model model,HttpServletRequest request,HttpServletResponse response,
			String areaId) {
		return ajaxReturn(response,equipmentService.getAllRobotByAreaId(areaId));

	}

	@RequestMapping(value={"robot/getrobotinfo"})
	public String getrobotinfo(Model model,HttpServletRequest request,HttpServletResponse response,
			String id) {

		JSONObject jo = new JSONObject();
		return ajaxReturn(response,equipmentService.getRobotInfo(jo,id),"",1);

	}
	@RequestMapping(value={"robot/getarea"})
	public String getarea(Model model,HttpServletRequest request,HttpServletResponse response) {

		JSONObject jo = new JSONObject();
		return ajaxReturn(response,equipmentService.getRobotArea(jo),"",1);

	}
	@RequestMapping(value={"robot/add"})
	public String robotadd(Model model,HttpServletRequest request,HttpServletResponse response,
			String no,String description,String robotIp) {

		return ajaxReturn(response,equipmentService.addRobot(no, description, robotIp),"",1);

	}

	@RequestMapping(value={"robot/check"})
	public String robotcheck(Model model,HttpServletRequest request,HttpServletResponse response) {
		/*handleService.setCheck_user("11");*/
		return ajaxReturn(response,1,"",1);

	}

}
