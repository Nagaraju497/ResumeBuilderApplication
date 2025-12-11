package Contolller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Registeruser")
public class Register extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		   if (name == null || name.trim().isEmpty() || password == null || password.trim().isEmpty()) {
	            response.getWriter().println("<h3>Please fill all required fields.</h3>");
	            return;
	        }
		
		
		String Query="insert into user (name,password)values(?,?)";
	
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resumeBuilder","root","root");
			PreparedStatement ps=con.prepareStatement(Query);
			ps.setString(1,name);
			ps.setString(2, password);
			int rows=ps.executeUpdate();
				
			if(rows>0) {
				System.out.println("Data Inserted successfulyy");
			response.sendRedirect("login.jsp");
			}
		else {
			System.out.println("Inavalid Credianls");
			response.sendRedirect("invalid.jsp");
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
