<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .controls {
            margin-bottom: 10px;
        }
        .controls button {
            padding: 8px 16px;
            margin-right: 10px;
        }
        .controls select {
            padding: 8px;
        }
    </style>
</head>
<body>

    <h1>Danh sách sản phẩm</h1>

    <div class="controls">
        <button type="button" onclick="handleAddProduct()">Thêm sản phẩm</button>
    </div>
    <div>
        <label for="topProducts">Xem top sản phẩm bán chạy:</label>
        <select id="topProducts" onchange="handleSelectTopProduct()">
            <option value="">-- Chọn --</option>
            <option value="top10">Top 10</option>
            <option value="top20">Top 20</option>
            <option value="top50">Top 50</option>
        </select>
    </div>

    <table>
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Khuyến mãi</th>
                <th>Tồn kho</th>
                <th>Mô tả</th>
            </tr>
        </thead>
        <tbody id="productTableBody">
            <c:forEach items="${products}" var="product">
                <tr>
                    <td><c:out value="${product.getProductId()}"/></td>
                    <td><c:out value="${product.getProductName()}"/></td>
                    <td><c:out value="${product.getPrice    ()}"/></td>
                    <td><c:out value="${product.getDiscount()}"/></td>
                    <td><c:out value="${product.getStock()}"/></td>
                    <td><c:out value="${product.getDescription()}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script>
        function handleAddProduct() {
            // Xử lý khi người dùng nhấn nút "Thêm sản phẩm"
            alert('Chức năng thêm sản phẩm chưa được triển khai.');
        }

        function handleSelectTopProduct() {
            const select = document.getElementById('topProducts');
            const value = select.value;
            if(value) {
                alert('Hiển thị ' + value + ' sản phẩm bán chạy. (Chức năng chưa triển khai)');
            }
        }
    </script>

</body>
</html>
