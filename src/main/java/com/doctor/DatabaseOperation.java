package com.doctor;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseOperation {
	static PreparedStatement pstmt;
	static Connection con;
	static Statement stmt;
	static ResultSet rs;

	public static void loadJDBCDriverAndCreateConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(
					"jdbc:sqlserver://localhost:1433;databaseName=Doctor_Appointment;user=sa;password=123;encrypt=true;trustServerCertificate=true");
		} catch (ClassNotFoundException ex) {
			System.out.println(ex);
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}

	public static int registerDoctor(String Name, String Username, String Password, String EmailId, String MobileNo) {
		try {
			pstmt = con.prepareStatement("insert into Doctor values (?,?,?,?,?)");
			pstmt.setString(1, Name);
			pstmt.setString(2, Username);
			pstmt.setString(3, Password);
			pstmt.setString(4, EmailId);
			pstmt.setString(5, MobileNo);
			return pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;
	}

	public static ResultSet checkDoctorUsername(String Username) {
		try {
			pstmt = con.prepareStatement("Select * from Doctor where Username=?");
			pstmt.setString(1, Username);

			rs = pstmt.executeQuery();

		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static ResultSet getDoctorName(String Username) {
		try {
			pstmt = con.prepareStatement("Select Name from Doctor where Username=?");
			pstmt.setString(1, Username);
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static ResultSet getDoctorNames() {
		try {
			pstmt = con.prepareStatement("Select Name from Doctor");
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static boolean loginDoctor(String Username, String Password) {
		try {
			pstmt = con.prepareStatement("Select Password from Doctor where Username=?");
			pstmt.setString(1, Username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("Password").equals(Password)) {
					return true;
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return false;
	}

	public static boolean updateDocPasssword(String Username, String NewPassword) {
		try {
			pstmt = con.prepareStatement("update Doctor set Password=? where Username=?");
			pstmt.setString(1, NewPassword);
			pstmt.setString(2, Username);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return false;
	}

	public static int insertDoctorProfile(String Firstname, String Lastname, String Username, String EmailId,
			String MobileNo) {
		try {
			pstmt = con.prepareStatement(
					"insert into DoctorProfile (First_Name, Last_Name, Username, Email, Mobile_Number) values (?,?,?,?,?)");
			pstmt.setString(1, Firstname);
			pstmt.setString(2, Lastname);
			pstmt.setString(3, Username);
			pstmt.setString(4, EmailId);
			pstmt.setString(5, MobileNo);
			return pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;
	}

	public static ResultSet getDoctorData(String Username) {
		try {
			pstmt = con.prepareStatement("Select * from DoctorProfile where Username=?");
			pstmt.setString(1, Username);
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static ResultSet getDoctorsData() {
		try {
			pstmt = con.prepareStatement("Select * from DoctorProfile");
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static int editDoctorProfile(InputStream inputStream, String firstName, String lastName, String Email,
			String Age, String DateOfbirth, String Gender, String mobNumber, String biography, String addLine1,
			String addLine2, String country, String state, String city, String postalCode, String pricing, String price,
			String services, String specialization, String degree, String college, String eduYear, String hospital,
			String expFrom, String expTo, String designation, String award, String awardYear, String Username) {
		try {
			pstmt = con.prepareStatement(
					"update DoctorProfile set Photo = ?, First_Name = ?, Last_Name = ?, Email = ?, Age = ?, Date_Of_Birth = ?, Gender = ?, Mobile_Number = ?, Biography = ?, Address_Line1 = ?, Address_Line2 = ?, Country = ?, State = ?, City = ?, Postal_Code = ?, Pricing = ?, Price = ?, Services = ?, Specialization = ?, Degree = ?, College = ?, Year_Of_Completion = ?, Hospital = ?, Experience_From = ?, Experience_To=?, Designation = ?, Award = ?, Award_Year = ? where Username=?");
			pstmt.setBlob(1, inputStream);
			pstmt.setString(2, firstName);
			pstmt.setString(3, lastName);
			pstmt.setString(4, Email);
			pstmt.setString(5, Age);
			pstmt.setString(6, DateOfbirth);
			pstmt.setString(7, Gender);
			pstmt.setString(8, mobNumber);
			pstmt.setString(9, biography);
			pstmt.setString(10, addLine1);
			pstmt.setString(11, addLine2);
			pstmt.setString(12, country);
			pstmt.setString(13, state);
			pstmt.setString(14, city);
			pstmt.setString(15, postalCode);
			pstmt.setString(16, pricing);
			pstmt.setString(17, price);
			pstmt.setString(18, services);
			pstmt.setString(19, specialization);
			pstmt.setString(20, degree);
			pstmt.setString(21, college);
			pstmt.setString(22, eduYear);
			pstmt.setString(23, hospital);
			pstmt.setString(24, expFrom);
			pstmt.setString(25, expTo);
			pstmt.setString(26, designation);
			pstmt.setString(27, award);
			pstmt.setString(28, awardYear);
			pstmt.setString(29, Username);
			int i = pstmt.executeUpdate();
			System.out.println(i);
			return i;
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;

	}

	public static int registerPatient(String Name, String Username, String Password, String EmailId, String MobileNo) {
		try {
			pstmt = con.prepareStatement("insert into Patient values (?,?,?,?,?)");
			pstmt.setString(1, Name);
			pstmt.setString(2, Username);
			pstmt.setString(3, Password);
			pstmt.setString(4, EmailId);
			pstmt.setString(5, MobileNo);
			return pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;
	}

	public static ResultSet checkPatientUsername(String Username) {
		try {
			pstmt = con.prepareStatement("Select * from Patient where Username=?");
			pstmt.setString(1, Username);

			rs = pstmt.executeQuery();

		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static ResultSet getPatientName(String Username) {
		try {
			pstmt = con.prepareStatement("Select Name from Patient where Username=?");
			pstmt.setString(1, Username);
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static boolean loginPatient(String Username, String Password) {
		try {
			pstmt = con.prepareStatement("Select Password from Patient where Username=?");
			pstmt.setString(1, Username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("Password").equals(Password)) {
					return true;
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return false;
	}

	public static boolean updatePatientPasssword(String Username, String NewPassword) {
		try {
			pstmt = con.prepareStatement("update Patient set Password=? where Username=?");
			pstmt.setString(1, NewPassword);
			pstmt.setString(2, Username);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return false;
	}

	public static int contactUsForm(String Name, String Email, String Message) {
		try {
			pstmt = con.prepareStatement("insert into ContactUs values (?,?,?)");
			pstmt.setString(1, Name);
			pstmt.setString(2, Email);
			pstmt.setString(3, Message);
			return pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;
	}

	public static int takeAppointment(String FirstName, String LastName, String Email, String Age, String Dateofbirth,
			String Gender, String MobNumber, String Select, String Textarea, String AppoiDate, String DocName) {
		try {
			pstmt = con.prepareStatement("insert into Appointments values (?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, FirstName);
			pstmt.setString(2, LastName);
			pstmt.setString(3, Email);
			pstmt.setString(4, Age);
			pstmt.setString(5, Dateofbirth);
			pstmt.setString(6, Gender);
			pstmt.setString(7, MobNumber);
			pstmt.setString(8, Select);
			pstmt.setString(9, Textarea);
			pstmt.setString(10, AppoiDate);
			pstmt.setString(11, DocName);
			return pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;
	}

	public static int addService(String Name, String Discription) {
		try {
			pstmt = con.prepareStatement("insert into Services values (?,?)");
			pstmt.setString(1, Name);
			pstmt.setString(2, Discription);
			return pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return -1;
	}

	public static ResultSet getServicesData() {
		try {
			pstmt = con.prepareStatement("Select * from Services");
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

	public static ResultSet getDocCount() {
		try {
			pstmt = con.prepareStatement("Select count(*) from DoctorsProfile");
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}
	
	public static ResultSet getPatientData() {
		try {
			pstmt = con.prepareStatement("Select * from Patient");
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}
	
	public static ResultSet getAppointmentData() {
		try {
			pstmt = con.prepareStatement("Select * from Appointments");
			rs = pstmt.executeQuery();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return rs;
	}

}
