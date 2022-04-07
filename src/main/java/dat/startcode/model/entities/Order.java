package dat.startcode.model.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Order {
    private int order_id;
    private List<OrderLine> orderLineList = new ArrayList<>();
    private int totalPrice;
    private User user;

    public Order(List<OrderLine> orderLineList, int totalPrice) {
        this.orderLineList = orderLineList;
        this.totalPrice = totalPrice;
    }

    public Order(User user){
        this.user = user;
        orderLineList = new ArrayList<>();
    }

    public Order(int order_id, List<OrderLine> orderLineList, int totalPrice) {
        this.order_id = order_id;
        this.orderLineList = orderLineList;
        this.totalPrice = totalPrice;
    }

    public Order(int order_id, List<OrderLine> orderLineList, int totalPrice, User user) {
        this.order_id = order_id;
        this.orderLineList = orderLineList;
        this.totalPrice = totalPrice;
        this.user = user;
    }

    public int getOrder_id() {
        return order_id;
    }

    public List<OrderLine> getCupcakeList() {
        return orderLineList;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setCupcakeList(List<OrderLine> orderLineList) {
        this.orderLineList = orderLineList;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", cupcakeList=" + orderLineList +
                ", totalPrice=" + totalPrice +
                ", user=" + user +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order)) return false;
        Order order = (Order) o;
        return getOrder_id() == order.getOrder_id() && getTotalPrice() == order.getTotalPrice() && Objects.equals(getCupcakeList(), order.getCupcakeList()) && Objects.equals(getUser(), order.getUser());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getOrder_id(), getCupcakeList(), getTotalPrice(), getUser());
    }
}
