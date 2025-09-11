package murach.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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

        if ("add".equals(action) && desc != null && priceStr != null) {
            double price = Double.parseDouble(priceStr);
            cart.addItem(new Item(desc, price, 1));
        }
        else if ("update".equals(action) && desc != null && quantityStr != null) {
            int quantity = Integer.parseInt(quantityStr);
            cart.updateItem(desc, quantity);
        }
        else if ("remove".equals(action) && desc != null) {
            cart.removeItem(desc);
        }

        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
