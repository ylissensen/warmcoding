package warmcoding.dao;

import java.util.List;

//公用的dao, 提供基础的增、删、改、查询所有的功能
//好吧,发现是用的spring框架...目前暂时是不学这个框架的哈  11.2日
public interface BaseDao<T> {
	void add(T t);
	void delete(T t);
	void update(T t);
	List<T> findAll();
}
