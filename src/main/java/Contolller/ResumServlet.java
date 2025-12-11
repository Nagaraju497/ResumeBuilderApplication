package Contolller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseDemo.DataBase;

@WebServlet("/create")
public class ResumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.getWriter().println("<h3>Please login first!</h3>");
            response.getWriter().println("<a href='login.jsp'>Go to Login</a>");
            return;
        }


        int userId = (int) session.getAttribute("user_id");  // user_id from login session

        String first = request.getParameter("first_name");
        String last = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");
        String education = request.getParameter("education");
        String skills = request.getParameter("skills");
        String experience = request.getParameter("experience");
        String projects = request.getParameter("projects");
        String address = request.getParameter("address");
        String citizenship = request.getParameter("citizenship");
        String template=request.getParameter("template");
        String query = "INSERT INTO resume(user_id, first_name, last_name, email, phone_number, education, skills, experience, projects, address, citizenship,template) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

        try (Connection con = DataBase.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, first);
            ps.setString(3, last);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, education);
            ps.setString(7, skills);
            ps.setString(8, experience);
            ps.setString(9, projects);
            ps.setString(10, address);
            ps.setString(11, citizenship);
            ps.setString(12,template);
            int rows = ps.executeUpdate();
            System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
            if (rows > 0) {
                response.sendRedirect("resumecreatedjsp.jsp");
                
            } else {
                response.getWriter().println("<h3>Resume not saved! Please try again.</h3>");
            }
       
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
