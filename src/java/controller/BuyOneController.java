/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDTO;
import model.CartDTO;
import model.OrderDTO;

/**
 *
 * @author huynh
 */
public class BuyOneController extends HttpServlet {

    private static final String HOME = "HomeController";
    private static final String SUCCESS = "SendMail.jsp";
    private static final String CART = "CartController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            HttpSession session = request.getSession();
            UserDTO account = (UserDTO)session.getAttribute("LOGIN_USER");
            ProductDAO productDAO = new ProductDAO();
            OrderDAO orderDAO = new OrderDAO();
            ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("CART_LIST");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            
            int productId = Integer.parseInt(request.getParameter("id"));
            int productQuantity = Integer.parseInt(request.getParameter("quantity"));
            if (productQuantity <= 0) {
                productQuantity = 1;
            }
            
            for(CartDTO c : cartList) {
                if (c.getId() == productId) {
                    if(productQuantity > productDAO.getQuantity(productId)) {
                    request.setAttribute("alert", "Số lượng mua vượt quá số lượng trong kho!");
                    cartList.remove(c);
                    url = CART;
                    return;
                    }
                }
            }
            
            OrderDTO order = new OrderDTO();
            order.setUserId(account.getUserID());
            order.setProductId(productId);
            order.setPrice(productDAO.getPrice(productId));
            order.setQuantity(productQuantity);
            
            int total =0;
            for(CartDTO c : cartList) {
                if(c.getId() == productId) {
                    total = c.getAmount()*c.getPrice();
                    
                }
            }
            
            order.setTotal(total);
            order.setDate(sdf.format(date));
            
            boolean checkAddOrder = orderDAO.addOrder(order); // insert success order rồi mới đc insert orderDetail
            if(checkAddOrder) {
                orderDAO.addOrderDetail(order);
            }
            
            if (cartList != null) {
                for (CartDTO c : cartList) {
                    if (c.getId() == productId) {
                        int quantityLeft = productDAO.getQuantity(productId) - c.getAmount(); //số lượng còn lại = sl trong SQL - sl mua
                        productDAO.updateQuantity(quantityLeft, productId); //sau khi mua thì update lại sl trong SQL
                        cartList.remove(c); //mua thành công thì bỏ sp ra khỏi giỏ
                        request.setAttribute("alert", "Mua thành công!");
                        url = SUCCESS;
                        break;
                    }
                }
            }
            
        } catch (Exception e) {
            log("Error at BuyOneController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
