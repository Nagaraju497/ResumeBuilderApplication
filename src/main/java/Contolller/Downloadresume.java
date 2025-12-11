package Contolller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.itextpdf.html2pdf.HtmlConverter;
import DatabaseDemo.DataBase; // ✅ make sure this import matches your DB helper class

@WebServlet("/downloadresume")
public class Downloadresume extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Step 1: Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.setContentType("text/html");
            response.getWriter().println("<h2 style='color:red;text-align:center;'>Please login again to download your resume.</h2>");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        // ✅ Step 2: Variables to store data from DB
        String firstName = null, lastName = null, email = null, phone = null,
               skills = null, experience = null, projects = null, education = null,
               address = null, citizenship = null, template = null;

        try (Connection con = DataBase.getConnection()) {
            String sql = "SELECT first_name, last_name, email, phone_number, skills, experience, projects, education, address, citizenship, template " +
                         "FROM resume WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                firstName = rs.getString("first_name");
                lastName = rs.getString("last_name");
                email = rs.getString("email");
                phone = rs.getString("phone_number");
                skills = rs.getString("skills");
                experience = rs.getString("experience");
                projects = rs.getString("projects");
                education = rs.getString("education");
                address = rs.getString("address");
                citizenship = rs.getString("citizenship");
                template = rs.getString("template");
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<h2 style='color:red;text-align:center;'>No resume data found for your account.</h2>");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h2 style='color:red;text-align:center;'>Error retrieving resume data.</h2>");
            return;
        }

        if (template == null) {
            template = "Professional Gray";
        }

        // ✅ Step 3: Choose template
        String htmlContent = "";
        switch (template) {
            case "Creative Orange":
                htmlContent = getCreativeOrangeTemplate(firstName, lastName, email, phone, skills, experience, projects, education, address, citizenship);
                break;
            case "Elegant Blue":
                htmlContent = getElegantBlueTemplate(firstName, lastName, email, phone, skills, experience, projects, education, address, citizenship);
                break;
            default:
                htmlContent = getProfessionalGrayTemplate(firstName, lastName, email, phone, skills, experience, projects, education, address, citizenship);
                break;
        }

        // ✅ Step 4: Convert HTML → PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=" + template.replace(" ", "_") + "_Resume.pdf");
        OutputStream out = response.getOutputStream();
        HtmlConverter.convertToPdf(new ByteArrayInputStream(htmlContent.getBytes()), out);
        out.close();
    }

    // ---------- TEMPLATE 1 ----------
    private String getProfessionalGrayTemplate(String fn, String ln, String email, String phone, String skills, String exp, String proj, String edu, String addr, String citizen) {
        return "<html><head><style>" +
                "body{font-family:Arial, sans-serif;background:#f4f4f4;padding:40px;}" +
                ".box{background:#fff;padding:30px;border-radius:12px;width:80%;margin:auto;" +
                "box-shadow:0 0 15px rgba(0,0,0,0.2);}" +
                "h2{color:#333;border-bottom:2px solid #666;padding-bottom:8px;}" +
                "h3{color:#444;border-bottom:1px solid #ccc;}" +
                "b{color:#222;}" +
                "p{font-size:14px;color:#333;line-height:1.5;}" +
                "</style></head><body><div class='box'>" +
                "<p><b>Name:</b> " + fn + " " + ln + "</p>" +
                "<p><b>Email:</b> " + email + "</p>" +
                "<p><b>Phone:</b> " + phone + "</p>" +
                "<h3>Education</h3><p>" + edu + "</p>" +
                "<h3>Skills</h3><p>" + skills + "</p>" +
                "<h3>Experience</h3><p>" + exp + "</p>" +
                "<h3>Projects</h3><p>" + proj + "</p>" +
                "<h3>Address</h3><p>" + addr + "</p>" +
                "<h3>Citizenship</h3><p>" + citizen + "</p>" +
                "</div></body></html>";
    }

    // ---------- TEMPLATE 2 ----------
    private String getCreativeOrangeTemplate(String fn, String ln, String email, String phone, String skills, String exp, String proj, String edu, String addr, String citizen) {
        return "<html><head><style>" +
                "body{font-family:'Poppins',sans-serif;background:linear-gradient(to right,#ff9966,#ff5e62);padding:40px;}" +
                ".resume{background:white;border-radius:20px;padding:40px;width:80%;margin:auto;" +
                "box-shadow:0 10px 25px rgba(0,0,0,0.3);}" +
                "h2{color:#ff5e00;border-bottom:3px solid #ff9966;}" +
                "h3{color:#ff5e00;border-bottom:1px solid #ffc3a0;margin-top:20px;}" +
                "b{color:#ff5e00;}" +
                "p{font-size:14px;color:#333;line-height:1.5;}" +
                "</style></head><body><div class='resume'>" +
                "<p><b>Name:</b> " + fn + " " + ln + "</p>" +
                "<p><b>Email:</b> " + email + "</p>" +
                "<p><b>Phone:</b> " + phone + "</p>" +
                "<h3>Education</h3><p>" + edu + "</p>" +
                "<h3>Skills</h3><p>" + skills + "</p>" +
                "<h3>Experience</h3><p>" + exp + "</p>" +
                "<h3>Projects</h3><p>" + proj + "</p>" +
                "<h3>Address</h3><p>" + addr + "</p>" +
                "<h3>Citizenship</h3><p>" + citizen + "</p>" +
                "</div></body></html>";
    }

    // ---------- TEMPLATE 3 ----------
    private String getElegantBlueTemplate(String fn, String ln, String email, String phone, String skills, String exp, String proj, String edu, String addr, String citizen) {
        return "<html><head><style>" +
                "body{font-family:'Segoe UI',sans-serif;background:linear-gradient(to right,#0077b6,#00b4d8);padding:40px;}" +
                ".resume{background:white;border-radius:20px;padding:40px;width:80%;margin:auto;" +
                "box-shadow:0 10px 25px rgba(0,0,0,0.25);}" +
                "h2{color:#0077b6;border-bottom:3px solid #00b4d8;}" +
                "h3{color:#0077b6;border-bottom:1px solid #ade8f4;margin-top:20px;}" +
                "b{color:#0077b6;}" +
                "p{font-size:14px;color:#333;line-height:1.5;}" +
                "</style></head><body><div class='resume'>" +
                "<p><b>Name:</b> " + fn + " " + ln + "</p>" +
                "<p><b>Email:</b> " + email + "</p>" +
                "<p><b>Phone:</b> " + phone + "</p>" +
                "<h3>Education</h3><p>" + edu + "</p>" +
                "<h3>Skills</h3><p>" + skills + "</p>" +
                "<h3>Experience</h3><p>" + exp + "</p>" +
                "<h3>Projects</h3><p>" + proj + "</p>" +
                "<h3>Address</h3><p>" + addr + "</p>" +
                "<h3>Citizenship</h3><p>" + citizen + "</p>" +
                "</div></body></html>";
    }
}
