package dat.startcode.model.persistence;

import dat.startcode.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

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

}