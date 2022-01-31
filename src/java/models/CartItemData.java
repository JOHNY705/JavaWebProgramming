package models;

public class CartItemData {
    private Product product;
    private int quantity;

    public CartItemData(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public Product getProduct() {
        return product;
    }
    
    public double getTotalPrice() {
        return quantity * product.getPrice();
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
