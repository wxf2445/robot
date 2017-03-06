package com.zlzkj.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.app.mapper.WarningMapper;
import com.zlzkj.app.model.Warning;

@Service
@Transactional
public class WarningService {

	@Autowired
	private WarningMapper warningMapper;
	
/*	@Autowired
	private SqlRunner sqlRunner;*/
	
	public Integer delete(Integer id){
		return warningMapper.deleteByPrimaryKey(id);
	}
	
	public Integer update(Warning entity){
		return warningMapper.updateByPrimaryKey(entity);
	}
	
	public Integer save(Warning entity) {
		
		return warningMapper.insert(entity);
	}
	
	public List<Warning> findAll() {
		return warningMapper.selectAll();
	}
	
	public List<Warning> findWarningByStatus() {
		return warningMapper.selectByStatus();
	}
	
	public Warning findById(Integer id){
		return warningMapper.selectByPrimaryKey(id);
	}
	
/*	public List<Row> findBySQL(){
		
		String sql = SQLBuilder.getSQLBuilder(Warning.class)
				.fields("*")
				.where("id=#{0}")
				.selectSql();
		
		System.out.println("sql==="+sql);
		
		return sqlRunner.select(sql,1);
	}*/
	
}

