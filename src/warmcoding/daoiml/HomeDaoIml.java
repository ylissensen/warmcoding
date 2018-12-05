package warmcoding.daoiml;

import java.sql.ResultSet;
import java.sql.SQLException;

import warmcoding.dao.CurLiveDao;
import warmcoding.dao.HomeDao;
import warmcoding.jdbc.warmConnect;

public class HomeDaoIml  extends warmConnect implements HomeDao {

	@Override
	public String findUserNameByHomeId(int homeid) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String userName = "";
				try {
					System.out.println("准备查询......这个房间号的房间的当前的状态");
					String sql = "select liveHomeUserName from live_home where liveHomeNumber=?;";
					Object[] params = {homeid};
					ResultSet rs = this.executeSQL(sql,params);
					while(rs.next()) {
						userName=rs.getString(1);
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
				return userName;
		
	}

}
