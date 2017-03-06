package com.zlzkj.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.mapper.DataMapper;
import com.zlzkj.app.model.Data;
import com.zlzkj.app.util.Page;
import com.zlzkj.app.util.PageView;
import com.zlzkj.app.util.RobotUtil;
import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;
import com.zlzkj.core.sql.SQLBuilder;
import com.zlzkj.core.util.Fn;

@Service
@Transactional
public class DataService {

	@Autowired
	private DataMapper mapper;
	
	@Autowired
	private SqlRunner sqlRunner;
	
	public Integer delete(Integer id){
		return mapper.deleteByPrimaryKey(id);
	}
	
	public Integer update(Data entity){
		return mapper.updateByPrimaryKey(entity);
	}
	
	public Integer save(Data entity) {
		
		return mapper.insert(entity);
	}
	
	public PageView findAll() {
		
		return new PageView(new Page(mapper.selectAll(),1));
	}

	
	public List<Data> findByType(String type) {
		return mapper.selectAll();
	}
	
	public Data findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	public List<Row> findBySQL(){
		
		String sql = SQLBuilder.getSQLBuilder(Data.class)
				.fields("*")
				.where("id=#{0}")
				.selectSql();
		
		System.out.println("sql==="+sql);
		
		return sqlRunner.select(sql,1);
	}

	public Page findDataByTypeAndPage(String type, String page ){

		int pagenum = Integer.parseInt(page);
		int start = (pagenum-1)*10;
		String tableName = "x_ph";
		if(type.equals(RobotUtil.TEMPERATURE))
			tableName = "x_temperature";
		else if(type.equals(RobotUtil.O2))
			tableName = "x_oxygen";
		
		String countsql = "select count(*) from "+tableName;
		
		String sql = "select id,date_format(time,'%Y-%m-%d %h:%m:%s') as time ,data,coordinate from "+tableName +" limit "+start+",10";
		
		
		return new Page(sqlRunner.select(sql,1),sqlRunner.count(countsql, 1),pagenum,10);
	}
	
	public Page findListDataByPage(String page,String starttime,String endtime){

		int pagenum = Integer.parseInt(page);
		int start = (pagenum-1)*10;
		
		String where = "";
		if(starttime!=null&&!starttime.equals("") && endtime!=null&&!endtime.equals(""))
			where = " where A.time > '"+starttime +"' and A.time < '"+endtime+"'";
		
		String countsql = "select count(*) from x_ph as A "+where;
		
		String sql = "select A.id,date_format(A.time,'%Y-%m-%d %h:%m:%s') as time ,A.data as ph,A.coordinate,B.data as temp,C.data as o2"
				+ " from x_ph as A"
				+ " left join x_temperature as B on A.id = B.id"
				+ " left join x_oxygen as C on A.id = C.id"
				+ " "+where
				+ " limit "+start+",10";
		
		return new Page(sqlRunner.select(sql,1),sqlRunner.count(countsql, 1),pagenum,10);
	}
	

	public int saveStandard(String temp,String o2,String ph){

		String sql = "update x_standard set value = '"+temp +"' where type='temp' ";
		sqlRunner.update(sql,1);
		sql = "update x_standard set value = '"+o2 +"' where type='o2' ";
		sqlRunner.update(sql,1);
		sql = "update x_standard set value = '"+ph +"' where type='ph' ";
		
		return sqlRunner.update(sql,1);
	}
	public Model getStandard(Model model){
		String sql = "select value from x_standard where type='temp' ";
		String [] temp = sqlRunner.select(sql,1).get(0).getString("value").replace("(", "").replace(")", "").split(",");
		model.addAttribute("temp_l",temp[0] );
		model.addAttribute("temp_r",temp[1]);
		sql = "select value from x_standard where type='o2' ";
		String [] o2 = sqlRunner.select(sql,1).get(0).getString("value").replace("(", "").replace(")", "").split(",");
		model.addAttribute("o2_l", o2[0]);
		model.addAttribute("o2_r", o2[1]);
		sql = "select value from x_standard where type='ph' ";
		String [] ph = sqlRunner.select(sql,1).get(0).getString("value").replace("(", "").replace(")", "").split(",");
		model.addAttribute("ph_l", ph[0]);
		model.addAttribute("ph_r", ph[1]);
		
		return model;
	}
	

	public Page getWarning(String page,String status){
		int pagenum = Integer.parseInt(page);
		String countsql = "select count(*) from x_warning ";
		String where = "";
		if(!status.equals("0"))
			where = "where status="+status;
		String sql = "select id,date_format(time,'%Y-%m-%d %h:%m:%s') as time ,type,recordId,status,description,content"
				+ " from x_warning "+where+" order by time desc limit "+(pagenum-1)*10+",10";
		
		return new Page(sqlRunner.select(sql,1),sqlRunner.count(countsql),pagenum,10);
	}

