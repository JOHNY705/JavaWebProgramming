package models;

public class CartItem {
    private int productID;
    private double price;
    private int qty;

    public CartItem(int productID, double price, int qty) {
        this.productID = productID;
        this.price = price;
        this.qty = qty;
    }

    public int getProductID() {
        return productID;
    }

    public int getQty() {
        return qty;
    }

    public double getPrice() {
        return price;
    }
    
    public void setQty(int qty) {
        this.qty = qty;
    }

}
