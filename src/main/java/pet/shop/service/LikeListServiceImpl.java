package pet.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.LikelistMapper;
import pet.shop.domain.Product;

@Service
@Log4j
public class LikeListServiceImpl implements LikeListService {
	
@Autowired
	private LikelistMapper likelistMapper;
	
	// 찜 목록 추가
	@Override
	public void insertLikeList(long member_number, long product_code) {
		log.info("###### member_number:"+member_number+", product_code:"+product_code);
		likelistMapper.insertLikeList(member_number, product_code);
		log.info("###### 완료!");
	}

	// 찜한 목록 리스트
	@Override
	public ArrayList<Product> getLikeList(long member_number) {
		ArrayList<Long> lists = likelistMapper.getLikeList(member_number);
		ArrayList<Product> productList = new ArrayList<Product>();
		for(Long list : lists) {
			Product product = likelistMapper.getProduct(list);
			productList.add(product);
		}
		log.info("###### 검색된 좋아요 리스트"+productList);
		return productList;
	}

	// 추천 리스트
	@Override
	public ArrayList<Product> getCommendList() {
		ArrayList<Product> list = likelistMapper.getCommendList();
		return list;
	}
}