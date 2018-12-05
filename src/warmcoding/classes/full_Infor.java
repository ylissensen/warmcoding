package warmcoding.classes;

public class full_Infor{
	private current_live curliveInfor;
	private String userName;
	
	public full_Infor() {
		super();
	}
	public full_Infor(current_live tcurlive,String tuser) {
		this.curliveInfor = tcurlive;
		this.userName = tuser;
	}
	public current_live getCurliveInfor() {
		return curliveInfor;
	}
	public void setCurliveInfor(current_live curliveInfor) {
		this.curliveInfor = curliveInfor;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserInfor(String userName) {
		this.userName = userName;
	}

}
