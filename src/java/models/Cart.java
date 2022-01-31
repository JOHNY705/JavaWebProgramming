package models;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> cartItems;
    private int totalItems;
    private double totalPrice;

    public Cart() {
        cartItems = new ArrayList<>();
        totalItems = 0;
        totalPrice = 0.0;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
    
    private void updateCartData() {
        int counter = 0;
        double newTotal = 0.0;
        
        for (CartItem item : cartItems) {
            counter += item.getQty();
            newTotal += item.getQty() * item.getPrice();
        }
        
        totalItems = counter;
        totalPrice = newTotal;
    }
    
    public void addCartItem(int productID, double productPrice, int qty) {
        
        CartItem item = cartItems.stream()
                .filter(ci -> ci.getProductID() == productID)
                .findAny()
                .orElse(null);

        if (item == null) { 
            cartItems.add(new CartItem(productID, productPrice, qty));
            updateCartData();
        } else {
            updateCartItem(productID, "incr", qty);
        }
    }

    public void updateCartItem(int productID, String action, int qty) {
        
        CartItem item = cartItems.stream()
                .filter(ci -> ci.getProductID() == productID)
                .findAny()
                .orElse(null);
        
        if (action.equals("incr")) {
            item.setQty(item.getQty() + qty);
        } else if (action.equals("decr")) {
            item.setQty(item.getQty() - qty);
        }
        
        updateCartData();
    }

    public void removeCartItem(int productID) {
        cartItems.removeIf(item -> item.getProductID() == productID);
        updateCartData();
    }

    public void clear() {
        cartItems = new ArrayList<>();
        totalItems = 0;
        totalPrice = 0.0;
    }
    
}
