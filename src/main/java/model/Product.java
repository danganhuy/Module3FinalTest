package model;

public class Product {
    private int productId;
    private String productName;
    private double price;
    private int discount;
    private int stock;
    private String description;

    public Product(int productId, String productName, double price, int discount, int stock, String description) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
        this.description = description;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
