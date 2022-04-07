package dat.startcode.model.persistence;


import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderMapper implements IOrderMapper {

    private ConnectionPool connectionPool;

    public OrderMapper(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }

    @Override
    public List<OrderLine> retrieveAllOrderLines() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        List<OrderLine> orderLineList = new ArrayList<>();

        String sql = "SELECT orderline_id, bottom_name, top_name, quantity, order_id, totalprice FROM orderline;";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderline_id = rs.getInt("orderline_id");
                    String bottom_name = rs.getString("bottom_name");
                    String top_name = rs.getString("top_name");
                    int quantity = rs.getInt("quantity");
                    int order_id = rs.getInt("order_id");
                    int totalprice = rs.getInt("totalprice");
                    OrderLine newOrderLine = new OrderLine(orderline_id, bottom_name, top_name, quantity, order_id, totalprice);
                    orderLineList.add(newOrderLine);
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error while loading 'cupcake' from Database.");
        }
        return orderLineList;
    }

    @Override
    public List<Order> retrieveAllUsersAndOrders() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        List<Order> orderList = new ArrayList<>();

        String sql = "SELECT order_id, username, totalprice, u.role " +
                "FROM cupcake.order " +
                "INNER JOIN cupcake.user u " +
                "USING(username)";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    String username = rs.getString("username");
                    int totalprice = rs.getInt("totalprice");
                    String role = rs.getString("role");
                    Order order = new Order(order_id, username, totalprice, role);
                    orderList.add(order);
                }
            }
        }
        catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Fejl under indlæsning af order og user fra databasen");
        }
        return orderList;
    }


}

