package com.doctor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AppointmentServlet
 */
@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppointmentServlet() {
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
			String firstName = request.getParameter("firstname");
			String lastName = request.getParameter("lastname");
			String email = request.getParameter("email");
			String age = request.getParameter("age");
			String dateOfBirth = request.getParameter("dateofbirth");
			String gender = request.getParameter("gender");
			String mobnumber = request.getParameter("mobnumber");

			String previouslyAttend = request.getParameter("select");
			String textArea = request.getParameter("textarea");
			String appoiDate = request.getParameter("appodate");
			String docName = request.getParameter("docname");

			if (DatabaseOperation.takeAppointment(firstName, lastName, email, age, dateOfBirth, gender,mobnumber,
					previouslyAttend, textArea, appoiDate, docName) == 1) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Appointment is successfully submitted.')");
				out.println("</script>");
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("appointmentform.jsp");
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
