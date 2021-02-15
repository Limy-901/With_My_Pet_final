package pet.mvc.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.WalkMapper;
import pet.mvc.walk.Comment;
import pet.mvc.walk.Walk;
import pet.mvc.walk.WalkListResult;
import pet.mvc.walk.WalkListVo;

@Service
@Log4j
public class WalkServiceImpl implements WalkService {
	@Autowired
	private WalkMapper walkMapper;
	
	@Override
	public void insertWalk(Walk dto) {
		// 시간 > TimeStamp 변환
		String from = (dto.getTime())+":00.000";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Date parsedDate = null;
		Timestamp timestamp = null;
		try {
		    parsedDate = dateFormat.parse(from);
		    timestamp = new java.sql.Timestamp(parsedDate.getTime());
		    dto.setMember_number(1L); //임의 데이터, 로그인 연동되면 멤버번호로 받아야 함.
			dto.setWalk_date(timestamp);
		} catch(Exception e) {
			log.info("e:"+e);
		}
		log.info("최종:"+dto);
		walkMapper.insertWalk(dto);
	}
	@Override
	public void walkUpdate(Walk dto) {
		// 시간 > TimeStamp 변환
		String from = (dto.getTime())+":00.000";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Date parsedDate = null;
		Timestamp timestamp = null;
		try {
		    parsedDate = dateFormat.parse(from);
		    timestamp = new java.sql.Timestamp(parsedDate.getTime());
		    dto.setMember_number(1L); //임의 데이터, 로그인 연동되면 멤버번호로 받아야 함.
			dto.setWalk_date(timestamp);
		} catch(Exception e) {
			log.info("e:"+e);
		}
		log.info("##서비스로 온 update값:"+dto);
		walkMapper.walkUpdate(dto);
	}

	@Override
	public WalkListResult getListS(int cp, int ps, String orderType, String keyword) {
		// 임시로 넣은 값
		ps=5;
		orderType="soon";
		keyword="";
		log.info("## DB 뽑을 값 cp: "+cp+", orderType: "+orderType+", keyword: "+keyword);
		WalkListVo listVo = new WalkListVo(cp, ps, orderType, keyword);
		ArrayList<Walk> list = walkMapper.getList(listVo);
		return new WalkListResult(cp, ps, walkMapper.totalWalk(orderType, keyword),list);
	}


	@Override
	public Walk getWalk(long idx) {
		log.info("서비스로 넘어온 idx값"+idx);
		Walk dto = walkMapper.getWalk(idx);
		log.info("DB에서뽑은 dto:"+dto);
		ArrayList<Comment> cmts = walkMapper.getWalkCmt(idx);
		dto.setCmts(cmts);
		log.info(dto.getCmts());
		return dto;
	}


	@Override
	public ArrayList<Comment> getWalkCmt(long idx) {
		log.info("서비스로 넘어온 cmt에 쓸 idx값"+idx);
		ArrayList<Comment> cmts = walkMapper.getWalkCmt(idx);
		log.info("DB에서뽑아온 CMT dto:"+cmts);
		return cmts;
	}


	@Override
	public void insertWalkCmt(Comment dto) {
		log.info("#서비스로 넘어온 dto : "+dto);
		walkMapper.insertWalkCmt(dto);
	}
	@Override
	public void walkDelete(long idx) {
		log.info("##del.do로 넘어온 idx"+idx);
		walkMapper.walkDelete(idx);
	}



}
