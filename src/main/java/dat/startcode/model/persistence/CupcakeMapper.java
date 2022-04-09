package dat.startcode.model.persistence;

import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CupcakeMapper {
    ConnectionPool connectionPool;

    public CupcakeMapper(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }

    public HashMap<String, Integer> getTop() throws DatabaseException {
        HashMap<String, Integer> tops = new HashMap<>();

        String sql = "SELECT * FROM top";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String topName = rs.getString("top_name");
                    int price = rs.getInt("price");
                    tops.put(topName, price);
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException(e, "error connecting to database");
        }

        return tops;
    }

    public HashMap<String, Integer> getBottom() throws DatabaseException {
        HashMap<String, Integer> bottoms = new HashMap<>();

        String sql = "SELECT * FROM bottom";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String bottomName = rs.getString("bottom_name");
                    int price = rs.getInt("price");
                    bottoms.put(bottomName, price);
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException(e, "error connecting to database");
        }

        return bottoms;
    }


    //// todo: maybe move to ordermapper!!!

    public void safeOrderDB(Order order) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        String sql = "insert into cupcake.order (username,totalprice) values (?, ?)";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, order.getUsername());
                ps.setInt(2, order.getTotalprice());
//                int rowsAffected = ps.executeUpdate();
//                if (rowsAffected == 1) {
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                        order.setOrder_id(rs.getInt(1));
//                        } catch (SQLException e){
//                            throw new DatabaseException(e,"kan ikke finde id");
//
//                    for (OrderLine o : order.getOrderLineList()) {
//                        o.setOrder_id(order.getOrder_id());
//                        insertOrderLine(o);
                    }
//                } else {
//                    throw new DatabaseException(" could not be inserted into the database");
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        } catch (SQLException ex) {
//            throw new DatabaseException(ex, "Could not insert into database");
//        }
    }

    public void insertOrderLine(OrderLine orderLine) {
        Logger.getLogger("web").log(Level.INFO, "");
        String sql = "insert into order_line (bottom_name, top_name, quantity, order_id, totalprice) values (?,?,?,?,?)";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, orderLine.getBottom());
                ps.setString(2, orderLine.getTopping());
                ps.setInt(3, orderLine.getQuantity());
                ps.setInt(4, orderLine.getOrder_id());
                ps.setInt(5, orderLine.getTotalPrice());
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1) {
                    System.out.println("yes");
                } else {
                    throw new DatabaseException("The orderline could not be inserted into the database");
                }
            } catch (DatabaseException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    //todo: update user balance after purchaes.

}