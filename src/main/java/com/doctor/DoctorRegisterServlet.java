package com.doctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DoctorRegisterServlet
 */
@WebServlet("/DoctorRegisterServlet")
public class DoctorRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoctorRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		DatabaseOperation.loadJDBCDriverAndCreateConnection();

		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			String Name = request.getParameter("name");
			String Username = request.getParameter("username");
			String Password = request.getParameter("password");
			String Email = request.getParameter("email");
			String Mobile = request.getParameter("mobilenumber");

			String[] arrName = Name.split(" ");
			String Firstname = Array.get(arrName, 0).toString();
			String Lastname = Array.get(arrName, 1).toString();

//			System.out.println(Firstname + Lastname);

			if (DatabaseOperation.registerDoctor(Name, Username, Password, Email, Mobile) == 1
					&& DatabaseOperation.insertDoctorProfile(Firstname, Lastname, Username, Email, Mobile) == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("Username", Username);
				session.setAttribute("Doctorname", Name);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("DoctorSignUpError.jsp");
			}
		} catch (Exception ex) {
//			System.out.println("<script type=\"text/javascript\">");
//			System.out.println("alert(ex);");
//			System.out.println("location='doctorregister.jsp';");
//			System.out.println("</script>");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
