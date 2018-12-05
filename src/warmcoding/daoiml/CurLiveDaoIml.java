package warmcoding.daoiml;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import warmcoding.classes.current_live;
import warmcoding.dao.CurLiveDao;
import warmcoding.jdbc.warmConnect;

public class CurLiveDaoIml extends warmConnect implements CurLiveDao{

	@Override
	public current_live searchCurLive(int homeNum) {
		// TODO Auto-generated method stub
		current_live curlive = new current_live();
		curlive.setCurrentLiveHomeNumber(homeNum);
		try {
			System.out.println("准备查询...本直播房间的所有情况");
			String sql = "select * from current_live where currentLiveHomeNumber=?;";
			Object[] params = {homeNum};
			ResultSet rs = this.executeSQL(sql,params);
			while(rs.next()) {
				curlive.setCurrentLiveTitle(rs.getString("currentLiveTitle"));
				curlive.setCurrentLiveClass(rs.getString("currentLiveClass"));
				curlive.setCurrentLiveRtmp(rs.getString("currentLiveRtmp"));
				curlive.setCurrentLiveSecretKey(rs.getString("currentLiveSecretKey"));
			}
			System.out.println("查询完毕...."+curlive.getCurrentLiveClass()+curlive.getCurrentLiveHomeNumber()+curlive.getCurrentLiveRtmp()+curlive.getCurrentLiveSecretKey()+curlive.getCurrentLiveTitle());		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return  curlive;
	}

	@Override
	public List<current_live> searchAllCurLive() {
		// TODO Auto-generated method stub
		List<current_live> curlivelist = new ArrayList<current_live>();
		try {
			System.out.println("准备查询...所有的直播房间");
			String sql = "select * from current_live;";
			Object[] params = {};
			ResultSet rs = this.executeSQL(sql,params);
			//ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
			//int columnCount = md.getColumnCount();   //获得列数 
			while(rs.next()) {
				curlivelist.add(new current_live(rs.getString("currentLiveTitle"),rs.getString("currentLiveRtmp"),rs.getString("currentLiveSecretKey"),rs.getString("currentLiveClass"),rs.getInt("currentLiveHomeNumber")));
			}
			System.out.println("查询完毕....");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		for(int i = 0 ;i<curlivelist.size();i++)
		{
			System.out.print(curlivelist.get(i).getCurrentLiveHomeNumber()+"   ");
		}
		return  curlivelist;
	}

	@Override
	public int getAllCurLiveCount() {
		// TODO Auto-generated method stub
		 int i = 0;
			try {
				System.out.println("准备查询.....直播的数量");
				String sql ="select count(currentLiveHomeNumber) from current_live;";
				Object[] params = {};
				ResultSet rs = this.executeSQL(sql,params);
				while (rs.next()) {
					i = rs.getInt(1);			
				}
				System.out.println("查询完毕....直播的总数为"+i);		
			} catch (SQLException e) {
			
				e.printStackTrace();
				throw new RuntimeException(e);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
			}
			return i;
	
	}

	@Override
	public boolean setCurLive(current_live curlive) {
		// TODO Auto-generated method stub
			try {
				String sql = "insert into current_live(currentLiveTitle,currentLiveRtmp,currentLiveSecretKey,currentLiveClass,currentLiveHomeNumber) values(?,?,?,?,?);";
				Object[] params = {curlive.getCurrentLiveTitle(),curlive.getCurrentLiveRtmp(),curlive.getCurrentLiveSecretKey(),curlive.getCurrentLiveClass(),curlive.getCurrentLiveHomeNumber()};
				System.out.println("准备向数据库中插入直播");
				int i = this.executeUpdate(sql, params);
				if(i>0) {
					System.out.println("插入直播完毕");	
					return true;
				}	
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				this.closeResource();
			}
		return false;
	}
	
	public static void main(String[] args) {
		CurLiveDaoIml test = new CurLiveDaoIml();
		test.searchAllCurLive();
		
	}

}
