package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CarDao;
import web.dao.face.IncomeDao;
import web.dao.face.RentDao;
import web.dao.face.ReviewDao;
import web.dto.BoardFile;
import web.dto.Car;
import web.dto.Income;
import web.dto.Rent;
import web.dto.User;
import web.service.face.RentService;
import web.util.Paging;

@Service
public class RentServiceImpl implements RentService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired CarDao carDao;
	@Autowired RentDao rentDao;
	@Autowired ReviewDao reviewDao; 
	@Autowired IncomeDao incomeDao;

	@Override
	public Paging getPaging(Paging param, String location) {
		
		if(location != null) {
			param.setCategory(Integer.parseInt(location));
		}
		
		int totalCount = carDao.selectCntAll(param);
		Paging paging = new Paging( totalCount, param.getCurPage(), 9, 10 );
		paging.setCategory(param.getCategory());
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> getCarList(Paging paging) {
		
		List<Map<String, Object>> list = carDao.selectAll(paging);
		
		return list;
	}

	@Override
	public Car view(Car car) {
		return carDao.selectByCarNo(car);
	}

	@Override
	public List<Rent> getRentList(Car car) {
		
		List<Rent> list = rentDao.selectAllByCarNo(car);
		
		return list;
	}

	@Override
	public void book(Rent rent) {
		rentDao.insertRent(rent);
	}

	@Override
	public User getGuestInfo(User user) {
		return rentDao.selectUserByUserId(user);
	}

	@Override
	public void cancelBooking(Rent rent) {
		rentDao.updateCancel(rent);
	}

	@Override
	public Map<String, Object> getReviewInfo(Car car) {
		return rentDao.selectReviewInfoBycarNo(car);
	}

	@Override
	public int checkHeart(Car car) {
		// TODO Auto-generated method stub
		return rentDao.selectCntHeartByUserId(car);
	}

	@Override
	public BoardFile getFileInfo(Car car) {
		
		return rentDao.selectFileByCarNo(car);
	}



}
