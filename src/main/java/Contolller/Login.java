package Contolller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseDemo.DataBase;
@WebServlet("/loginServlet")
public class Login extends HttpServlet {
	
	
protected void doPost(HttpServletRequest request,HttpServletResponse response)  throws IOException {
	response.setContentType("text/html");
	String username=request.getParameter("name");
	String password=request.getParameter("password");
	
	String query="Select * from user where name=? and password=?";
	try {
		
			Connection con=DataBase.getConnection();
			if(con!=null)
			{
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1,username);
				ps.setString(2,password);
			ResultSet rs=	ps.executeQuery();
			System.out.println("nagaraju");
			
			if(rs.next()) {
					HttpSession session=request.getSession();
					session.setAttribute("user_id",rs.getInt("id"));
					response.sendRedirect("dashboard.jsp");
			}else {
				response.getWriter().println("<h2>Invalid Creadiantalas</h2>");
					response.sendRedirect("invalid.jsp");
					
				}
			rs.close();
			}
			else
			{
				response.getWriter().println("<h1>Connection not established</h1");
			}
			
		
		con.close();			
			
			
	
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
