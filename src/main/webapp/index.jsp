<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CD List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background: #f7f9fc;
        }
        h2 {
            text-align: center;
            color: #2d572c;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center; /* mặc định vẫn căn giữa */
        }
        th {
            background-color: #2d572c;
            color: white;
            font-size: 16px;
        }
        /* Riêng cột mô tả thì căn trái */
        td.desc {
            text-align: left;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 14px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h2>CD List</h2>
<table>
    <tr>
        <th>Description</th>
        <th>Price</th>
        <th></th>
    </tr>
    <tr>
        <td class="desc">86 (the band) - True Life Songs and Pictures</td>
        <td>$14.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="desc" value="86 (the band) - True Life Songs and Pictures">
                <input type="hidden" name="price" value="14.95">
                <input type="submit" value="Add To Cart" class="btn">
            </form>
        </td>
    </tr>
    <tr>
        <td class="desc">Paddlefoot - The first CD</td>
        <td>$12.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="desc" value="Paddlefoot - The first CD">
                <input type="hidden" name="price" value="12.95">
                <input type="submit" value="Add To Cart" class="btn">
            </form>
        </td>
    </tr>
    <tr>
        <td class="desc">Paddlefoot - The second CD</td>
        <td>$14.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="desc" value="Paddlefoot - The second CD">
                <input type="hidden" name="price" value="14.95">
                <input type="submit" value="Add To Cart" class="btn">
            </form>
        </td>
    </tr>
    <tr>
        <td class="desc">Joe Rut - Genuine Wood Grained Finish</td>
        <td>$14.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="desc" value="Joe Rut - Genuine Wood Grained Finish">
                <input type="hidden" name="price" value="14.95">
                <input type="submit" value="Add To Cart" class="btn">
            </form>
        </td>
    </tr>
</table>

</body>
</html>
