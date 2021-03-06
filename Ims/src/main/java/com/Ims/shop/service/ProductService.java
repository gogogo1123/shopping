package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.ProductDao;
import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.ProductVo;

@Service
public class ProductService {
	
	
	private ProductDao productDao;
	
	
	
	@Autowired
	public ProductService(ProductDao productDao) {
		this.productDao = productDao;
	}

	
	
	public void insert(ProductVo vo) {
		productDao.insert(vo);
	}
	
	public List<ProductVo> list(){
		return productDao.list();
	}
	
	
	public ProductVo detail(int product_code) {
		return productDao.detail(product_code);
	}
	
	public void update(ProductVo vo) {
		productDao.update(vo);
	}
	
	
	public String file_info(int product_code) {
		return productDao.file_info(product_code);
	}
	
	public void delete(Integer product_code) {
		productDao.delete(product_code);
	}
	
	
	
	public int ProductListCnt(Criteria cri){       //??ǰ ????
		return productDao.ProductListCnt(cri);
	}
	
	
	public List<Map<String, Object>> Productlist(Criteria cri) throws Exception{
		return productDao.productlist(cri);
	}
	
	
	public List<ProductVo> top5(){
		return productDao.top5();
	}
}
