package dat.startcode.model.entities;

import java.util.Objects;

public class OrderLine {
    private int orderline_id;
    private String topping;
    private String bottom;
    private int order_id;
    private int totalPrice;
    private int quantity;

    public OrderLine(String topping, String bottom, int totalPrice, int quantity) {
        this.topping = topping;
        this.bottom = bottom;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

    public OrderLine(int orderline_id, String bottom, String topping, int quantity, int order_id, int totalPrice) {
        this.orderline_id = orderline_id;
        this.bottom = bottom;
        this.topping = topping;
        this.quantity = quantity;
        this.order_id = order_id;
        this.totalPrice = totalPrice;

    }

    public int getOrderline_id() {
        return orderline_id;
    }

    public void setOrderline_id(int orderline_id) {
        this.orderline_id = orderline_id;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String getBottom() {
        return bottom;
    }

    public void setBottom(String bottom) {
        this.bottom = bottom;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderLine{" +
                "orderline_id=" + orderline_id +
                ", topping='" + topping + '\'' +
                ", bottom='" + bottom + '\'' +
                ", order_id=" + order_id +
                ", totalPrice=" + totalPrice +
                ", quantity=" + quantity +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof OrderLine)) return false;
        OrderLine orderLine = (OrderLine) o;
        return getOrderline_id() == orderLine.getOrderline_id() && getOrder_id() == orderLine.getOrder_id() && getTotalPrice() == orderLine.getTotalPrice() && getQuantity() == orderLine.getQuantity() && Objects.equals(getTopping(), orderLine.getTopping()) && Objects.equals(getBottom(), orderLine.getBottom());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getOrderline_id(), getTopping(), getBottom(), getOrder_id(), getTotalPrice(), getQuantity());
    }

    public int getRealPrice() {
        return totalPrice * quantity;
    }

}

