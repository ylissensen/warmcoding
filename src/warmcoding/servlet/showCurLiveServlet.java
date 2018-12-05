package warmcoding.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import warmcoding.classes.full_Infor;
import warmcoding.service.AllService;

/**
 * Servlet implementation class showCurLiveServlet
 */
@WebServlet("/showCurLiveServlet")
public class showCurLiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showCurLiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		full_Infor homeInfor = new full_Infor();
		int homeNumber = Integer.valueOf(request.getParameter("homeid")).intValue();  //从链接传来的命令中读取点击的房间的id
		
		AllService service = new AllService();
		homeInfor = service.getCurLive(homeNumber); //获取课程的所有信息
		
		request.setAttribute("curlive", homeInfor);//将信息存储在流对象中
		System.out.println(homeInfor.getCurliveInfor().getCurrentLiveRtmp());
		request.getRequestDispatcher("JSP/showCurLive.jsp").forward(request, response);//重定向到播放页面之中
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
