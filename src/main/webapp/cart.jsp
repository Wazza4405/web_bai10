<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="murach.cart.Item" %>
<%@ page import="murach.cart.Cart" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        h2 { color: green; }
        table { border-collapse: collapse; width: 80%; }
        th, td { border: 1px solid black; padding: 6px; }
        th { background: #f0f0f0; }
        td.desc { width: 350px; }
        td.price, td.amount { width: 100px; text-align: center; }  /* căn giữa Price + Amount */
        input[type=text] { width: 30px; }
        .btn {
            padding: 4px 10px;
            border: 1px solid black;
            background: #f9f9f9;
            text-decoration: none;
            color: black;
            cursor: pointer;
        }
        .btn:hover { background: #e0e0e0; }
    </style>
</head>
<body>
<h2>Your cart</h2>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
%>
<p>Your cart is empty.</p>
<%
} else {
%>
<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th></th>
    </tr>
    <%
        for (Item item : cart.getItems()) {
    %>
    <tr>
        <td>
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="desc" value="<%=item.getDescription()%>"/>
                <input type="text" name="quantity" value="<%=item.getQuantity()%>" size="2"/>
                <input class="btn" type="submit" name="action" value="Update"/>
            </form>
        </td>
        <td class="desc"><%=item.getDescription()%></td>
        <td class="price">$<%=item.getPrice()%></td>
        <td class="amount">$<%=item.getTotal()%></td>
        <td><a class="btn" href="cart?action=remove&desc=<%=item.getDescription()%>">Remove Item</a></td>
    </tr>
    <%
        }
    %>
</table>
<p><strong>Total: $<%=cart.getTotalAmount()%></strong></p>
<p><b>To change the quantity,</b> enter the new quantity and click on the Update button.</p>
<%
    }
%>

<p>
    <a class="btn" href="index.jsp">Continue Shopping</a>
    &nbsp;
    <a class="btn" href="#">Checkout</a>
</p>
</body>
</html>
