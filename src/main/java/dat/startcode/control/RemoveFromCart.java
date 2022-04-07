package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.OrderMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "removefromcart", urlPatterns = {"/removefromcart"})
public class RemoveFromCart extends HttpServlet {

    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("fjern");
        int orderline_id = Integer.parseInt(idString);
        OrderMapper orderMapper = new OrderMapper(connectionPool);
        try {
            orderMapper.removeOrderline(orderline_id);
        } catch (DatabaseException e) {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage());
            request.setAttribute("errormessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        request.getRequestDispatcher("cart").forward(request, response);
    }
}
