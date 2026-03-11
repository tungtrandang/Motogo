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
public class UpdateAccountController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();
        Account currAcc = (Account) session.getAttribute("acc"); 

        if (currAcc == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("updateInfo".equals(action)) {
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            String phone = request.getParameter("phoneNumber");

            dao.updateProfile(lastName, firstName, phone, currAcc.getEmail());
            currAcc.setLastName(lastName);
            currAcc.setFirstName(firstName);
            currAcc.setPhoneNumber(phone);
            session.setAttribute("acc", currAcc);

            request.setAttribute("message", "Cập nhật thông tin thành công!");

        } else if ("changePass".equals(action)) {
            String oldPass = request.getParameter("oldPassword");
            String newPass = request.getParameter("newPassword");
            String confirmPass = request.getParameter("confirmPassword");

            if (!currAcc.getPasswordHash().equals(oldPass)) {
                request.setAttribute("error", "Mật khẩu cũ không chính xác!");
            } else if (!newPass.equals(confirmPass)) {
                request.setAttribute("error", "Xác nhận mật khẩu mới không khớp!");
            } else {
                dao.changePassword(currAcc.getEmail(), newPass);
                currAcc.setPasswordHash(newPass); 
                request.setAttribute("message", "Đổi mật khẩu thành công!");
            }
        }
        request.getRequestDispatcher("/views/customer/profile.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
