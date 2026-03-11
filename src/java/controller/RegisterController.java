/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String path = request.getServletPath();
        if ("/logout".equals(path)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }

        request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Thiết lập tiếng Việt cho request
        request.setCharacterEncoding("UTF-8");

        // 2. Lấy dữ liệu chính xác theo thuộc tính 'name' trong JSP của bạn
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Đường dẫn JSP dùng chung để dễ bảo trì
        String registerJSP = "/views/auth/register.jsp";

        // 3. Kiểm tra logic (Validation)
        // Kiểm tra trống
        if (lastName == null || firstName == null || email == null || phone == null
                || password == null || confirmPassword == null
                || lastName.trim().isEmpty() || firstName.trim().isEmpty()
                || email.trim().isEmpty() || phone.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ tất cả các trường thông tin.");
            request.getRequestDispatcher(registerJSP).forward(request, response);
            return;
        }

        // Kiểm tra định dạng số điện thoại (10 số, bắt đầu bằng 0)
        if (!phone.matches("^0\\d{9}$")) {
            request.setAttribute("error", "Số điện thoại phải gồm 10 chữ số và bắt đầu bằng số 0.");
            request.getRequestDispatcher(registerJSP).forward(request, response);
            return;
        }

        // Kiểm tra độ dài mật khẩu
        if (password.length() < 6) {
            request.setAttribute("error", "Mật khẩu phải có tối thiểu 6 ký tự.");
            request.getRequestDispatcher(registerJSP).forward(request, response);
            return;
        }

        // Kiểm tra xác nhận mật khẩu
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher(registerJSP).forward(request, response);
            return;
        }
        try {
            AccountDAO dao = new AccountDAO();

            if (dao.isEmailExists(email)) {
                request.setAttribute("error", "Email đã tồn tại");
                request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
                return;
            }

            if (dao.isPhoneExists(phone)) {
                request.setAttribute("error", "Số điện thoại đã tồn tại");
                request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
                return;
            }

            Account acc = new Account();
            acc.setFirstName(firstName);
            acc.setLastName(lastName);
            acc.setEmail(email);
            acc.setPhoneNumber(phone);
            acc.setPasswordHash(password);
            acc.setAvatarUrl("assets/img/avatar/avatar3.jpg");
            dao.createAccount(acc);
            response.sendRedirect(request.getContextPath() + "/login");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Hệ thống gặp lỗi: " + e.getMessage());
            request.getRequestDispatcher(registerJSP).forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
