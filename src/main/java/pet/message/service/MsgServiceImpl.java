package pet.message.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.concurrent.TimeUnit;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.member.vo.MemberVO;
import pet.message.vo.MemberReview;
import pet.message.vo.Msg;
import pet.message.vo.MsgListResult;
import pet.mvc.mapper.MessageMapper;
import pet.mvc.mapper.WalkMapper;

@AllArgsConstructor
@Service
@Log4j
public class MsgServiceImpl implements MsgService {
	MessageMapper msgMapper;
	WalkMapper walkMapper;
	
	// 최근 대화목록 리스트
	@Override
	public MsgListResult getAllMsgList(long member_number) {
		MsgListResult msgLists = new MsgListResult();
		// 대화상대 목록 가져오기
		ArrayList<Msg> lists = msgMapper.getAllMsgList(member_number);
		// 대화상대 프로필 사진 가져오기
		ArrayList<String> urls = new ArrayList<String>();
		for(Msg list : lists) {
			String url = "";
			if(list.getMember_number() == member_number) url = walkMapper.getWalkPic(list.getSender_number());
			else url = walkMapper.getWalkPic(list.getMember_number());
			urls.add(url);
		}
		// 지난 시간 구하기
		getTimes(lists);
		msgLists.setChatList(lists);
		msgLists.setChatPics(urls);
		return msgLists;
	}

	// 1:1 주고받은 메시지 
	@Override
	public MsgListResult getMsgList(long member_number, long sender_number) {
		MsgListResult msgLists = new MsgListResult();
		ArrayList<Msg> lists = msgMapper.getMsgList(member_number, sender_number);
		// 대화상대 프로필 사진 가져오기
		ArrayList<String> urls = new ArrayList<String>();
		for(Msg list : lists) {
			String url = walkMapper.getWalkPic(list.getMember_number());
			urls.add(url);
		}
		// 지난 시간 구하기
		getTimes(lists); 
		msgLists.setChatList(lists);
		msgLists.setChatPics(urls);
		return msgLists;
	}
	
	// 메시지 insert (= 보내기)
	@Override
	public void insertMsg(Msg msg) {
		msgMapper.insertMsg(msg);
	}
	
	// 경과 시간 구하는 로직 1, Date to Seconds
	public void getTimes(ArrayList<Msg> lists) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		String curDateStr = dateFormat.format(System.currentTimeMillis());
		ArrayList<Msg> times = new ArrayList<Msg>();
		Date curDate = null;
		try {
			curDate = dateFormat.parse(curDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for(Msg list : lists) {
			Date walkDate = list.getSenddate();
			long seconds = (curDate.getTime() - walkDate.getTime());
			String timeFormat = makeStrTime(seconds);
			list.setTime(timeFormat);
		}
	}
	// 경과 시간 구하는 로직 2, Seconds to String
	public String makeStrTime(long seconds) {
		long days = TimeUnit.MILLISECONDS.toDays(seconds);
		seconds -= TimeUnit.DAYS.toMillis(days);
        long hours = TimeUnit.MILLISECONDS.toHours(seconds);
        seconds -= TimeUnit.HOURS.toMillis(hours);
        long minutes = TimeUnit.MILLISECONDS.toMinutes(seconds);
        seconds -= TimeUnit.MINUTES.toMillis(minutes);
        StringBuilder sb = new StringBuilder(64);
        if(days != 0) {
	        sb.append(days);
	        sb.append("일 ");
        }else if(hours != 0) {
        	sb.append(hours);
            sb.append("시간 ");
        }else if((days == 0) && (hours == 0)){
        	sb.append(minutes);
            sb.append("분");
        }
        sb.append(" 전");
        return(sb.toString());
	}

	// 읽지 않은 메시지 개수 카운트
	@Override
	public long getUnreadMsg(long member_number) {
		long count = msgMapper.getUnreadMsg(member_number);
		return count;
	}
	// 읽음 처리 후, 읽지 않은 메시지 카운트
	@Override
	public long msgRead(long member_number, long sender_number) {
		msgMapper.msgRead(member_number, sender_number);
		long unread = getUnreadMsg(member_number);
		return unread;
	}
	
	// 최근 일주일 이내, 매칭된 산책이 있는지 검색
	@Override
	public MemberReview selectRecentWalk(long member_number, long walk_number) {
		// 회원 번호로 둘이 함께 한 산책 있는지 검사
		MemberReview review = msgMapper.selectRecentWalk(member_number, walk_number);
		// 산책후기 작성했는지 검사
		// 일주일 내 산책인지 검사
		if(review != null) {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String curDateStr = dateFormat.format(System.currentTimeMillis());
			String walkDateStr = dateFormat.format(review.getWalk_date());
			Date walkDate = null;
			Date curDate = null;
			try {
				curDate = dateFormat.parse(curDateStr);
				walkDate = dateFormat.parse(walkDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			long seconds = (curDate.getTime() - walkDate.getTime());
			long days = TimeUnit.MILLISECONDS.toDays(seconds);
			if(days > 7) return null;
			else {
				DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
				String day = dayForm.format(walkDate);
				review.setDay(day);
				return review;
			}
		}else return null;
	}
	
	// 산책 한줄평 작성, 트랜잭션
	@Override
	public void writeReview(MemberReview memberReview, long member_number) {
		// 주최/참가에 따라서, insert시 member_number를 변경해줌 (myBatis에서 분기하지 않으려고)
		if(memberReview.getWalk_number() == member_number) {// 내가 참가자일때
			long origin = memberReview.getMember_number();
			memberReview.setMember_number(member_number);
		}
		msgMapper.updateJoin(memberReview.getWalk_idx(),member_number);
		msgMapper.writeReview(memberReview);
	}

	// 대화 상대 이름 
	@Override
	public String getSenderName(long member_number) {
		String name = msgMapper.getSenderName(member_number);
		return name;
	}

	// 회원 검색 시, 해당 회원과의 최근 대화 뽑기
	@Override
	public Hashtable<String, Object> getMemberByName(long member_number, String member_name) {
		Hashtable<String, Object> map = new Hashtable<String, Object>();
		ArrayList<MemberVO> memberList = msgMapper.getMemberByName(member_name);
		ArrayList<Msg> msgList = new ArrayList<Msg>();
		ArrayList<String> memberUrls = new ArrayList<String>();
		// 검색된 이름을 가진 회원과의 최근대화+프로필사진 셋팅  
		for(MemberVO member : memberList) {
			String url = walkMapper.getWalkPic(member.getMember_number());
			memberUrls.add(url);
			Msg list = msgMapper.getRecentMsgByNumber(member_number, member.getMember_number());
			msgList.add(list);
		}
		map.put("memberList",memberList);
		map.put("msgList",msgList);
		map.put("memberUrls",memberUrls);
		map.put("memberName",member_name);
		return map;
	}

	@Override
	public String getSenderPic(long member_number) {
		String senderPic = walkMapper.getWalkPic(member_number);
		return senderPic;
	}

}
