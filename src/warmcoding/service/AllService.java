package warmcoding.service;

import java.util.ArrayList;
import java.util.List;

import com.huaban.analysis.jieba.JiebaSegmenter;

import warmcoding.classes.current_live;
import warmcoding.classes.full_Infor;
import warmcoding.classes.user;
import warmcoding.dao.RoomDao;
import warmcoding.daoiml.ApplyHomeDaoIml;
import warmcoding.daoiml.CurLiveDaoIml;
import warmcoding.daoiml.HomeDaoIml;
import warmcoding.daoiml.RoomDaoImpl;
import warmcoding.daoiml.UserDaoImpl;
import warmcoding.tuiliu.TuiLiu;

public class AllService {

	/**
	 * 申请房间号
	 * @param suser
	 * @return
	 */
	public int applyHome(user suser) {
		ApplyHomeDaoIml applyhomedaoimpl = new ApplyHomeDaoIml();
		int flag = applyhomedaoimpl.getHomeNum(suser.getUserName());
		if(flag != -1) {System.out.println(flag); return -1;} // flag !=-1 说明已经有房间了
		return applyhomedaoimpl.addHome(suser.getUserName());
	}
	
	/**
	 * 申请本次直播
	 * @param suser
	 * @param curlive
	 * @return
	 */
	public current_live applyLive(user suser,current_live curlive ) {
		ApplyHomeDaoIml applyhomedaoimpl = new ApplyHomeDaoIml();
		int homeNumber = judgeLive(suser);
		if( homeNumber != -1 ) {
		TuiLiu tuiliu = new TuiLiu(homeNumber);
		String rtmp = tuiliu.getRtmp();
		String secretKey = tuiliu.getSecretKey();
		curlive.setCurrentLiveHomeNumber(homeNumber);
		curlive.setCurrentLiveRtmp(rtmp);
		curlive.setCurrentLiveSecretKey(secretKey);
        System.out.println("TUILIU完毕...."+curlive.getCurrentLiveClass()+curlive.getCurrentLiveHomeNumber()+curlive.getCurrentLiveRtmp()+curlive.getCurrentLiveSecretKey()+curlive.getCurrentLiveTitle());
		
		CurLiveDaoIml curlivedaoiml = new CurLiveDaoIml();
		curlivedaoiml.setCurLive(curlive);
		applyhomedaoimpl.setHomeStatus(homeNumber, "open");
		} 
		return curlive;
	
	}
	
	/**
	 * 判断该用户的房间是否正在直播
	 * @param suser
	 * @return
	 */
	protected int judgeLive(user suser) {
		ApplyHomeDaoIml applyhomedaoimpl = new ApplyHomeDaoIml();
		int homeNumber = applyhomedaoimpl.getHomeNum(suser.getUserName());
		if( homeNumber == -1 ) return -1; //没有房间
		CurLiveDaoIml curlivedaoiml = new CurLiveDaoIml();
		current_live curlive = curlivedaoiml.searchCurLive(homeNumber);
		if(curlive.getCurrentLiveRtmp()!=null) return -1;//已经在直播了.....
		return homeNumber;
		
		
	}
	
	/**
	 * 通过标题查找
	 * @param keyword
	 * @return
	 */
	private List<current_live> Search(String keyword)
	{
		 RoomDao RM = new RoomDaoImpl();
	     return RM.getListbytitle(keyword);
		
	}
	
	/**
	 * 通过分类查找
	 * @param keyword
	 * @param num
	 * @return
	 */
	private List<current_live> Search(String keyword ,int num)
	{
		RoomDao RM = new RoomDaoImpl();
        return RM.getListbyclass(keyword);
		
	}
	
	
	/**
	 * 通过id查找(纯数字)
	 * @param id
	 * @return
	 */
	public current_live RoomFindById(int id)
	{
		 RoomDao RM = new RoomDaoImpl();
	        return RM.getRoombyid(id);
	}
	
	/**
	 * 搜索
	 * @param keyword
	 * @return
	 */
	public List<current_live> RoomFindList(String keyword)
	{
		int i = 0;
        List<current_live> Result = null;
        List<String> temp;
        JiebaSegmenter segmenter = new JiebaSegmenter();
        temp = segmenter.sentenceProcess(keyword);  // 把词分开
        if(Search(keyword).isEmpty()){  //没找到？
            while(Search(temp.get(i)).isEmpty()){
                i++;
                if(i>=temp.size())break;//越界
            }
            System.out.println("分词大小"+temp.size()+" i="+i);
            if(i<temp.size())Result= Search(temp.get(i));  //通过标题的分词查找
        }
        else{
            Result = Search(keyword);  // 通过标题查找
        }

        //创建一个空的Live类，以示分隔
        if(Result == null) {}
        else{
        	current_live p = new current_live();
        	p.setCurrentLiveHomeNumber(-1);
        	Result.add(p);
        }

        i=0;
        if(Search(keyword,1).isEmpty()){
            while(Search(temp.get(i),1).isEmpty()){
                i++;
                if(i>=temp.size())break;//越界
            }
            System.out.println("分词大小"+temp.size()+" i="+i);
            if(i<temp.size())Result.addAll(Search(temp.get(i),1));
        }
        else{
            Result.addAll(Search(keyword,1));
        }

        return Result;	
	}
	
	/**
	 * 获取所有的直播房间
	 * @return
	 */
	public List<current_live> getAllCurLive()
	{
		List<current_live> curlivelist = new ArrayList<current_live>();
		CurLiveDaoIml curlivedaoiml = new CurLiveDaoIml();
		curlivelist = curlivedaoiml.searchAllCurLive();
		return curlivelist;
	}
	
	public full_Infor getCurLive(int curLiveHomeNumber) {	
		CurLiveDaoIml curlivedaoiml = new CurLiveDaoIml();
		current_live tcurlive = curlivedaoiml.searchCurLive(curLiveHomeNumber);
		
		HomeDaoIml homedaoiml = new HomeDaoIml();
		String userName = homedaoiml.findUserNameByHomeId(curLiveHomeNumber);
		
		full_Infor homeinfor = new full_Infor(tcurlive,userName);
		
		return homeinfor;
	}
	
	public int getUserIden(String userName) {
		UserDaoImpl userdaoiml = new UserDaoImpl();
		return userdaoiml.judgeUserIdent(userName);
	}
	
	
//	public static void main(String arg[]) {
//		//user suser = new user(); suser.setUserName("15071091360");
//		//current_live curlive = new current_live(); curlive.setCurrentLiveTitle("babababay"); curlive.setCurrentLiveClass("c++");
//		AllService all = new AllService();
//		List<current_live> cur = all.RoomFindList("c++");
//		for(int i = 0 ;i <cur.size();i++)
//		{
//			System.out.println(cur.get(i).getCurrentLiveHomeNumber());
//		}
//		
//		//curlive = all.applyLive(suser, curlive);
//		//System.out.println("curlive"+curlive.getCurrentLiveRtmp()+curlive.getCurrentLiveSecretKey());
//		
//	}
//	
}
