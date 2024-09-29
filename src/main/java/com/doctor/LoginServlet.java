package com.doctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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

			String LoginType = request.getParameter("logintype");
			String Username = request.getParameter("username");
			String Password = request.getParameter("password");
			ResultSet DoctorName = DatabaseOperation.getDoctorName(Username);
			DoctorName.next();

			if (Username.equals("Admin") && Password.equals("Password")) {
				HttpSession session = request.getSession();
				session.setAttribute("Adminname", Username);
				response.sendRedirect("adminpage.jsp");
			} else {
				if (LoginType.equals("Doctor")) {
					if (DatabaseOperation.loginDoctor(Username, Password)) {
						HttpSession session = request.getSession();
						session.setAttribute("Username", Username);
						String docName = DoctorName.getString("Name");
						session.setAttribute("Doctorname", docName);
						response.sendRedirect("index.jsp");
					} else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Username Or Password is incorrect');");
						out.println("location='login.jsp';");
						out.println("</script>");
					}
				} else if (LoginType.equals("Patient")) {
					if (DatabaseOperation.loginPatient(Username, Password)) {
						ResultSet PatientName = DatabaseOperation.checkPatientUsername(Username);
						PatientName.next();
						String patientName = PatientName.getString("Name");
						HttpSession session = request.getSession();
						session.setAttribute("PatientUsername", Username);
						session.setAttribute("PatientName", patientName);
						response.sendRedirect("index.jsp");
					} else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Username Or Password is incorrect');");
						out.println("location='login.jsp';");
						out.println("</script>");
					}
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex);
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
