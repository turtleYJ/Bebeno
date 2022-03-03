package com.bebeno.mvc.shop.model.service;

import java.util.List;

import com.bebeno.mvc.shop.model.vo.Shop;

public interface ShopService {

	List<Shop> getShopList(String shCate, String shRegionD1, String shKeyword);

	int save(Shop shop);

	Shop findShopByNo(int no);

}
