package pet.mvc.service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.WalkMapper;
import pet.mvc.walk.CmtVo;
import pet.mvc.walk.Comment;
import pet.mvc.walk.Walk;
import pet.mvc.walk.WalkListResult;
import pet.mvc.walk.WalkListVo;
import pet.mvc.walk.joinVo;

@Service
@Log4j
public class WalkServiceImpl implements WalkService {
	@Autowired
	private WalkMapper walkMapper;
	
	@Override
	public void insertWalk(Walk dto) {
		// 시간 > TimeStamp 변환
		String from = (dto.getTime())+":00.000";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-ddhh:mm:ss.SSS");
		Date parsedDate = null;
		Timestamp timestamp = null;
		try {
		    parsedDate = dateFormat.parse(from);
		    timestamp = new java.sql.Timestamp(parsedDate.getTime());
		    dto.setMember_number(1L); //임의 데이터, 로그인 연동되면 멤버번호로 받아야 함.
			dto.setWalk_date(timestamp);
		} catch(Exception e) {
			log.info("#insertWalk Exception : "+e);
		}
		walkMapper.insertWalk(dto);
	}
	@Override
	public void walkUpdate(Walk dto) {
		// 시간 > TimeStamp 변환
		String from = (dto.getTime())+":00.000";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-ddhh:mm:ss.SSS");
		Date parsedDate = null;
		Timestamp timestamp = null;
		try {
		    parsedDate = dateFormat.parse(from);
		    timestamp = new java.sql.Timestamp(parsedDate.getTime());
		    dto.setMember_number(1L); //임의 데이터, 로그인 연동되면 멤버번호로 받아야 함.
			dto.setWalk_date(timestamp);
		} catch(Exception e) {
			log.info("#walkUpdate exception : "+e);
		}
		walkMapper.walkUpdate(dto);
	}

	@Override
	public WalkListResult getListS(int cp, int ps, String orderType, String keyword) {
		// 임시로 넣은 값
			ps=5;
		log.info("이거들어가요!"+cp+ps+orderType+keyword);
		WalkListVo listVo = new WalkListVo(cp, ps, orderType, keyword);
		ArrayList<Walk> lists = walkMapper.getList(listVo);
		// Date 가공 (day/time으로 분기)
		for(Walk list:lists) {
			Date origin = list.getWalk_date();
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			DateFormat timeForm = new SimpleDateFormat("a hh시 mm분");
			String day = dayForm.format(origin);
			String time = timeForm.format(origin);
			list.setDay(day);
			list.setTime(time);
			log.info("시간나누는중~~~"+list.getTime());
		}
		/*
		<if test="orderType != null and !orderType.equals('')">
			<choose>
				<when test="orderType.equals('new')">
					order by WALK_RDATE desc) a
				</when>
				<otherwise>
					order by WALK_DATE) a
				</otherwise>
			</choose>
		</if>
		 */
		return new WalkListResult(cp, ps, walkMapper.totalWalk(orderType, keyword),lists);
	}


	@Override
	public Walk getWalk(long idx) {
		Walk dto = walkMapper.getWalk(idx);
		ArrayList<Comment> cmts = walkMapper.getWalkCmt(idx);
		ArrayList<Comment> joinCmts = walkMapper.getJoinCmt(idx);
		int apply = cmts.size();
		int join = joinCmts.size();
		int like = walkMapper.getWalkLike(idx);
		dto.setApply(apply);
		dto.setJoin(join);
		dto.setLike(like);
		dto.setNormalCmts(cmts);
		dto.setJoinCmts(joinCmts);
		log.info("###apply:"+apply+", join:"+join+", like:"+like);
		return dto;
	}

	@Override
	public CmtVo getWalkCmt(long idx) {
		ArrayList<Comment> normal = walkMapper.getWalkCmt(idx);
		ArrayList<Comment> join = walkMapper.getJoinCmt(idx);
		int applyCount = normal.size();
		int joinCount = join.size();
		CmtVo vo = new CmtVo(normal, join, applyCount, joinCount);
		return vo;
	}

	@Override
	public void insertWalkCmt(Comment dto) {
		dto.setMember_number(1L); //임의의 값
		walkMapper.insertWalkCmt(dto);
	}
	@Override
	public void walkDelete(long idx) {
		walkMapper.walkDelete(idx);
	}
	@Override
	public Comment getWalkCmtData(long idx) {
		Comment dto = walkMapper.getWalkCmtData(idx);
		return dto;
	}
	@Override
	public void insertWalkJoin(joinVo vo, long cmtIdx) {
		walkMapper.insertWalkJoin(vo);
		walkMapper.updateWalkCmt(cmtIdx);
	}
	@Override
	public long selectByCmtIdx(long cmtIdx) {
		Long memNo = walkMapper.selectByCmtIdx(cmtIdx);
		return memNo;
	}
	@Override
	public void addHeart(joinVo vo) {
		walkMapper.addHeart(vo);
	}
	@Override
	public int getWalkLike(long idx) {
		int likeCount = walkMapper.getWalkLike(idx);
		return likeCount;
	}

}
