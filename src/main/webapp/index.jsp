<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CD List</title>
    <style>
        h2 { color: green; }
        table { border-collapse: collapse; width: 70%; }
        th, td { border: 1px solid black; padding: 6px; }
        th { background: #f0f0f0; }
        td.desc { width: 350px; }
        td.price { width: 100px; text-align: center; }   /* căn giữa Price */
        td.action { width: 120px; text-align: center; }
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
<h2>CD list</h2>
<table>
    <tr>
        <th>Description</th>
        <th>Price</th>
        <th></th>
    </tr>
    <tr>
        <td class="desc">86 (the band) - True Life Songs and Pictures</td>
        <td class="price">$14.95</td>
        <td class="action"><a class="btn" href="cart?action=add&desc=86 (the band) - True Life Songs and Pictures&price=14.95">Add To Cart</a></td>
    </tr>
    <tr>
        <td class="desc">Paddlefoot - The first CD</td>
        <td class="price">$12.95</td>
        <td class="action"><a class="btn" href="cart?action=add&desc=Paddlefoot - The first CD&price=12.95">Add To Cart</a></td>
    </tr>
    <tr>
        <td class="desc">Paddlefoot - The second CD</td>
        <td class="price">$14.95</td>
        <td class="action"><a class="btn" href="cart?action=add&desc=Paddlefoot - The second CD&price=14.95">Add To Cart</a></td>
    </tr>
    <tr>
        <td class="desc">Joe Rut - Genuine Wood Grained Finish</td>
        <td class="price">$14.95</td>
        <td class="action"><a class="btn" href="cart?action=add&desc=Joe Rut - Genuine Wood Grained Finish&price=14.95">Add To Cart</a></td>
    </tr>
</table>
</body>
</html>
