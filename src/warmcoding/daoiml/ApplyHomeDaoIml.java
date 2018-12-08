package warmcoding.daoiml;
import java.sql.ResultSet;
import java.sql.SQLException;

import warmcoding.classes.live_home;
import warmcoding.dao.ApplyHomeDao;
import warmcoding.jdbc.warmConnect;

public class ApplyHomeDaoIml extends warmConnect implements ApplyHomeDao{

	@Override
	public String getHomeStatus(int homeNum){
		// TODO Auto-generated method stub
		String liveHomeStatus = "";
		try {
			System.out.println("准备查询......这个房间号的房间的当前的状态");
			String sql = "select liveHomeStatus from live_home where liveHomeNumber=?;";
			Object[] params = {homeNum};
			ResultSet rs = this.executeSQL(sql,params);
			while(rs.next()) {
				liveHomeStatus=rs.getString(1);
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
		return liveHomeStatus;
	}

	@Override
	public boolean setHomeStatus(int homeNum,String status) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			String sql = "update live_home set liveHomeStatus=? where liveHomeNumber=?;";	
			Object[] params = {status,homeNum};
			System.out.println("准备修改.....这个房间号的房间的当前的状态");
			int i = this.executeUpdate(sql,params);
			if(i>0) { 
				System.out.println("修改完毕....");		
			    flag = true;
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
		return flag;
	}

	@Override
	public int addHome(String userName) {
		// TODO Auto-generated method stub
		int homeNum = 100001+getAllHome();
			try {
				String sql = "insert into live_home(liveHomeUserName,liveHomeNumber,liveHomeStatus) values(?,?,?);";
				Object[] params = {userName,homeNum,"close"};
				System.out.println("准备插入新的房间....");
				int i = this.executeUpdate(sql, params);
				if(i>0) {
					System.out.println("插入完毕,房间号为...."+homeNum);	
					UserDaoImpl userdaoimpl = new UserDaoImpl();
					userdaoimpl.updateUserIndentificationCode(userName);
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
		return homeNum;
	}

	@Override
	public int getHomeNum(String userName) {
		// TODO Auto-generated method stub
		int homenum = -1;
			try {
				System.out.println("准备查询房间号码....");
				String sql ="select liveHomeNumber from live_home where liveHomeUserName = ?;";
				Object[] params = {userName};
				ResultSet rs = this.executeSQL(sql,params);
				while(rs.next()) {
					homenum = rs.getInt(1);
				}
				System.out.println("查询完毕,用户的房间号为...."+homenum);		
			} catch (SQLException e) {
			
				e.printStackTrace();
				throw new RuntimeException(e);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
			}
		return homenum;
	}
	
	@Override
	public int getAllHome() {
		 int i = 0;
			try {
				System.out.println("准备查询.....房间的数量");
				String sql ="select count(liveHomeNumber) from live_home;";
				Object[] params = {};
				ResultSet rs = this.executeSQL(sql,params);
				while (rs.next()) {
					i = rs.getInt(1);			
				}
				System.out.println("查询完毕...."+i);		
			} catch (SQLException e) {
			
				e.printStackTrace();
				throw new RuntimeException(e);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
			}
			return i;
		 
	}
	
	public static void main(String[] args) {
		ApplyHomeDaoIml test = new ApplyHomeDaoIml();
		String ans = test.getHomeStatus(100000);
		test.addHome("pyl250");
	}
}
