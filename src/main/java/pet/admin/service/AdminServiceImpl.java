package pet.admin.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.concurrent.TimeUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;
import pet.admin.vo.BestSeller;
import pet.admin.vo.MemListResult;
import pet.admin.vo.MemberOption;
import pet.admin.vo.MemberWalkChart;
import pet.admin.vo.OrderStatus;
import pet.admin.vo.PayData;
import pet.admin.vo.Qna;
import pet.admin.vo.WeeklyData;
import pet.member.vo.MemberVO;
import pet.mvc.board.Board;
import pet.mvc.mapper.AdminMapper;
import pet.mvc.mapper.WalkMapper;
import pet.walk.vo.Walk;

import static pet.admin.vo.Options.*;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	@Autowired
	private WalkMapper walkMapper;

	@Override
	public long getTotalMember() {
		long totalMember = mapper.getTotalMember();
		return totalMember;
	}

	@Override
	public long getNewMember() {
		long newMember = mapper.getNewMember();
		return newMember;
	}

	@Override
	public long getTodayIncome() {
		long todayIncome = mapper.getTodayIncome();
		return todayIncome;
	}

	public Hashtable<String, Object> getIndexData() {
		Hashtable<String, Object> map = new Hashtable<String, Object>();
		// 신규 멤버 통계
		long newMember = mapper.getNewMember();
		// 총 회원 통계
		long totalMember = mapper.getTotalMember();
		// 일일 매출
		long todayIncome = mapper.getTodayIncome();
		// 매칭 성사 퍼센트
		String matchPer = getMatchPer();
		// 주간 통계
		Hashtable<String, Object> allList = getWeeklyData();
		// 신규 가입 멤버
		ArrayList<MemberVO> newMemList = mapper.getNewMemList();
		ArrayList<String> PicList = new ArrayList<String>();
		ArrayList<String> payPicList = new ArrayList<String>();
		// 베스트 셀러
		ArrayList<BestSeller> bestSeller = mapper.getBestSeller();
		for(MemberVO member : newMemList) {
			String url = walkMapper.getWalkPic(member.getMember_number());
			member.setMember_fname(url);
		}
		// 최근 판매 통계
		ArrayList<PayData> payData = mapper.getPayData();
		for(PayData data : payData) {
			String url = walkMapper.getWalkPic(data.getMember_number());
			payPicList.add(url);
			Date origin = data.getLogin_date();
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			String day = dayForm.format(origin);
			data.setLogin(day);
		}
		map.put("newMember",newMember);
		map.put("totalMember",totalMember);
		map.put("todayIncome",todayIncome);
		map.put("matchPer",matchPer);
		map.put("allList",allList);
		map.put("newMemList",newMemList);
		map.put("bestSeller",bestSeller);
		map.put("payData",payData);
		map.put("payPicList",payPicList);
		return map;
	}
	
	public String getMatchPer() {
		long allWalk = mapper.getTotalWalk();
		String allWalkStr = String.valueOf(allWalk);
		long allJoin = mapper.getTotalJoin();
		String allJoinStr = String.valueOf(allJoin);
		Double walkD = Double.parseDouble(allWalkStr);
		Double joinD = Double.parseDouble(allJoinStr);
		Double.parseDouble(allJoinStr);
		double per = joinD / walkD * 100.0;
		String percent = per+"%";
		return percent;
	}
	
	public Hashtable<String, Object> getWeeklyData() {
		Hashtable<String, Object> allList = new Hashtable<String, Object>();
		ArrayList<WeeklyData> lists = mapper.getWeeklyData();
		ArrayList<String> week = new ArrayList<String>();
		ArrayList<Long> walk = new ArrayList<Long>();
		ArrayList<Long> sale = new ArrayList<Long>();
		for(WeeklyData list:lists) {
			week.add(list.getWeek());
			walk.add(list.getWalk());
			sale.add(list.getSale());
		}
		allList.put("week",week);
		allList.put("walk",walk);
		allList.put("sale",sale);
		return allList;
	}

	@Override
	public MemListResult getTotalMemberList(int cp, String keyword) {
		MemListResult result = new MemListResult();
		result.setCurrentPage(cp);
		if(keyword != null && keyword != "") result.setKeyword(keyword);
		ArrayList<MemberVO> lists = mapper.getTotalMemberList(result);
		result.setList(lists);
		result.setTotalCount(mapper.getTotalMember());
		ArrayList<MemberOption> optionLists = new ArrayList<MemberOption>();
		ArrayList<String> urls = new ArrayList<String>();
		for(MemberVO list : lists) {
			long member_number = list.getMember_number();
			MemberOption memberOption = mapper.getMemOptionData(member_number);
			urls.add(walkMapper.getWalkPic(member_number));
			// 로그인 날짜 변환
			if(list.getLogin_date() != null) {
				Date origin = list.getLogin_date();
				DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
				String day = dayForm.format(origin);
				list.setLogin(day);
			}
			if(memberOption == null) {
				MemberOption newMemberOption = new MemberOption();
				newMemberOption.setWalk(0); 
				newMemberOption.setSale(0); 
				newMemberOption.setPoint(0);
				optionLists.add(newMemberOption);
			}else optionLists.add(memberOption);
		}
		result.setMemberOption(optionLists);
		result.setMemberPic(urls);
		return result;
	}

	@Override
	public ArrayList<Walk> getWalks(int status) {
		ArrayList<Walk> lists = new ArrayList<Walk>();
		if(status == 1) lists = mapper.getNextWalks();
		else lists = mapper.getPreWalks();
		for(Walk list:lists) {
			Date origin = list.getWalk_date();
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			DateFormat timeForm = new SimpleDateFormat("a hh시 mm분");
			String day = dayForm.format(origin);
			String time = timeForm.format(origin);
			list.setDay(day);
			list.setTime(time);
		}
		return lists;
	}

	@Override
	public ArrayList<String> getWalkTimes(ArrayList<Walk> lists, int type) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		String curDateStr = dateFormat.format(System.currentTimeMillis());
		ArrayList<String> times = new ArrayList<String>();
		Date curDate = null;
		try {
			curDate = dateFormat.parse(curDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for(Walk list : lists) {
			Date walkDate = list.getWalk_date();
			long seconds = (curDate.getTime() - walkDate.getTime());
			String timeFormat = makeStrTime(seconds, type);
			times.add(timeFormat);
		}
		return times;
	}
	
	public String makeStrTime(long seconds, int type) {
		int change = 1; // next, previous에 따라 음/양수 변경.
		String changeStr = " 지남";
		long days = TimeUnit.MILLISECONDS.toDays(seconds);
		seconds -= TimeUnit.DAYS.toMillis(days);
        long hours = TimeUnit.MILLISECONDS.toHours(seconds);
        seconds -= TimeUnit.HOURS.toMillis(hours);
        long minutes = TimeUnit.MILLISECONDS.toMinutes(seconds);
        seconds -= TimeUnit.MINUTES.toMillis(minutes);
        StringBuilder sb = new StringBuilder(64);
        if(type==NEXT_WALKS) {
        	change = -1; 
        	changeStr = " 전";
        }
        if(days != 0) {
	        sb.append(days*change);
	        sb.append("일 ");
        }
        sb.append(hours*change);
        sb.append("시간 ");
        sb.append(minutes*change);
        sb.append("분"+changeStr);
        return(sb.toString());
	}

	@Override
	public ArrayList<Board> getNotAnsweredQ() {
		ArrayList<Board> lists = mapper.getNotAnsweredQ();
		return lists;
	}

	@Override
	public void writeAnswer(String content, int idx, long member_number) {
		mapper.writeAnswer(content, idx, member_number);
	}

	@Override
	public ArrayList<Qna> getAnsweredQ(int cp, String keyword) {
		ArrayList<Qna> lists = mapper.getAnsweredQ(cp, keyword);
		for(Qna list:lists) {
			Date origin_post = list.getPost_date();
			Date origin_cmt = list.getCmt_date();
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			DateFormat timeForm = new SimpleDateFormat("a hh시 mm분");
			String post_day = dayForm.format(origin_post);
			String cmt_day = dayForm.format(origin_cmt);
			String post_time = timeForm.format(origin_post);
			String cmt_time = timeForm.format(origin_cmt);
			list.setPost_day(post_day);
			list.setPost_time(post_time);
			list.setCmt_day(cmt_day);
			list.setCmt_time(cmt_time);
		}
		return lists;
	}
	@Override
	public ArrayList<MemberWalkChart> getMemChartValues(){
		ArrayList<MemberWalkChart> lists = mapper.getChartList();
		for(MemberWalkChart one : lists) {
			long memno = one.getMember_number();
			MemberWalkChart dto = mapper.getMemWalkChart(memno);
			log.info("이것"+dto);
			one.setCount(dto.getCount());
			one.setJcount(dto.getJcount());
			one.setPercent(Math.round((double)one.getJcount()/(double)one.getCount()*10000)/100.0+"%");
			if(dto.getRecent() != null) {
				one.setRecent(dto.getRecent());
				DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
				String day = dayForm.format(one.getRecent());
				one.setDay(day);
			}
		}
		return lists; 
	}

	@Override
	public ArrayList<MemberWalkChart> getLocationList() {
		ArrayList<MemberWalkChart> lists = mapper.getLocationList();
		for(MemberWalkChart one : lists) {
			one.setPercent(Math.round((double)one.getJcount()/(double)one.getCount()*10000)/100.0+"%");
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			String day = dayForm.format(one.getRecent());
			one.setDay(day);
		}
		return lists;
	}

	@Override
	public void deleteMember(long member_number) {
		mapper.deleteMember(member_number);
	}

	@Override
	public ArrayList<OrderStatus> getOrderStatus() {
		ArrayList<OrderStatus> lists = mapper.getOrderStatus();
		for(OrderStatus list:lists) {
			Date origin_post = list.getPay_date();
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			String pay_day = dayForm.format(origin_post);
			list.setPay_day(pay_day);
		}
		return lists;
	}

	@Override
	public void givePoint(long member_number, long point) {
		mapper.givePoint(member_number, point);
		log.info(member_number+"번에, "+point+"포인트 지급");
	}

	@Override
	public ArrayList<String> getWalkPic(ArrayList<Walk> lists) {
		ArrayList<String> urls = new ArrayList<String>();
		for(Walk list : lists) {
			String url = walkMapper.getWalkPic(list.getMember_number());
			urls.add(url);
		}
		return urls;
	}

}
