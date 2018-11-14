package warmcoding.classes;

public class current_live {
	private String currentLiveTitle;
	private String currentLiveRtmp;
	private String currentLiveSecretKey;
	private String currentLiveClass;
	private int currentLiveHomeNumber;
	
	public current_live() {
		super();
	}
	
	public current_live(String title,String rtmp,String secret,String liveclass,int num) {
		this.currentLiveClass=liveclass;
		this.currentLiveHomeNumber=num;
		this.currentLiveRtmp=rtmp;
		this.currentLiveTitle=title;
		this.currentLiveSecretKey=secret;
	}
	
	public String getCurrentLiveTitle() {
		return currentLiveTitle;
	}
	public void setCurrentLiveTitle(String currentLiveTitle) {
		this.currentLiveTitle = currentLiveTitle;
	}
	public String getCurrentLiveRtmp() {
		return currentLiveRtmp;
	}
	public void setCurrentLiveRtmp(String currentLiveRtmp) {
		this.currentLiveRtmp = currentLiveRtmp;
	}
	public String getCurrentLiveSecretKey() {
		return currentLiveSecretKey;
	}
	public void setCurrentLiveSecretKey(String currentLiveSecretKey) {
		this.currentLiveSecretKey = currentLiveSecretKey;
	}
	public String getCurrentLiveClass() {
		return currentLiveClass;
	}
	public void setCurrentLiveClass(String currentLiveClass) {
		this.currentLiveClass = currentLiveClass;
	}
	public int getCurrentLiveHomeNumber() {
		return currentLiveHomeNumber;
	}
	public void setCurrentLiveHomeNumber(int currentLiveHomeNumber) {
		this.currentLiveHomeNumber = currentLiveHomeNumber;
	}
	

}
