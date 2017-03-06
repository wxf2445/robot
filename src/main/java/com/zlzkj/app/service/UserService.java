package com.zlzkj.app.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.mapper.UserMapper;
import com.zlzkj.app.model.User;
import com.zlzkj.app.util.Page;
import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;
import com.zlzkj.core.sql.SQLBuilder;
import com.zlzkj.core.util.Fn;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private SqlRunner sqlRunner;
	
	public Integer delete(Integer id){
		return mapper.deleteByPrimaryKey(id);
	}
	
	public Integer update(User entity){
		return mapper.updateByPrimaryKey(entity);
	}
	
	public Integer save(User entity) {
		
		return mapper.insert(entity);
	}

	public List<User> findAll() {
		return mapper.selectAll();
	}
	public Page findAllByPage(String page) {
		int pagenum = Integer.parseInt(page);
		String countsql = "    select count(*) from x_user";
		
		String sql = "    select A.id, A.name,A.phone,A.description,A.headImage,B.name as roleName from x_user as A "
					+ " left join x_role as B on A.roleId = B.id limit "+(pagenum-1)*10+",10";
		return new Page(sqlRunner.select(sql, 1),sqlRunner.count(countsql, 1),pagenum,10);
	}
	
	public User findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	public List<Row> findBySQL(){
		
		String sql = SQLBuilder.getSQLBuilder(User.class)
				.fields("*")
				.where("id=#{0}")
				.selectSql();
		
		System.out.println("sql==="+sql);
		
		return sqlRunner.select(sql,1);
	}

	public JSONObject getUserInfo(JSONObject jo,String id){
		String sql = "select id,name,phone,roleId,description from x_user where id="+id;
		Row row = sqlRunner.select(sql, 1).get(0);
		jo.put("id", row.getString("id"));
		jo.put("name", row.getString("name"));
		jo.put("phone", row.getString("phone"));
		jo.put("roleId", row.getString("roleId"));
		jo.put("description", row.getString("description"));

		sql = "select id,name from x_role ";
		jo.put("roles", sqlRunner.select(sql, 1));
		return jo;
	}
	

	public int saveUser(String id,String name,String phone,String roleId,String description){
		String sql = "update x_user set name='"+name+"',phone='"+phone+"',roleId='"+roleId+"',description='"+description+"' where id="+id;
		return sqlRunner.update(sql, 1);
	}
	public List<Row> getroles(){
		String sql = "select * from x_role";
		return sqlRunner.select(sql, 1);
	}
	public int addUser(String name,String phone,String roleId,String description,String account,String password){
		String sql = "insert into x_user (name,phone,roleId,description,account,password) "
				+ "values('"+name+"','"+phone+"','"+roleId+"','"+description+"','"+account+"','"+password+"')";
		return sqlRunner.update(sql, 1);
	}

	public Page getRole(String page){
		int pagenum = Integer.parseInt(page);
		String countsql = "select count(*) from x_role";
		
		String sql = "select * from x_role limit "+(pagenum-1)*10+",10";
		return new Page(sqlRunner.select(sql, 1),sqlRunner.count(countsql, 1),pagenum,10);
	}
	public Row getRoleInfo(String id){
		String sql = "select * from x_role where id="+id;
		return sqlRunner.select(sql, 1).get(0);
	}
	public int addRole(String name,String description){
		String sql = "insert into x_role (name,description) values('"+name+"','"+description+"')";
		return sqlRunner.update(sql, 1);
	}

	public List<Row> checkLogin(String account,String password){
		String sql = "select x_user.*,x_robot.robotNo from x_user  left join x_robot on x_user.robotId = x_robot.id where account='"+account+"' and password='"+password+"'";
		return sqlRunner.select(sql, 1);
	}

	public int changeHeadImage(String id,String headImage){
		String sql = "update x_user set headImage='"+headImage+"' where id="+id;
		return sqlRunner.update(sql, 1);
	}
	public Row findByStringId(String id){
		String sql = "select x_user.*,x_robot.robotNo from x_user left join x_robot on x_user.robotId = x_robot.id where x_user.id="+id;
		return sqlRunner.select(sql, 1).get(0);
	}

	public List<Row> getAllRobot(){
		String sql = "select * from x_robot ";
		return sqlRunner.select(sql, 1);
	}

	public int defaultRobot(String robotId,String id){
		String sql = "update x_user set robotId='"+robotId+"' where id="+id;
		return sqlRunner.update(sql, 1);
	}
	
	public int saveinfo(String name,String phone,String description,String id){
		String sql = "update x_user set name='"+name+"',phone='"+phone+"',description='"+description+"' where id="+id;
		return sqlRunner.update(sql, 1);
	}
	
}

