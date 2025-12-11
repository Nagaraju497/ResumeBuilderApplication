package Contolller;

/*import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseDemo.DataBase;

@WebServlet("/viewresume")
public class ViewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handles both GET and POST
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            response.getWriter().println("<h2>Please login again.</h2>");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        String query = "SELECT * FROM resume WHERE user_id = ?";

        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("first_name", rs.getString("first_name"));
                request.setAttribute("last_name", rs.getString("last_name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone_number", rs.getString("phone_number"));
                request.setAttribute("education", rs.getString("education"));
                request.setAttribute("skills", rs.getString("skills"));
                request.setAttribute("experience", rs.getString("experience"));
                request.setAttribute("projects", rs.getString("projects"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("citizenship", rs.getString("citizenship"));

            } else {
                request.setAttribute("message", "No resume found for this user.");
            }

            RequestDispatcher rd = request.getRequestDispatcher("viewresume.jsp");
            rd.forward(request, response);
            String template = rs.getString("template");
            RequestDispatcher rd1 = request.getRequestDispatcher(template);
            rd.forward(request, response);


        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error retrieving resume details.</h3>");
        }
    }
}*/


import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DatabaseDemo.DataBase;

@WebServlet("/viewresume")
public class ViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.getWriter().println("<h2>Please login again.</h2>");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        try (Connection con = DataBase.getConnection()) {
            String sql = "SELECT first_name, last_name, email, phone_number, education, experience, projects, skills, address, citizenship, template "
                       + "FROM resume WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("first_name", rs.getString("first_name"));
                request.setAttribute("last_name", rs.getString("last_name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone_number", rs.getString("phone_number"));
                request.setAttribute("education", rs.getString("education"));
                request.setAttribute("experience", rs.getString("experience"));
                request.setAttribute("projects", rs.getString("projects"));
                request.setAttribute("skills", rs.getString("skills"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("citizenship", rs.getString("citizenship"));

                // get selected template from DB
                String template = rs.getString("template");

                if (template == null || template.trim().isEmpty()) {
                    template = "viewresume.jsp"; // fallback if not selected
                } else {
                    template = template + ".jsp"; // ex: template1 → template1.jsp
                }

                // forward to selected template
                RequestDispatcher rd = request.getRequestDispatcher(template);
                rd.forward(request, response);
            } else {
                response.getWriter().println("<h3>No resume found for your account.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error loading resume: " + e.getMessage() + "</h3>");
        }
    }
}
