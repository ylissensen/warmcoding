package warmcoding.daoiml;

import java.util.List;

import warmcoding.classes.current_live;
import warmcoding.dao.RoomDao;
import warmcoding.jdbc.JdbcUtils;

public class RoomDaoImpl implements RoomDao {
	@Override
    public List<current_live> getListbytitle(String keyword) {
        String sql ="select * from current_live where currentLiveTitle like '%"+keyword+"%' order by"
                + "(case when currentLiveTitle = '"+keyword+"' then 1 "
                + "when currentLiveTitle like '"+keyword+"%' then 2 "
                + "when currentLiveTitle like '%"+keyword+"' then 3 "
                + "when currentLiveTitle like '%"+keyword+"%' then 4 "
                + "else 0 end) limit 0,50;";
        return JdbcUtils.getList(current_live.class,sql);
    }

    @Override
    public List<current_live> getListbyclass(String Class) {
        String sql = "select * from current_live where currentLiveClass = '"+Class+"'";
        return JdbcUtils.getList(current_live.class,sql);
    }

    @Override
    public current_live getRoombyid(int id) {
        String sql = "select * from current_live where currentLiveHomeNumber = ?";
        return (current_live)JdbcUtils.getObjectById(current_live.class,sql,id);
    }
}
