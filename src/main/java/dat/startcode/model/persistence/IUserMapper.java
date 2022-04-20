package dat.startcode.model.persistence;

import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.util.List;

public interface IUserMapper {
    public User login(String email, String kodeord) throws DatabaseException;

    public User createUser(String username, String password, String role) throws DatabaseException;

    public List<User> retrieveAllUsers() throws DatabaseException;

}
