package warmcoding.servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import warmcoding.classes.current_live;
import warmcoding.daoiml.ApplyHomeDaoIml;
import warmcoding.daoiml.CurLiveDaoIml;
import warmcoding.tuiliu.TuiLiu;

/**
 * Servlet implementation class applyLiveServlet
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
		
//		JSONObject rtmp = new JSONObject();
//		try {
//			rtmp.put("rtmp",123);
//		} catch (JSONException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}	
//		System.out.println(rtmp.toString());
//		PrintWriter pw = response.getWriter();
//		pw.print(rtmp); //传给前端rtmp 和 secret 提示用户把它放进直播软件
//		pw.flush();
//		pw.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
