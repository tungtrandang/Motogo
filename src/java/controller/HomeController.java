/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BikeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Bike;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        // Kiểm tra session user dùng chung cho các case cần đăng nhập
        Object userObj = (request.getSession(false) != null) ? request.getSession().getAttribute("acc") : null;

        switch (path) {
            case "/home":
                BikeDAO bikeDao = new BikeDAO();
                List<Bike> listBikes = bikeDao.getTopBikes();
                request.setAttribute("listBikes", listBikes);
                System.out.println("Top bikes: " + listBikes.size());
                request.getRequestDispatcher("/views/customer/home.jsp").forward(request, response);
                break;
            case "/bikes":
                BikeDAO bikeDAO = new BikeDAO();
                List<Bike> list = bikeDAO.getAllBikes(); // Hàm lấy danh sách xe từ DB
                request.setAttribute("bikes", list);
                request.getRequestDispatcher("/views/customer/bikes.jsp").forward(request, response);
                break;

            case "/booking":
                request.getRequestDispatcher("/views/customer/booking.jsp").forward(request, response);
                break;

            case "/prici-policy":
                // Trong ảnh file của bạn bị viết là "prici-policy.jsp"
                request.getRequestDispatcher("/views/customer/prici-policy.jsp").forward(request, response);
                break;

            case "/forgetpassword":
                request.getRequestDispatcher("/views/customer/forgetpassword.jsp").forward(request, response);
                break;

            case "/profile":
                request.getRequestDispatcher("/views/customer/profile.jsp").forward(request, response);
                break;

            case "/changepassword":
                request.getRequestDispatcher("/views/customer/changepassword.jsp").forward(request, response);
                break;

            case "/history":
                if (userObj == null) {
                    response.sendRedirect(request.getContextPath() + "/login");
                    return;
                }
                // Thực hiện logic lấy dữ liệu từ DAO ở đây nếu cần
                request.getRequestDispatcher("/views/customer/history.jsp").forward(request, response);
                break;

            case "/order-detail":
                // Trong ảnh là order-detail.jsp thay vì invoice-detail
                request.getRequestDispatcher("/views/customer/order-detail.jsp").forward(request, response);
                break;

            case "/payment":
                request.getRequestDispatcher("/views/customer/payment.jsp").forward(request, response);
                break;

            case "/about":
                request.getRequestDispatcher("/views/customer/about.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/home");
                break;
        }
    }
}
