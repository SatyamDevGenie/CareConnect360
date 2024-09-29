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
 * Servlet implementation class ContactUsFormServlet
 */
@WebServlet("/ContactUsFormServlet")
public class ContactUsFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUsFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DatabaseOperation.loadJDBCDriverAndCreateConnection();

		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			String Name = request.getParameter("name");
			String Email = request.getParameter("email");
			String Message = request.getParameter("message");

			if (DatabaseOperation.contactUsForm(Name, Email, Message) == 1) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("contact.jsp");
			}
		} catch (Exception ex) {
//			System.out.println("<script type=\"text/javascript\">");
//			System.out.println("alert(ex);");
//			System.out.println("location='doctorregister.jsp';");
//			System.out.println("</script>");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
