package warmcoding.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonArray;

import org.json.JSONArray;
import org.json.JSONObject;

import warmcoding.classes.current_live;
import warmcoding.classes.live_home;
import warmcoding.service.AllService;

/**
 * Servlet implementation class roomFinderServlet
 */
@WebServlet("/roomFinderServlet")
public class roomFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public roomFinderServlet() {
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
	       // PrintWriter out = response.getWriter();

	        String keyword = request.getParameter("shabi");
	       // String keyword = "c++";
	        AllService RDS = new AllService();
	        current_live result =new current_live();
	        List<current_live>  resultlist;
	        List<current_live> title = new ArrayList<>();
	        List<current_live> clazz = new ArrayList<>();
	        if (!isNumeric(keyword)){
	            resultlist = RDS.RoomFindList(keyword);
	            for (int i = 0;i<resultlist.size();i++){
	                title.add(resultlist.remove(0));
	                if (resultlist.get(i).getCurrentLiveHomeNumber()==-1){
	                    resultlist.remove(0);
	                    break;
	                }
	            }
	            clazz.addAll(resultlist);
	        }
	        if(isNumeric(keyword)){
	            result = RDS.RoomFindById(Integer.parseInt(keyword));
	        }
	        net.sf.json.JSONObject object = new net.sf.json.JSONObject();
	        object.put("title",net.sf.json.JSONArray.fromObject(title));
	        object.put("class",net.sf.json.JSONArray.fromObject(clazz));
	        object.put("id",net.sf.json.JSONObject.fromObject(result));
	       
	        request.setAttribute("title", title);//将信息存储在流对象中
	        request.setAttribute("class", clazz);//将信息存储在流对象中
	        request.setAttribute("id", result);//将信息存储在流对象中
	        
//	        System.out.println("title搜索数据如下-----");
//	        for(int i = 0 ;i<title.size();i++) {
//	        	System.out.print(title.get(i).getCurrentLiveHomeNumber());
//	        }
//	        System.out.println(" ");
//	        System.out.println("class搜索数据如下-----");
//	        for(int i = 0 ;i<clazz.size();i++) {
//	        	System.out.print(clazz.get(i).getCurrentLiveHomeNumber());
//	        }
//	        System.out.println(" ");
//	        System.out.print(result.getCurrentLiveHomeNumber());
//	        
	        
	        
	        // response.sendRedirect(request.getContextPath()+"/JSP/searchResult.jsp");  
	        request.getRequestDispatcher("/html/searchResult.jsp").forward(request, response);//重定向到播放页面之中

	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static boolean isNumeric(String str) {
		Pattern pattern =Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}

}
