package warmcoding.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import warmcoding.classes.current_live;
import warmcoding.service.AllService;

/**
 * Servlet implementation class getAllCurLiveServlet
 */
@WebServlet("/getAllCurLiveServlet")
public class getAllCurLiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getAllCurLiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("utf-8");
	     response.setContentType("text/html;charset=utf-8");
	     response.setCharacterEncoding("utf-8");
		AllService allService = new AllService();
		List<current_live> allCurLiveList = new ArrayList<current_live>();
		allCurLiveList = allService.getAllCurLive();
		
		/*转换为json传递出去!~*/
		JSONArray jsonArray2 = JSONArray.fromObject(allCurLiveList);
		System.out.println(jsonArray2);
		PrintWriter out = response.getWriter();
		out.print(jsonArray2);
		request.setAttribute("jsonArray2", jsonArray2);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
