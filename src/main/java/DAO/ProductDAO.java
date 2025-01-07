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
}
