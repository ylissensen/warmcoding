package warmcoding.dao;

import warmcoding.classes.live_home;
import warmcoding.classes.user;

public interface ApplyHomeDao {
	public String getHomeStatus(int homeNum); // 获得直播房间当前的状态
	public boolean setHomeStatus(int homeNum,String status); //改变直播房间的状态
	public int addHome(String userName); // 为某个用户注册一个房间. 如果返回值为-1,则说明该用户已经有了房间了,不可以再次注册一个新的房间
	public int getHomeNum(String userName); // 查询某个用户的房间号
	public int getAllHome(); // 查询房间的数量,用于自增

}
