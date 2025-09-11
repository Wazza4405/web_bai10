package murach.cart;

import java.io.Serializable;

public class Item implements Serializable {
    private String description;
    private double price;
    private int quantity;

    public Item() {
    }

    public Item(String description, double price, int quantity) {
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // tính thành tiền (price * quantity)
    public double getTotal() {
        return price * quantity;
    }
}
