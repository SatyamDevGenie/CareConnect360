package com.doctor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangeDocPasswordServlet")
public class ChangeDocPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeDocPasswordServlet() {
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

		response.setContentType("text/html;charset=UTF-8");
		DatabaseOperation.loadJDBCDriverAndCreateConnection();

		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */

			String Username = request.getParameter("username");
			String newPassword = request.getParameter("newpassword");

			if (DatabaseOperation.updateDocPasssword(Username, newPassword)) {
				response.sendRedirect("index.jsp");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Incorrect Username.');");
				out.println("</script>");
				response.sendRedirect("changepatientpassword.jsp");
			}
		} catch (Exception ex) {

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
