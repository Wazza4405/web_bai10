package murach.cart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    // thêm item vào giỏ
    public void addItem(Item item) {
        for (Item i : items) {
            if (i.getDescription().equals(item.getDescription())) {
                i.setQuantity(i.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    // cập nhật số lượng
    public void updateItem(String description, int quantity) {
        for (Item i : items) {
            if (i.getDescription().equals(description)) {
                if (quantity <= 0) {
                    items.remove(i);
                } else {
                    i.setQuantity(quantity);
                }
                return;
            }
        }
    }

    // xóa item
    public void removeItem(String description) {
        items.removeIf(i -> i.getDescription().equals(description));
    }

    // tổng tiền
    public double getTotalAmount() {
        double sum = 0;
        for (Item i : items) {
            sum += i.getTotal();
        }
        return sum;
    }
}
