package dat.startcode.model.entities;

import java.util.Objects;

public class OrderLine {
    private int orderline_id;
    private String topping;
    private String bottom;
    private int totalPrice;
    private int quantity;

    public OrderLine(String topping, String bottom, int totalPrice, int quantity) {
        this.topping = topping;
        this.bottom = bottom;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

    public OrderLine(int orderline_id, String topping, String bottom, int totalPrice, int quantity) {
        this.orderline_id = orderline_id;
        this.topping = topping;
        this.bottom = bottom;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

    public int getOrderline_id() {
        return orderline_id;
    }

    public String getTopping() {
        return topping;
    }

    public String getBottom() {
        return bottom;
    }

    public int gettotalPrice() {
        return totalPrice;
    }

    public int getquantity() {
        return quantity;
    }

    public void setOrderline_id(int orderline_id) {
        this.orderline_id = orderline_id;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public void setBottom(String bottom) {
        this.bottom = bottom;
    }

    public void settotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setquantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cupcake{" +
                "topping='" + topping + '\'' +
                ", bottom='" + bottom + '\'' +
                ", totalPrice=" + totalPrice +
                ", quantity=" + quantity +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof OrderLine)) return false;
        OrderLine orderLine = (OrderLine) o;
        return gettotalPrice() == orderLine.gettotalPrice() && getquantity() == orderLine.getquantity() && Objects.equals(getTopping(), orderLine.getTopping()) && Objects.equals(getBottom(), orderLine.getBottom());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getTopping(), getBottom(), gettotalPrice(), getquantity());
    }
}


