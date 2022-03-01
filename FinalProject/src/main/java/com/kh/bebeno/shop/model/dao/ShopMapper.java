package com.kh.bebeno.shop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.bebeno.shop.model.vo.Shop;

@Mapper
public interface ShopMapper {

	List<Shop> findAll();

}
