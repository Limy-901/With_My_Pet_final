package pet.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import pet.shop.domain.Product;


public interface LikeListService {
	public ArrayList<Product> getLikeList(long member_number);
	public void insertLikeList(long member_number, long product_code); 
	public ArrayList<Product> getCommendList();
}