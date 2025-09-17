package murach.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String desc = request.getParameter("desc");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        if ("add".equalsIgnoreCase(action) && desc != null && priceStr != null) {
            double price = Double.parseDouble(priceStr);
            int quantity = 1;
            if (quantityStr != null) {
                try {
                    quantity = Integer.parseInt(quantityStr);
                } catch (NumberFormatException e) {
                    quantity = 1;
                }
            }
            cart.addItem(new Item(desc, price, quantity));
        }
        else if ("update".equalsIgnoreCase(action) && desc != null && quantityStr != null) {
            int quantity = Integer.parseInt(quantityStr);
            cart.updateItem(desc, quantity);
        }
        else if ("remove".equalsIgnoreCase(action) && desc != null) {
            cart.removeItem(desc);
        }
        else if ("checkout".equalsIgnoreCase(action)) {
            // sang trang checkout.jsp
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }
        else if ("confirm".equalsIgnoreCase(action)) {
            // lưu cart vào PaidOrders rồi reset giỏ
            List<Cart> paidOrders = (List<Cart>) session.getAttribute("paidOrders");
            if (paidOrders == null) {
                paidOrders = new ArrayList<>();
            }
            paidOrders.add(cart);
            session.setAttribute("paidOrders", paidOrders);

            // reset cart
            session.setAttribute("cart", new Cart());

            // sang trang confirm.jsp
            request.getRequestDispatcher("/confirm.jsp").forward(request, response);
            return;
        }

        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
