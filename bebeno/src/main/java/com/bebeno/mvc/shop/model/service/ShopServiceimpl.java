package com.bebeno.mvc.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.shop.model.dao.ShopMapper;
import com.bebeno.mvc.shop.model.vo.ContentFiles;
import com.bebeno.mvc.shop.model.vo.Shop;

@Service
public class ShopServiceimpl implements ShopService {
	@Autowired
	private ShopMapper mapper;
	
	@Override
	public List<Shop> getShopList(String shCate, String shRegionD1, String shKeyword) {
		
		return mapper.findAll(shCate, shRegionD1, shKeyword);
	}

	@Override
	@Transactional
	public int save(Shop shop) {
		int result = 0;
		
		if(shop.getNo() != 0) {
//			result = mapper.updateBoard(shop);
		} else {
			result = mapper.insertShop(shop);
		}
		
		return result;
	}

	@Override
	public Shop findShopByNo(int no) {
		
		return mapper.selectShopByNo(no);
	}

	@Override
	@Transactional
	public void fileSave(ContentFiles file) {
		
		mapper.savefile(file);
		
	}

	@Override
	public List<ContentFiles> findfilesByNo(int no) {
		
		return mapper.selectfilesByNo(no);
	}

}
