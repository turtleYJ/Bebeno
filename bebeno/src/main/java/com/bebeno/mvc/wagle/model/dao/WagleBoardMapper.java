package com.bebeno.mvc.wagle.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bebeno.mvc.wagle.model.vo.Wagle;

@Mapper
public interface WagleBoardMapper {

	List<Wagle> getWagleList();

}
