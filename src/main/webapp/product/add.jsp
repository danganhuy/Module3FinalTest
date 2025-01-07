
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 500px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            box-sizing: border-box;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            box-sizing: border-box;
        }
        button {
            margin-top: 15px;
            padding: 10px 20px;
        }
        .error {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <h1>Thêm mới sản phẩm</h1>
    <h2><a href="product">Quay lại danh sách</a></h2>
    <form id="productForm" method="post">
        <label for="productName">Tên sản phẩm:</label>
        <input type="text" id="productName" name="productName" required>
        <div id="nameError" class="error"></div>

        <label for="price">Giá (VNĐ):</label>
        <input type="number" id="price" name="price" required>
        <div id="priceError" class="error"></div>

        <label for="discount">Giảm giá (%):</label>
        <select id="discount" name="discount">
            <option value="0">0%</option>
            <option value="5">5%</option>
            <option value="10">10%</option>
            <option value="15">15%</option>
        </select>
        <div id="discountError" class="error"></div>

        <label for="stock">Tồn kho:</label>
        <input type="number" id="stock" name="stock" required>

        <label for="description">Mô tả:</label>
        <textarea id="description" name="description" rows="4"></textarea>

        <button type="submit" value="submit">Thêm sản phẩm</button>
    </form>

    <script>
        const form = document.getElementById('productForm');
        const nameError = document.getElementById('nameError');
        const priceError = document.getElementById('priceError');
        const discountError = document.getElementById('discountError');

        // form.addEventListener('submit', function(event) {
        //     nameError.textContent = '';
        //     priceError.textContent = '';
        //     discountError.textContent = '';
        //
        //     let valid = true;
        //
        //     const productName = document.getElementById('productName').value.trim();
        //     if (!productName) {
        //         nameError.textContent = 'Tên sản phẩm không được để trống.';
        //         valid = false;
        //     }
        //
        //     const price = parseFloat(document.getElementById('price').value);
        //     if (isNaN(price) || price < 0) {
        //         priceError.textContent = 'Giá không được âm.';
        //         valid = false;
        //     }
        //
        //     const discount = parseFloat(document.getElementById('discount').value);
        //     if (isNaN(discount) || discount < 0 || discount >= 100) {
        //         discountError.textContent = 'Giảm giá phải >= 0 và < 100.';
        //         valid = false;
        //     }
        //
        //     const stock = parseInt(document.getElementById("stock").value);
        //     if (isNaN(stock) || stock < 0) {
        //         discountError.textContent = 'Lượng tồn kho không đực âm';
        //         valid = false;
        //     }
        //
        //     if (!valid) {
        //         event.preventDefault();
        //     } else {
        //         alert('Sản phẩm đã được thêm thành công!');
        //     }
        // });
    </script>

</body>
</html>

