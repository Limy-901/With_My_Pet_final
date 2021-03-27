package pet.mvc.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;
import pet.mvc.mapper.IndexMapper;
import pet.walk.vo.IndexData;
import pet.walk.vo.Walk;

@Service
@Log4j
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexMapper indexMapper;
	
	@Override
	public ArrayList<Walk> getWalkList() {
		ArrayList<Walk> items = indexMapper.getWalkList();
		for(Walk item : items) {
			// �ð������� ����
			Date origin = item.getWalk_date();
			DateFormat dayForm = new SimpleDateFormat("yyyy년 MM월 dd일");
			DateFormat timeForm = new SimpleDateFormat("a hh시 mm분");
			String day = dayForm.format(origin);
			String time = timeForm.format(origin);
			item.setDay(day);
			item.setTime(time);
		}
		return items;
	}

	@Override
	public IndexData getWalkData() {
		IndexData walkData = indexMapper.getWalkData();
		if(walkData.getNotjoin() == 0) walkData.setNotjoin(0);
		if(walkData.getTotaljoins() == 0) walkData.setTotaljoins(0);
		if(walkData.getTotalwalks() == 0) walkData.setTotalwalks(0);
		if(walkData.getTodayPuppy() == 0) walkData.setTodayPuppy(0);
		return walkData;
	}

}
