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
		int result = 0;
		
		if(shop.getNo() != 0) {
//			result = mapper.updateBoard(shop);
		} else {
			result = mapper.insertShop(shop);
		}
		
		return result;
	}

}
