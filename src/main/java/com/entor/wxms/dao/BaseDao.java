package com.entor.wxms.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T> {

	public void add(T t);
	public void addMore(List<T> list);
	public void deleteById(Class<?> cls, Serializable id);
	public void deleteMore(Class<?> cls, String ids);
	public void update(T t);
	public T queryById(Class<?> cls, Serializable id);
	public List<T> queryAll(Class<?> cls);
	public List<T> queryByPage(Class<?> cls,Map<String, Object> map);
	public List<T> queryByPageVo(Class<?> cls,Map<String, Object> map);
	public int getTotals(Class<?> cls);
	public void deleteUserPublicNumberByUids(Class<?> cls, String uids);
	public List<T> queryAllPublicNumbersByUids(Class<?> cls, String uids);
}
