package dat.startcode.model.persistence;

import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserMapper implements IUserMapper {
    ConnectionPool connectionPool;

    public UserMapper(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }

    @Override
    public User login(String username, String password) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        User user = null;

        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    user = new User(username, password, role);
                } else {
                    throw new DatabaseException("Wrong username or password");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return user;
    }

    @Override
    public User createUser(String username, String password, String role) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        User user;
        Random random = new Random();
        int randomNumber = random.nextInt(1000);
        String sql = "insert into user (username, password, role, balance) values (?,?,?,?)";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, role);
                ps.setInt(4, randomNumber);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1) {
                    user = new User(username, password, role);
                } else {
                    throw new DatabaseException("The user with username = " + username + " could not be inserted into the database");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Could not insert username into database");
        }
        return user;
    }

    @Override
    public List<User> retrieveAllUsers() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        List<User> userList = new ArrayList<>();

        String sql = "SELECT username, password, role, balance FROM cupcake.user";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    int balance = rs.getInt("balance");
                    User newUser = new User(username, password, role, balance);
                    userList.add(newUser);
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error while loading 'cupcake' from Database.");
        }
        return userList;
    }
}
