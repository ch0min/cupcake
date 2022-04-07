package dat.startcode.model.persistence;

import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                        tops.put(topName,price);
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
                    bottoms.put(bottomName,price);
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException(e, "error connecting to database");
        }

        return bottoms;
    }


    //// todo: maybe move to ordermapper!!!

    public boolean safeOrderDB(Order order) throws DatabaseException {
            Logger.getLogger("web").log(Level.INFO, "");
            String sql = "insert into 'order' (totalprice) values (?)";
            try (Connection connection = connectionPool.getConnection()) {
                try (PreparedStatement ps = connection.prepareStatement(sql)) {
                    ps.setInt(1, order.getTotalprice());
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected == 1) {

                        try(ResultSet rs = ps.getGeneratedKeys()) { // doesnt work
                            if (rs.next()) {
                                order.setOrder_id(rs.getInt(1));
                                System.out.println(rs.getInt(1));
                            }
                            return true;
                        } catch (SQLException e){
                            throw new DatabaseException(e,"kan ikke finde id");
                        }
                    } else {
                        throw new DatabaseException(" could not be inserted into the database");
                    }
                }
            } catch (SQLException ex) {
                throw new DatabaseException(ex, "Could not insert into database");
            }
    }




}