package dat.startcode.model.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Order {
    private int order_id;
    private List<OrderLine> orderLineList;
    private String username;
    private int totalprice;


    public Order(List<OrderLine> orderLineList, int totalPrice, String username) {
        this.orderLineList = orderLineList;
        this.totalprice = totalPrice;
        this.username=username;
    }

    // dto
//    private String role;
//
//    public Order(int order_id, String username, int totalprice) {
//        this.order_id = order_id;
//        this.username = username;
//        this.totalprice = totalprice;
//    }

    // dto
//    public Order(int order_id, String username, int totalprice, String role) {
//        this.order_id = order_id;
//        this.username = username;
//        this.totalprice = totalprice;
//        this.role = role;
//    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public List<OrderLine> getOrderLineList() {
        return orderLineList;
    }

//    public String getRole() {
//        return role;
//    }

    public void setOrderLineList(List<OrderLine> orderLineList) {
        this.orderLineList = orderLineList;
    }

//    public void setRole(String role) {
//        this.role = role;
//    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", username='" + username + '\'' +
                ", totalprice=" + totalprice +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order)) return false;
        Order order = (Order) o;
        return getOrder_id() == order.getOrder_id() && getTotalprice() == order.getTotalprice() && Objects.equals(getUsername(), order.getUsername());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getOrder_id(), getUsername(), getTotalprice());
    }
}



