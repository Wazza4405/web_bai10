<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="murach.cart.Cart" %>
<%@ page import="murach.cart.Item" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background: #f7f9fc;
        }
        h2 {
            color: #2e7d32;
            border-bottom: 2px solid #ccc;
            padding-bottom: 6px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-bottom: 20px;
            background: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        th {
            background: #4caf50;
            color: white;
        }
        .form-section {
            background: #fff;
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 20px;
            width: 60%;
        }
        label {
            display: inline-block;
            width: 140px;
            font-weight: bold;
        }
        input[type=text], input[type=email] {
            width: 250px;
            padding: 6px;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            padding: 8px 16px;
            background: #4caf50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background: #388e3c;
        }
    </style>
</head>
<body>
<h2>Order Summary</h2>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart != null && !cart.getItems().isEmpty()) {
%>
<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
    </tr>
    <%
        for (Item item : cart.getItems()) {
    %>
    <tr>
        <td><%=item.getQuantity()%></td>
        <td><%=item.getDescription()%></td>
        <td>$<%=item.getPrice()%></td>
        <td>$<%=item.getTotal()%></td>
    </tr>
    <%
        }
    %>
</table>
<p><b>Total: $<%=cart.getTotalAmount()%></b></p>
<%
} else {
%>
<p>Your cart is empty.</p>
<%
    }
%>

<div class="form-section">
    <h2>Customer Information</h2>
    <form action="cart" method="post">
        <input type="hidden" name="action" value="confirm">

        <label>Name:</label><input type="text" name="name" required><br>
        <label>Address:</label><input type="text" name="address" required><br>
        <label>Email:</label><input type="email" name="email" required><br>

        <h2>Payment Information</h2>
        <label>Bank Name:</label><input type="text" name="bank" required><br>

        <div>
            <label>Account Number:</label>
            <input type="text" name="accountNumber" required>
        </div>

        <div>
            <label>Account Holder:</label>
            <input type="text" name="accountHolder" required>
        </div>

        <input type="submit" class="btn" value="Confirm Order">
    </form>
</div>
</body>
</html>
