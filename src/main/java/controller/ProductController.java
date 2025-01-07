package controller;

import DAO.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product", urlPatterns = {"/product"})

public class ProductController extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

        System.out.println(action);
        switch (action) {
            case "add":
                showAddProduct(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "top":
                showTopSellerProducts(request, response);
                break;
            default:
                showListProducts(request, response);
                break;
        }
    }

    private void showListProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showTopSellerProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int top = Integer.parseInt(request.getParameter("top"));
        List<Product> products = productDAO.selectTopSellerProducts(top);
        request.setAttribute("top", top);
        request.setAttribute("products", products);
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showAddProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("product/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "add":
                addProduct(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                showListProducts(request, response);
                break;
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");

        Product product = new Product(-1,productName,price,discount,stock,description);
        productDAO.addProduct(product);
        response.sendRedirect(request.getContextPath() + "/product");
    }

}
