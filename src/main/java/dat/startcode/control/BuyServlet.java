package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.CupcakeMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BuyServlet", value = "/BuyServlet")
public class BuyServlet extends HttpServlet {
    ConnectionPool connectionPool;
    CupcakeMapper cm;

    @Override
    public void init(){
        this.connectionPool = ApplicationStart.getConnectionPool();
        cm = new CupcakeMapper(connectionPool);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderLine> orderLineList = (ArrayList<OrderLine>) request.getSession().getAttribute("orderLineList");

        int totalPrice = (int) request.getSession().getAttribute("price");
        User user = (User) request.getSession().getAttribute("user");
        Order order = new Order(orderLineList,totalPrice, user.getUsername());//todo: error handling if user=null.


        log(String.valueOf(order));

        try {
            cm.safeOrderDB(order);
            for (OrderLine o : order.getOrderLineList()) {
                o.setOrder_id(order.getOrder_id());
                cm.insertOrderLine(o);
            }

        } catch (DatabaseException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
