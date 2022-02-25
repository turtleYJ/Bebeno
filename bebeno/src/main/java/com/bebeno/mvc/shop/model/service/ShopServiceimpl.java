package com.bebeno.mvc.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.shop.model.dao.ShopMapper;
import com.bebeno.mvc.shop.model.vo.Shop;

@Service
public class ShopServiceimpl implements ShopService {
	@Autowired
	private ShopMapper mapper;
	
	@Override
	public List<Shop> getShopList() {
				
		return mapper.findAll();
	}

	@Override
	public int save(Shop shop) {
		return 0;
	}

}
