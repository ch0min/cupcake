package dat.startcode.model.persistence;

import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminMapper {
    ConnectionPool connectionPool;

    public AdminMapper(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }


    public HashMap<String, String> getAllOrders() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        String sql = "SELECT top_name, bottom_name from ((order_line inner join top on order_line.top_id=top.top_id) inner join bottom on order_line.bottom_id=bottom.bottom_id);";

        String top_name = "";
        String bottom_name = "";

        HashMap<String, String> cupcake = new HashMap<>();

        try (Connection connection = connectionPool.getConnection()) {
            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery(sql);

            while (rs.next()){
                top_name = rs.getString("top_name");
                bottom_name = rs.getString("bottom_name");
                cupcake.put(top_name, bottom_name);
            }

        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error");
        }
        return cupcake;
    }
}
