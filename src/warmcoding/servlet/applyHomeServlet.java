package warmcoding.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

import com.google.gson.Gson;

import warmcoding.daoiml.ApplyHomeDaoIml;
import warmcoding.daoiml.UserDaoImpl;

/**
 * Servlet implementation class applyHomeServlet
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
		
//		String findCookies = "username";
//		String userName = getCookies(request,response,findCookies);	
		
		String userName = "huangsen";
		System.out.println(userName);
		
		ApplyHomeDaoIml applyhomedaoimpl = new ApplyHomeDaoIml();
		
		JSONObject jo = new JSONObject();
		try {
			jo.put("homeNumber",applyhomedaoimpl.addHome(userName));
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
