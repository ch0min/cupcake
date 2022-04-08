package dat.startcode.model.persistence;

import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminMapper {
    ConnectionPool connectionPool;

    public AdminMapper(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }


    public ArrayList<String> getAllOrders() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        String sql = "SELECT top_name, bottom_name, username, quantity, order_line.totalprice from order_line inner join top on order_line.top_id=top.top_id inner join bottom on order_line.bottom_id=bottom.bottom_id inner join cupcake.order on order_line.order_id=cupcake.order.order_id ";

        String top_name = "";
        String bottom_name = "";
        String username = "";
        String quantity = "";
        String totalprice = "";

        ArrayList<String> order = new ArrayList<>();

        try (Connection connection = connectionPool.getConnection()) {
            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery(sql);

            while (rs.next()){
                top_name = rs.getString("top_name");
                bottom_name = rs.getString("bottom_name");
                username = rs.getString("username");
                quantity = rs.getString("quantity");
                totalprice = rs.getString("totalprice");
                String myArray = "Brugernavn: " + username + "<br>Top navn: " + top_name + "<br>Bund: " + bottom_name + "<br>Antal: " + quantity + "<br>Pris: " + totalprice + "kr";
                order.add(myArray);
            }

        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error");
        }
        return order;
    }
}
