package com.doctor;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sound.midi.SysexMessage;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
@MultipartConfig(maxFileSize = 16177215)
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		DatabaseOperation.loadJDBCDriverAndCreateConnection();

		try (PrintWriter out = response.getWriter()) {
			// Getting the parameters from web page
			String Firstname = request.getParameter("firstname");
			String Lastname = request.getParameter("lastname");
			String Email = request.getParameter("email");
			String Age = request.getParameter("age");
			String Dateofbirth =request.getParameter("dateofbirth"); 
			String Gender = request.getParameter("gender");
			String Mobnumber = request.getParameter("mobnumber");
			String Biography = request.getParameter("biography");
			String AddLine1 = request.getParameter("line1");
			String AddLine2 = request.getParameter("line2");
			String Country = request.getParameter("country");
			String State = request.getParameter("state");
			String City = request.getParameter("city");
			String Postalcode = request.getParameter("postalcode");
			String Pricing = request.getParameter("pricing");
			String Price = request.getParameter("price");
			String Services = request.getParameter("services");
			String Specialization = request.getParameter("specialization");
			String Degree = request.getParameter("degree");
			String College = request.getParameter("college");
			String Eduyear = request.getParameter("year");
			String Hospital = request.getParameter("hospital");
			String Expfrom = request.getParameter("from");
			String Expto = request.getParameter("to");
			String Designation = request.getParameter("designation");
			String Award = request.getParameter("award");
			String Awardyear = request.getParameter("awardyear");
			
			HttpSession session = request.getSession(false);
			
			String Username = String.valueOf(session.getAttribute("Username"));
			
			System.out.println(Username);

			// Input stream of the upload file
			InputStream inputStream = null;

			// Obtains the upload file
			// part in this multipart request
			Part filePart = request.getPart("photo");
			if (filePart != null) {

				// Prints out some information
				// for debugging
				System.out.println(filePart.getName());

				System.out.println(filePart.getSize());
				System.out.println(filePart.getContentType());

				// Obtains input stream of the upload file
				inputStream = filePart.getInputStream();

				// Sends the statement to the
				// database server
				if (DatabaseOperation.editDoctorProfile(inputStream, Firstname, Lastname, Email, Age, Dateofbirth, Gender, Mobnumber,
						Biography, AddLine1, AddLine2, Country, State, City, Postalcode, Pricing, Price, Services,
						Specialization, Degree, College, Eduyear, Hospital, Expfrom, Expto, Designation, Award,
						Awardyear, Username) >= 0) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Profile updated sussesfully.');");
					out.println("</script>");
					response.sendRedirect("doctorprofile.jsp");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Profile not updated.');");
					out.println("</script>");

				}
			}

		} catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.setContentType("text/html;charset=UTF-8");
//
//	}

}
