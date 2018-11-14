package warmcoding.dao;

import java.util.List;

import warmcoding.classes.current_live;

public interface CurLiveDao {
    public current_live searchCurLive(int homeNum); //根据房间号查找直播信息
    public List<current_live> serchAllCurLive(); //查找所有的房间
    public int getAllCurLiveCount(); //查找房间的总数量
    public boolean setCurLive(current_live curlive);//开启本次直播
 
}
