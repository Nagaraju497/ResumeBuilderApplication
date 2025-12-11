package Contolller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DatabaseDemo.DataBase;

@WebServlet("/SaveResume")
public class SaveResumeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from form
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");
        String skills = request.getParameter("skills");
        String experience = request.getParameter("experience");
        String education = request.getParameter("education");
        String projects = request.getParameter("projects");
        String address = request.getParameter("address");
        String citizenship = request.getParameter("citizenship");
        String template = request.getParameter("template");

        // Session validation
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.getWriter().println("<h2>Please login again.</h2>");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        try (Connection con = DataBase.getConnection()) {
            // ✅ Insert or Update existing resume record
            String sql = "INSERT INTO resume (user_id, first_name, last_name, email, phone_number, skills, experience, education, projects, address, citizenship, template) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) "
                    + "ON DUPLICATE KEY UPDATE "
                    + "first_name=?, last_name=?, email=?, phone_number=?, skills=?, experience=?, education=?, projects=?, address=?, citizenship=?, template=?";

            PreparedStatement ps = con.prepareStatement(sql);
            // Insert
            ps.setInt(1, userId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, skills);
            ps.setString(7, experience);
            ps.setString(8, education);
            ps.setString(9, projects);
            ps.setString(10, address);
            ps.setString(11, citizenship);
            ps.setString(12, template);

            // Update
            ps.setString(13, firstName);
            ps.setString(14, lastName);
            ps.setString(15, email);
            ps.setString(16, phone);
            ps.setString(17, skills);
            ps.setString(18, experience);
            ps.setString(19, education);
            ps.setString(20, projects);
            ps.setString(21, address);
            ps.setString(22, citizenship);
            ps.setString(23, template);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // ✅ Redirect to preview page after save
                response.sendRedirect("resumecreatedjsp.jsp");
            } else {
                response.getWriter().println("<h3>Failed to save resume. Please try again.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error saving resume: " + e.getMessage() + "</h3>");
        }
    }

    // Optional support for GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
