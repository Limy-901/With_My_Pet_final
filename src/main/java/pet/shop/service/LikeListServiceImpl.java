package pet.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.LikeListMapper;
import pet.shop.domain.LikeListVO;

@Service
@Log4j
public class LikeListServiceImpl implements LikeListService {
	
@Autowired
	private LikeListMapper likelistMapper;
	
	@Override
	public void insertLikeList(LikeListVO dto) {
		log.info("######"+dto);
		likelistMapper.insertLikeList(dto);
		
	}
}
	/*@Override
	public List<LikeList> product_code(long member_number) {
		return null;
	}

	@Override
	public List<LikeList> listLike(long member_number) {
		return null;
	}

	@Override
	public void Likedelete(long product_code) {
		((SqlSession) likelistMapper).delete("LikeList.Likedelete", product_code);
	}

	@Override
	public void LikedeleteAll(long member_number) {
		sqlSession.delete("LikeList.LikedeleteAll", member_number);
	}

	@Override
	public void Likeupdate(long product_code) {
		sqlSession.delete("LikeList.Likeupdate", product_code);
	}

	@Override
	public int LikesumMoney(long product_code) {
		return sqlSession.selectOne("LikeList.LikesumMoney",product_code);

	}

	@Override
	public int countProduct(long member_number, long product_code) {
		
		return 0;
	}

	@Override
	public void updateList(LikeList dto) {
		
	}

	@Override
	public void modifyList(LikeList dto) {
		sqlSession.update("LikeList.modifyList", dto);
	}

	@Override
	public List<LikeList> listLike1(long quantity) {
		
		return null;
	} */
	

	



/*@Override
	public abstract void addLikeList() throws Exception; {
		long product_code = 0;
		likeListMapper.likeListinsert(product_code);
	} 
}
*/
/*public void addLikeList(long product_code) throws Exception {
likeListMapper.likeListinsert(product_code);
}*/


//정확하게 구현을 다 해주는 곳
//서비스는 인터페이스 // IMPL은 구현하는공간 
//MAPPER.XML은 어떻게 구현할껀지 디비 틀을 만들어주는 곳
//controller는 뷰 연결만 시켜주는 곳
//jsp view는 화면 연결 시켜주는 곳
//서비스임플 = 자바로직을 짜는 공간 
