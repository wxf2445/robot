package com.zlzkj.app.mapper;

import com.zlzkj.app.model.Warning;
import java.util.List;

public interface WarningMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Warning record);

    Warning selectByPrimaryKey(Integer id);

    List<Warning> selectAll();

    List<Warning> selectByStatus();

    int updateByPrimaryKey(Warning record);
}