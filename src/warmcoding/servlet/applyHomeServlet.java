package warmcoding.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.apache.catalina.User;
import org.json.JSONArray;

import com.google.gson.Gson;

import warmcoding.classes.user;
import warmcoding.daoiml.ApplyHomeDaoIml;
import warmcoding.daoiml.UserDaoImpl;
import warmcoding.service.AllService;

/**
 * Servlet implementation class applyHomeServlet
 */
/**
 * 
 * @author 彭依琳
 *
 */
@WebServlet("/applyHomeServlet")
public class applyHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		
	
		 //获取session
        HttpSession  session = request.getSession();
        //从session中拿出username和pwd
        String userName = (String)session.getAttribute("name");
		System.out.println(userName);
		
		user suser = new user();
		suser.setUserName(userName);
		
		AllService service = new AllService();
		
		JSONObject jo = new JSONObject();
		try {
			jo.put("homeNumber",service.applyHome(suser));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(jo.toString());
		PrintWriter pw = response.getWriter();
		pw.print(jo);
		pw.flush();
		pw.close();
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public String getCookies(HttpServletRequest request, HttpServletResponse response,String findCookies) {
		Cookie[] cookies = null;
		String ans = "dont find"; 
		// 获取cookies的数据,是一个数组
		cookies = request.getCookies();
		if( cookies != null ){
		   for (Cookie cookie : cookies){
		      if(cookie.getName().equals(findCookies)){
		    	  ans=cookie.getValue();
		      }
		   }
	   }else {
		   System.out.println("the cookie is null");
	   }
		return ans;
	}

}
