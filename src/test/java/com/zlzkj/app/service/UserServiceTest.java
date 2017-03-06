package com.zlzkj.app.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.zlzkj.app.model.User;
import com.zlzkj.app.util.CustomerException;
import com.zlzkj.core.base.BaseSpringTest;
import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;
import com.zlzkj.core.sql.SQLBuilder;

import java.util.List;


public class UserServiceTest extends BaseSpringTest{

	protected Log logger = LogFactory.getLog(UserServiceTest.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SqlRunner sqlRunner;

	
	@Before
	public void init(){}
	
	
	//测试：增加对象
	@Test
	public void testAddUser() throws Exception {
		try{
			User user = new User();
			
			//user.setId(2);
			user.setAccount("111");
			
			try {
				userService.save(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e.getLocalizedMessage());
			}
			int newId = user.getId();
			logger.info("@crud.add >>>> new insert id:"+newId);
			Assert.assertTrue(newId>0);
		}catch (CustomerException e)
		{
			System.out.println(e.getMessage());
		}
	}

	
	//测试：更新对象
	@Test
	public void testUpdateUser() throws Exception {
		try{
			User user = new User();
			
			user.setId(7);
			user.setAccount("aaa");
			
			userService.update(user);
			
			user = userService.findById(user.getId());
			Assert.assertTrue(7==user.getId());
		}catch (CustomerException e)
		{
			System.out.println(e.getMessage());
		}
	}

	
	//测试：按id删除对象
	@Test
	public void testDeleteUser() throws Exception {
		try{
			//删除
			Integer id = 7;
			int affected = userService.delete(id);
			Assert.assertTrue(affected==1);
		}catch (CustomerException e)
		{
			System.out.println(e.getMessage());
		}
	}

	
	//测试：按id获取对象
	@Test
	public void testGetUserByKey() throws Exception {
		try{
			//查找
			Integer id = 1;
			User user = userService.findById(id);
			logger.info("@crud.find >>>> "+JSON.toJSONString(user));
			Assert.assertTrue(id==user.getId());
		}catch (CustomerException e)
		{
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 测试获取所有对象
	 */
	@Test
	public void selectAll(){
		
		List<User> userList = userService.findAll();
		
		for(User user:userList){
			logger.info("@selectAll >>>> listed user id:"+user.getId());
		}
		
		Assert.assertTrue(userList.size()>0);
		
	}
	
	/**
	 * 测试获取Row
	 */
	@Test
	public void select(){
		
		SQLBuilder sb = SQLBuilder.getSQLBuilder(User.class);
		String sql = sb.fields("*").where("id=#{0}").selectSql();
		List<Row> list = sqlRunner.select(sql,1);
		
		for(Row r:list){
			logger.info("@select >>>> users:"+JSON.toJSONString(r));
		}
		
		Assert.assertTrue(list.size()>0);
	}
	
	@Test
	public void find(){
		
		SQLBuilder sb = SQLBuilder.getSQLBuilder(User.class);
		String sql = sb.fields("*").where("id=#{0}").selectSql();
		Row row = sqlRunner.find(sql, 1);
		
		logger.info("@find >>>> user:"+JSON.toJSONString(row));
		
		Assert.assertTrue(row.getInt("id")==1);
		
	}
	
	@Test
	public void count(){
		SQLBuilder sb = SQLBuilder.getSQLBuilder(User.class);
		String sql = sb.fields("count(*)").selectSql();
		int count = sqlRunner.count(sql);
		
		logger.info("@count >>>> count:"+count);
		
		Assert.assertTrue(count>0);
		
	}

}
