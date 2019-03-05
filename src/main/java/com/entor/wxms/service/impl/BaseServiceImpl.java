package com.entor.wxms.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entor.wxms.dao.BaseDao;
import com.entor.wxms.service.BaseService;

@Service("baseService")
public class BaseServiceImpl<T> implements BaseService<T>{

	@Resource
	private BaseDao<T> baseDao;
	
	@Override
	public void add(T t) {
		baseDao.add(t);
	}

	@Override
	public void addMore(List<T> list) {
		baseDao.addMore(list);
	}

	@Override
	public void deleteById(Class<?> cls, Serializable id) {
		baseDao.deleteById(cls, id);
	}

	@Override
	public void deleteMore(Class<?> cls, String ids) {
		baseDao.deleteMore(cls, ids);
	}

	@Override
	public void update(T t) {
		baseDao.update(t);
	}

	@Override
	public T queryById(Class<?> cls, Serializable id) {
		return baseDao.queryById(cls, id);
	}

	@Override
	public List<T> queryAll(Class<?> cls) {
		return baseDao.queryAll(cls);
	}

	@Override
	public List<T> queryByPage(Class<?> cls, int currentPage, int pageSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", (currentPage-1)*pageSize+1);
		map.put("end", currentPage*pageSize);
		return baseDao.queryByPage(cls, map);
	}

	@Override
	public List<T> queryByPageVo(Class<?> cls, int currentPage, int pageSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", (currentPage-1)*pageSize+1);
		map.put("end", currentPage*pageSize);
		return baseDao.queryByPageVo(cls, map);
	}
	
	@Override
	public int getTotals(Class<?> cls) {
		return baseDao.getTotals(cls);
	}

	@Override
	public void deleteUserPublicNumberByUids(Class<?> cls, String uids) {
		baseDao.deleteUserPublicNumberByUids(cls, uids);
	}

	@Override
	public List<T> queryAllPublicNumbersByUids(Class<?> cls, String uids) {
		return baseDao.queryAllPublicNumbersByUids(cls, uids);
	}


}
