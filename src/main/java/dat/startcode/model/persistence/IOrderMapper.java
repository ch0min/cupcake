package dat.startcode.model.persistence;

import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.exceptions.DatabaseException;

import java.util.List;

public interface IOrderMapper {
    public List<OrderLine> retrieveAllOrderLines() throws DatabaseException;

    public List<Order> retrieveAllUsersAndOrders() throws DatabaseException;

}