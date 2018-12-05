package warmcoding.servlet;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.JsonArray;

import net.sf.json.JSONArray;
import warmcoding.classes.current_live;
import warmcoding.classes.user;
import warmcoding.daoiml.ApplyHomeDaoIml;
import warmcoding.daoiml.CurLiveDaoIml;
import warmcoding.service.AllService;
import warmcoding.tuiliu.TuiLiu;

/**
 * Servlet implementation class applyLiveServlet
 */
/**
 * 
 * @author 彭依琳
 *
 */
@WebServlet("/applyLiveServlet")
public class applyLiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyLiveServlet() {
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
		
		String title = request.getParameter("title");
		String liveclass=request.getParameter("liveclass");  // 从前端获取
		System.out.println(title+liveclass);
		
		 //获取session
        HttpSession  session = request.getSession();
        //从session中拿出username和pwd
        String userName = (String)session.getAttribute("name");
		
		current_live curlive = new current_live();
		curlive.setCurrentLiveTitle(title);
		curlive.setCurrentLiveClass(liveclass);
		user suser = new user();
		suser.setUserName(userName);
				
		AllService allservice = new AllService();
		curlive = allservice.applyLive(suser,curlive);
		
		List<String> list = new ArrayList(); //传递数组
		list.add(curlive.getCurrentLiveRtmp());
		list.add(curlive.getCurrentLiveSecretKey());
		JSONArray json = JSONArray.fromObject(list);
		String sjson = json.toString();
		PrintWriter pw = response.getWriter();
		pw.print(sjson); 
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

}
