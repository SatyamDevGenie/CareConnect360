<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.doctor.DatabaseOperation"%>
<%@page import="java.sql.ResultSet"%>
<%
ResultSet rs;
DatabaseOperation.loadJDBCDriverAndCreateConnection();
String Username = request.getParameter("val");
rs = DatabaseOperation.checkDoctorUsername(Username);

if (rs.next()) {
	out.println("1");
} else {
	out.println("0");
}
%>