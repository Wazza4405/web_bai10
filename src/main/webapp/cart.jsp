<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="murach.cart.Cart" %>
<%@ page import="murach.cart.Item" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>Your Cart</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f8f9fa; }
        h2 { color: #2d572c; }
        table { width: 80%; margin-bottom: 30px; border-collapse: collapse; background: #fff; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #2d572c; color: #fff; }
        input[type="submit"], .btn {
            background-color: #28a745; color: white; border: none;
            padding: 6px 12px; cursor: pointer; border-radius: 4px;
        }
        input[type="submit"]:hover, .btn:hover { background-color: #218838; }
    </style>
</head>
<body>

<h2>Your Cart (Unpaid Orders)</h2>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
%>
<p>Your cart is empty.</p>
<%  } else { %>
<table>
    <tr><th>Quantity</th><th>Description</th><th>Price</th><th>Amount</th><th></th></tr>
    <%
        for (Item item : cart.getItems()) {
    %>
    <tr>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="desc" value="<%= item.getDescription() %>">
                <input type="text" name="quantity" value="<%= item.getQuantity() %>" size="2">
                <input type="submit" value="Update">
            </form>
        </td>
        <td><%= item.getDescription() %></td>
        <td>$<%= item.getPrice() %></td>
        <td>$<%= item.getTotal() %></td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="desc" value="<%= item.getDescription() %>">
                <input type="submit" value="Remove Item">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<p><b>Total:</b> $<%= cart.getTotalAmount() %></p>
<form action="index.jsp" method="post"><input type="submit" value="Continue Shopping"></form>
<form action="cart" method="post">
    <input type="hidden" name="action" value="checkout">
    <input type="submit" value="Checkout">
</form>
<% } %>

<hr>

<h2>Paid Orders</h2>
<%
    List<Cart> paidOrders = (List<Cart>) session.getAttribute("paidOrders");
    if (paidOrders == null || paidOrders.isEmpty()) {
%>
<p>No paid orders yet.</p>
<%
} else {
    for (Cart paid : paidOrders) {
%>
<table>
    <tr><th>Quantity</th><th>Description</th><th>Price</th><th>Amount</th></tr>
    <% for (Item item : paid.getItems()) { %>
    <tr>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getDescription() %></td>
        <td>$<%= item.getPrice() %></td>
        <td>$<%= item.getTotal() %></td>
    </tr>
    <% } %>
</table>
<%
        }
    }
%>

</body>
</html>
