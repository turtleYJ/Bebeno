package com.bebeno.mvc.shop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bebeno.mvc.shop.model.vo.Shop;

@Mapper
public interface ShopMapper {

	List<Shop> findAll();
}
