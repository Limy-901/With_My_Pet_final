package pet.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import pet.shop.domain.LikeListVO;


public interface LikeListService {
	
	public void insertLikeList(LikeListVO dto); //찜하기리스트 추가
	/*List<LikeList> product_code(long member_number);
	List<LikeList> listLike(long member_number);
	void Likedelete(long product_code);
	void LikedeleteAll(long member_number);
	void Likeupdate(long product_code);
	int LikesumMoney(long product_code);
	int countProduct(long member_number, long product_code);
	void updateList(LikeList dto);
	void modifyList(LikeList dto); 
	List<LikeList> listLike1(long quantity);  
	*/
}

//public List<Article> getList();