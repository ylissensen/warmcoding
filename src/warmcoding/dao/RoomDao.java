package warmcoding.dao;

import java.util.List;

import warmcoding.classes.current_live;

public interface RoomDao {
	    List<current_live> getListbytitle(String title);

	    List<current_live> getListbyclass(String Class);

	    current_live getRoombyid(int id); 
}
