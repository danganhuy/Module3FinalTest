package DAO;

import model.Product;
import utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();
        String sql = "select * from products";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int discount = rs.getInt("discount");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                Product product = new Product(productId, productName, price, discount, stock, description);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Products (productName, price, discount, stock, description) VALUES\n" +
                "(?,?,?,?,?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {

            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getDiscount());
            preparedStatement.setInt(4, product.getStock());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Product> selectTopSellerProducts(int top) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.* FROM Products p JOIN\n" +
                "(SELECT p.productId AS id, COUNT(DISTINCT od.orderId) AS order_count\n" +
                "FROM Products p\n" +
                "JOIN OrderDetails od ON p.productId = od.productId\n" +
                "GROUP BY p.productId\n" +
                "ORDER BY order_count DESC\n" +
                "LIMIT ?) AS Result\n" +
                "ON p.productId = Result.id;";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {

            preparedStatement.setInt(1, top);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int discount = rs.getInt("discount");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                Product product = new Product(productId, productName, price, discount, stock, description);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}