	public JSONObject positioning(String warningId,JSONObject jo){
		String sql = "select recordId,type from x_warning where id ="+warningId;
		Row warning = sqlRunner.select(sql, 1).get(0);
		String tableName = "x_oxygen";
		if(warning.getString("type").equals(RobotUtil.PH))
			tableName = "x_ph";
		else if(warning.getString("type").equals(RobotUtil.TEMPERATURE))
			tableName = "x_temperature";
		sql = "select A.mapImage,A.LT_coordinate,A.RB_coordinate,B.coordinate from x_area as A left join "+tableName +" as B on A.id = B.areaId where B.id ="+warning.getString("recordId");
		jo.put("area", sqlRunner.select(sql,1).get(0));
		return jo;
	}
	public int rewarn(String warningId){
		String sql = "update x_warning set status=1 where id="+warningId;
		return sqlRunner.update(sql, 1);
	}
	public int processing(String warningId){
		String sql = "update x_warning set status=2 where id="+warningId;
		return sqlRunner.update(sql, 1);
	}
	public int done(String warningId){
		String sql = "update x_warning set status=3 where id="+warningId;
		return sqlRunner.update(sql, 1);
	}
	public Row getWarningInfo(String warningId){
		String sql = "select * from x_warning where id="+warningId;
		return sqlRunner.select(sql, 1).get(0);
	}

	public Row newResult(JSONObject warningId){
		String sql = "select * from x_warning where id="+warningId;
		return sqlRunner.select(sql, 1).get(0);
	}

	public List<Row> getAllWarning(String robotId,String type,String start,String end){
		String time = "";
		if(!start.equals("")&&!end.equals(""))
			time = " and time>'"+start+"' && time<'"+end+"'";
		String tableName = "x_ph";
		if(type.equals(RobotUtil.O2)){
			tableName = "x_oxygen";
		}else if(type.equals(RobotUtil.TEMPERATURE)){
			tableName = "x_temperature";
		}
		String sql = "select * from x_robot where id="+robotId;
		String areaId = sqlRunner.select(sql, 1).get(0).getString("areaId");
		sql = "select * from "+tableName+" where status=0 and areaId="+areaId+time;
		return sqlRunner.select(sql, 1);
	}

	public Row getMapByRobotId(String robotId){
		String sql = "select A.mapImage,A.LT_coordinate,A.RB_coordinate from x_area as A "
				+ "left join x_robot as B on A.id = B.areaId where B.id ="+robotId;
		return sqlRunner.select(sql, 1).get(0);
	}


/*	public int insert(String type){
		String sql = "select * from x_warning where id="+warningId;
		return sqlRunner.select(sql, 1).get(0);
	}*/

	public List<Row> getPoints(String areaId){
		
		String sql = SQLBuilder.getSQLBuilder(Data.class)
				.fields("*")
				.where("id=#{0}")
				.selectSql();
		
		System.out.println("sql==="+sql);
		
		return sqlRunner.select(sql,1);
	}

	public String checkPh(String data){
		String sql = "select * from x_standard where type='ph'";
		String[] range = sqlRunner.select(sql, 1).get(0).getString("value").replace("(", "").replace(")", "").split(",");
		double min = Double.parseDouble(range[0]);
		double max = Double.parseDouble(range[1]);
		double double_data = Double.parseDouble(data);
		if(double_data<min)
			return "数据（ph值:"+data+"）过高";
		else if(double_data>max)
			return "数据（ph值:"+data+"）过低";
		else
			return "";
	}
	public String checkTemp(String data){
		String sql = "select * from x_standard where type='temp'";
		String[] range = sqlRunner.select(sql, 1).get(0).getString("value").replace("(", "").replace(")", "").split(",");
		double min = Double.parseDouble(range[0]);
		double max = Double.parseDouble(range[1]);
		double double_data = Double.parseDouble(data);
		if(double_data<min)
			return "数据（温度:"+data+"）过高";
		else if(double_data>max)
			return "数据（温度:"+data+"）过低";
		else
			return null;
	}
	public String checkO2(String data){
		String sql = "select * from x_standard where type='o2'";
		String[] range = sqlRunner.select(sql, 1).get(0).getString("value").replace("(", "").replace(")", "").split(",");
		double min = Double.parseDouble(range[0]);
		double max = Double.parseDouble(range[1]);
		double double_data = Double.parseDouble(data);
		if(double_data<min)
			return "数据（氧容量:"+data+"）过高";
		else if(double_data>max)
			return "数据（氧容量:"+data+"）过低";
		else
			return null;
	}



	public int newPh(String data,String coordinate,int status,String time){

		String sql = "insert into x_ph (data,coordinate,status,time) values('"+data+"','"+coordinate+"','"+status+"','"+time+"');";
				sqlRunner.update(sql,1);
				sql = "select last_insert_id();";
		return sqlRunner.select(sql,1).get(0).getInt("last_insert_id()");
	}


	public int newO2(String data,String coordinate,int status,String time){

		String sql = "insert into x_oxygen (data,coordinate,status,time) values('"+data+"','"+coordinate+"','"+status+"','"+time+"');";
		
		
		return sqlRunner.update(sql,1);
	}


	public int newTemp(String data,String coordinate,int status,String time){

		String sql = "insert into x_temperature (data,coordinate,status,time) values('"+data+"','"+coordinate+"','"+status+"','"+time+"');";
		
		
		return sqlRunner.update(sql,1);
	}

	public int newWarning(String type,String time,String content,int recordId){

		String sql = "insert into x_warning (type,status,time,content,recordId) "
				+ "values('"+type+"','1','"+time+"','"+content+"','"+recordId+"');";
		
		
		return sqlRunner.update(sql,1);
	}

	public Row getLastWarning(){
		
		String sql = "select * from x_warning where id in(select last_insert_id());";
		
		//System.out.println("sql==="+sql);
		if(sqlRunner.select(sql,1).size()>0)
			return sqlRunner.select(sql,1).get(0);
		return new Row();
	}
}

