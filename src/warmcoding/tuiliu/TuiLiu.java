package warmcoding.tuiliu;

import java.io.*;
import java.util.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class TuiLiu {
	private String bizid;
	private String streamid;
	private String txSecret;
	private String txTime;
	private int liveHomeNumber;
	public TuiLiu(){
		super();
	}
	public TuiLiu(int liveHomeNumber){
		this.liveHomeNumber = liveHomeNumber;
		/*txTime的生成。10.27*/
	      
		//1.生成当前时间----------调用的是java里的SimpleDateFormat,用于时间格式化
		Date curTime = new Date(); 
		//2.设置url的过期时间 + 24hours
        Calendar nextTime = Calendar.getInstance();
        nextTime.setTime(curTime);   // date to calendar
        nextTime.add(Calendar.DAY_OF_MONTH,1); // +24hours
        curTime = nextTime.getTime(); // calender to date
        DateFormat nextTime2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //   格式
        String txDate_1 = nextTime2.format(curTime); // date to string
       // System.out.println("正常格式的过期时间————————"+txDate_1);
        //3.变成unix时间戳
        Long unixTime = 0L;
        try{
        	 DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
             unixTime = df.parse(txDate_1).getTime()/1000;
        } catch (ParseException e){
        	System.out.println("pe");
        }
        //4.时间戳变成16进制以缩小字符串的长度
        this.txTime = Integer.toHexString(unixTime.intValue()).toUpperCase();
       // System.out.println("16进制的过期时间时间戳————————"+txTime);

         /*txTime的生成结束  10.27*/
        
        /* streamid的生成。10.27*/
        
        this.bizid = "33772";   // bizid的获取  10.27
        String streamid = bizid+"_"+this.liveHomeNumber;
       /* streamid的生成结束。10.27*/

       /* txSecret的生成 10.27*/
       String key = "13179ca020260c31035b5db823000740"; // key的获取  10.27
       this.txSecret = MD5(key+streamid+txTime);   
       /* txSecret的生成结束 10.27*/
        
	}
	
	protected static String MD5(String str) {
		 
        MessageDigest md5 = null;
        try {
 
            md5 = MessageDigest.getInstance("MD5");
 
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] bs = md5.digest(str.getBytes());
        StringBuilder sb = new StringBuilder(40);
        for(byte x:bs) {
            if((x & 0xff)>>4 == 0) {
                sb.append("0").append(Integer.toHexString(x & 0xff));
            } else {
                sb.append(Integer.toHexString(x & 0xff));
            }
        }
        return sb.toString();
    }
	
	public String getRtmp() {
		String PLAYURLR = "rtmp://"+this.bizid+".liveplay.myqcloud.com/live/"+this.streamid;
        return PLAYURLR;	
	}
	
	public String getSecretKey() {
		String SECRETKEY = "?bizid="+bizid+"&txSecret="+txSecret+"&txTime="+txTime;
		return SECRETKEY;
	}
	
}
