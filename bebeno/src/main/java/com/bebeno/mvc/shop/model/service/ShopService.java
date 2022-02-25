package com.bebeno.mvc.shop.model.service;

import java.util.List;

import com.bebeno.mvc.shop.model.vo.Shop;

public interface ShopService {

	List<Shop> getShopList();

	int save(Shop shop);

}
