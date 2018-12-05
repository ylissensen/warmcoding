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

import warmcoding.classes.user;
import warmcoding.daoiml.UserDaoImpl;

/**
 * Servlet implementation class registerServlet
 */
/*
 *  作者: 李豫
 * */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		user user = new user();
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		boolean IDENTIFICATION = false;
		boolean REGISTER = false;
		int info = 0;
		
		if(password.equals(password1)==true) {
			System.out.println("password identification success");
			user.setUserName(username);
			user.setUserPassWord(password);
			user.setUserIdentificationCode(0);
			
			IDENTIFICATION = userDaoImpl.findUser(user);
			if(IDENTIFICATION == false) {
				System.out.println("user identification success");
				REGISTER = userDaoImpl.addUser(user);
				if(REGISTER == true) {
					System.out.println("register success");
					info = 1;
					//request.getRequestDispatcher("JSP/login.jsp").forward(request, response);
				}else {
					System.out.println("register fail");
					info = -1;
					//request.getRequestDispatcher("JSP/register.jsp").forward(request, response);;
				}
			}else {
				System.out.println("user identification fail");
				info = -2;
				//request.getRequestDispatcher("JSP/register.jsp").forward(request, response);;
			}
			
		}else {
			System.out.println("password identification fail");
			info = -3;
			//request.getRequestDispatcher("JSP/register.jsp").forward(request, response);
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
