package dat.startcode.model.persistence;

import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.exceptions.DatabaseException;

import java.util.List;

public interface IOrderMapper {
    public List<OrderLine> retrieveAllOrderLines() throws DatabaseException;
    public boolean removeOrderline(int orderline_id) throws DatabaseException;

    }