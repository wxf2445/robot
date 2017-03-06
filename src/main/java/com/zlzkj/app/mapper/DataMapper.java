package com.zlzkj.app.mapper;

import com.zlzkj.app.model.Data;
import java.util.List;

public interface DataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Data record);

    Data selectByPrimaryKey(Integer id);

    List<Data> selectAll();

    int countAll();

    int updateByPrimaryKey(Data record);
}