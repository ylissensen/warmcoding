package warmcoding.dao;

import warmcoding.classes.user;

public interface UserDao {
	public boolean addUser(user user);
	public boolean logIn(user user);
	public boolean findUser(user user);
	public boolean updateUserIndentificationCode(String userName);
	public int judgeUserIdent(String userName);

}
