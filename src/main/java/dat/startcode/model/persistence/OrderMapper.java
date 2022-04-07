package dat.startcode.model.persistence;


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
    public boolean removeOrderline(int orderline_id) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        boolean result = false;
        String sql = "delete from orderline where orderline_id = ?";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, orderline_id);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1) {
                    result = true;
                } else {
                    throw new DatabaseException("Order med orderline_id " + orderline_id + " kunne ikke fjernes");
                }
            }
        }
        catch (SQLException ex) {
            throw new DatabaseException("Order med orderline_id " + orderline_id + " kunne ikke fjernes");
        }
        return result;
    }
}

