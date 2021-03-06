
/*
* Copyright (c)  2015, NewTouch
* All rights reserved. 
*
* $id: CalendarServiceImpl.java 9552 Mar 14, 2015 11:00:56 PM MaoJiaWei$
*/
package com.newtouch.lion.service.system.impl; 

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newtouch.lion.dao.system.CalendarDao;
import com.newtouch.lion.model.system.Calendar;
import com.newtouch.lion.model.system.User;
import com.newtouch.lion.service.system.CalendarService;

/**
 * <p>
 * Title: 
 * </p>
 * <p>
 * Description: 
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * Company: NewTouch
 * </p>
 * 
 * @author MaoJiaWei
 * @version 1.0
 */
@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	@Autowired
	private CalendarDao calendarDao;
	
	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarSerivce#doFindById(java.lang.Long)
	 */
	@Override
	public Calendar doFindById(Long id) {
		return this.calendarDao.findById(id);
	}

	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarSerivce#doDeleteById(java.lang.Long)
	 */
	@Override
	public int doDeleteById(Long id) {
		String hql="delete from Calendar c where c.id=:id";
		Map<String,Object> params=new  HashMap<String, Object>();
		params.put("id",id);
		return this.calendarDao.updateHQL(hql, params);
	}

	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarSerivce#doDeleteByObj(com.newtouch.lion.model.system.Calendar)
	 */
	@Override
	public void doDeleteByObj(Calendar calendar) {
		this.calendarDao.remove(calendar);
	}

	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarSerivce#doUpdateObj(com.newtouch.lion.model.system.Calendar)
	 */
	@Override
	public Calendar doUpdateObj(Calendar calendar) {
		this.calendarDao.update(calendar);
		return calendar;
	}

	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarSerivce#doCreateObj(com.newtouch.lion.model.system.Calendar)
	 */
	@Override
	public void doCreateObj(Calendar calendar) {
		this.calendarDao.save(calendar);
	}

	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarSerivce#doFindCalendarByuser(com.newtouch.lion.model.system.User)
	 */
	@Override
	public List<Calendar> doFindCalendarByuser(User user) {
		String hql = "from Calendar where user.id=:id";
		Map<String,Object>  params=new HashMap<String, Object>();
		params.put("id",user.getId());
		return calendarDao.query(hql, params);
	}

	/* (non-Javadoc)
	 * @see com.newtouch.lion.service.system.CalendarService#doFindCalendarByuser(com.newtouch.lion.model.system.User, java.util.Date, java.util.Date)
	 */
	@Override
	public List<Calendar> doFindCalendarByuser(Long userId, Date start, Date end) {
		String hql = "from Calendar where userId=:userId and startdate between :start and :end";
		Map<String,Object>  params=new HashMap<String, Object>();
		params.put("userId",userId);
		params.put("start", start);
		params.put("end", end);
		return calendarDao.query(hql, params);
	}
	
}

	