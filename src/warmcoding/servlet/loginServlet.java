package warmcoding.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import warmcoding.classes.user;
import warmcoding.daoiml.UserDaoImpl;

/**
 * Servlet implementation class loginServlet
 */
/**
 * 
 * @author 李豫
 *
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("userName");                       //request.getParameter("userName");
		String password = request.getParameter("password");    //request.getParameter("password");
		user user = new user();
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		boolean IDENTIFY = false;
		boolean LOGIN = false;
		int info = 0;
		
		user.setUserName(username);
		user.setUserIdentificationCode(0);
		
		IDENTIFY = userDaoImpl.findUser(user);
		user.setUserPassWord(password);
		if(IDENTIFY == true) {
			System.out.println("identification sucess");
			HttpSession session = request.getSession();
			session.setAttribute("name", user.getUserName()); // session存储用户名字
			request.setAttribute("user", user);
			LOGIN = userDaoImpl.logIn(user);
			if(LOGIN == true) {
				System.out.println("login success");
				info = 1;
				//request.getRequestDispatcher("JSP/homePage.jsp").forward(request, response);
			}else {
				System.out.println("login fail");
				info = -1;
				//request.getRequestDispatcher("JSP/login.jsp").forward(request, response);
			}
			
		}else {
			System.out.println("identification fail");
			info = 0;
		 //	request.getRequestDispatcher("JSP/login.jsp").forward(request, response);
		}
		
		JSONObject jo = new JSONObject();
		try {
			jo.put("info",info);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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

}
