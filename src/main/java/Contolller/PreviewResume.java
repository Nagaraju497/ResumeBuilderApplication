package Contolller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DatabaseDemo.DataBase;

@WebServlet("/PreviewResume")
public class PreviewResume extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.getWriter().println("<h2>Please login again.</h2>");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        try (Connection con = DataBase.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM resume WHERE user_id=?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("first_name", rs.getString("first_name"));
                request.setAttribute("last_name", rs.getString("last_name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone_number", rs.getString("phone_number"));
                request.setAttribute("skills", rs.getString("skills"));
                request.setAttribute("experience", rs.getString("experience"));
                request.setAttribute("education", rs.getString("education"));
                request.setAttribute("projects", rs.getString("projects"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("citizenship", rs.getString("citizenship"));

                String template = rs.getString("template");
                if (template == null || template.trim().isEmpty()) {
                    template = "template1"; // default template
                }

                RequestDispatcher rd = request.getRequestDispatcher(template + ".jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("<h3>No resume found for your account.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error loading resume: " + e.getMessage() + "</h3>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
