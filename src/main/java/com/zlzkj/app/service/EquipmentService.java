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
public class EquipmentService {

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
	public int AddArea(String no,String description){
		String sql = "insert into x_area (areaNo,description) values('"+no+"','"+description+"')";
		return sqlRunner.update(sql, 1);
	}
	public Page getArea(String page){
		int pagenum = Integer.parseInt(page);
		int start = (pagenum-1)*10;
		String countsql = "select count(*) from x_area ";
		String sql = "select id,date_format(createtime,'%Y-%m-%d %h:%m:%s') as createtime ,description,areaNo from x_area limit "+start+",10";
		return new Page(sqlRunner.select(sql, 1),sqlRunner.count(countsql, 1),pagenum,10);
	}
	public JSONObject getInfo(JSONObject jo,String id){
		String sql = "select id,areaNo,description from x_area where id="+id;
		Row row = sqlRunner.select(sql, 1).get(0);
		jo.put("areaNo", row.getString("areaNo"));
		jo.put("description", row.getString("description"));
		jo.put("id", row.getString("id"));
		return jo;
	}
	public int updateArea(String id,String no,String description){
		String sql = "update x_area set areaNo='"+no+"',description='"+description+"' where id ="+id;
		return sqlRunner.update(sql, 1);
	}
	public String getMap(String id){
		String sql = "select * from x_area where id ="+id;
		return  (String) sqlRunner.select(sql, 1).get(0).get("mapImage");
	}

	public int deleteArea(String id){
		String sql = "delete from x_area where id ="+id;
		return  sqlRunner.update(sql, 1);
	}

	public int setMapImage(String id,String mapImage,String LT_coordinate,String RB_coordinate){
		String sql = "update x_area set mapImage='"+mapImage+"',LT_coordinate='"+LT_coordinate+"',RB_coordinate='"+RB_coordinate+"' where id = "+id;
		//System.out.println(sql);
		return sqlRunner.update(sql, 1);
	}
	

	public Page getRobot(String page){
		int pagenum = Integer.parseInt(page);
		int start = (pagenum-1)*10;
		String countsql = "select count(*) from x_robot ";
		String sql = "select A.id,A.description,A.areaId,A.robotIp,A.robotNo,B.areaNo from x_robot as A "
				+ "left join x_area as B on A.areaId = B.id limit "+start+",10";
		return new Page(sqlRunner.select(sql, 1),sqlRunner.count(countsql, 1),pagenum,10);
	}

	public JSONObject getRobotInfo(JSONObject jo,String id){
		String sql = "select id,robotNo,description from x_robot where id="+id;
		Row row = sqlRunner.select(sql, 1).get(0);
		jo.put("id", row.getString("id"));
		jo.put("robotNo", row.getString("robotNo"));
		jo.put("description", row.getString("description"));

		sql = "select id,areaNo,description from x_area ";
		jo.put("areas", sqlRunner.select(sql, 1));
		return jo;
	}

	public JSONObject getRobotArea(JSONObject jo){
		String sql = "select id,areaNo,description from x_area ";
		jo.put("areas", sqlRunner.select(sql, 1));
		return jo;
	}
	public int addRobot(String no,String description,String robotIp){
		String sql = "insert into x_robot (robotNo,description,robotIp) values('"+no+"','"+description+"','"+robotIp+"')";
		return sqlRunner.update(sql, 1);
	}

	public List<Row> getAllRobotByAreaId(String areaId){
		
		String where = "";
		if(!areaId.equals("0")){
			where = "where areaId="+areaId;
		}
		String sql = "select * from x_robot "+where;
		return sqlRunner.select(sql, 1);
	}
}

