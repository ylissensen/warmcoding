package warmcoding.daoiml;

import warmcoding.classes.user;
import warmcoding.dao.UserDao;
import warmcoding.jdbc.warmConnect;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl extends warmConnect implements UserDao{

	@Override
	public boolean addUser(user user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			String sql = "INSERT INTO user(userName, userPassWord, userIdentificationCode) VALUES(?, ?, ?)";
			Object[] params = {user.getUserName(), user.getUserPassWord(), user.getUserIdentificationCode()};
			int i = this.executeUpdate(sql, params);
			if (i > 0) {
				System.out.println("ok");
			}
			flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.closeResource();
		}
		return flag;
	}

	@Override
	public boolean logIn(user user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			String sql = "SELECT * FROM user WHERE userName = ?";
			Object[] params = {user.getUserName()};
			ResultSet rs = this.executeSQL(sql, params);
			//System.out.print("rs.next()" + rs.next());
			while (rs.next()) {
				String password = rs.getString("userPassWord");
				System.out.print("userpassword" + password);
				if (password.equals(user.getUserPassWord()) == true) {
					flag = true;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		return flag;
	}

	@Override
	public boolean findUser(user user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "SELECT * FROM user WHERE userName = ?";
		Object[] params = {user.getUserName()};
		ResultSet rs = null;
		warmConnect conn = new warmConnect();
		try {
			rs = conn.executeSQL(sql, params);
			System.out.println("rs="+rs);
			while (rs.next()) {
				String username = rs.getString("userName");
				String pwd = rs.getString("userPassWord");
				
				if (username.equals(user.getUserName()) == true) {
					flag = true;
					user.setUserName(username);
					user.setUserPassWord(pwd);
				}
			}
		}catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			this.closeResource();
		}
		return flag;
	}

	@Override
	public boolean updateUserIndentificationCode(String userName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		 String sql = "update user set userIdentificationCode = 1 where userName =?;";
		 Object[] params = {userName};
			try {
				System.out.println("修改用户的标识符....");
				int i = this.executeUpdate(sql, params);
				if(i>0) { 
					System.out.println("修改完毕"+i);	
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
			}
	  
		return flag;
	}
	
	public static void main(String[] args) {
		UserDaoImpl test = new UserDaoImpl();
		user user = new user();
		user.setUserName("15071091360");
		boolean ans = test.findUser(user);
		System.out.println(ans);
		
	}
	

}
