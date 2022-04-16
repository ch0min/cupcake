package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "addToShoppingCart", value = "/addToShoppingCart")
public class AddToShoppingCart extends HttpServlet {
    private List<OrderLine> orderLineList;

    @Override
    public void init() throws ServletException {
        orderLineList = new ArrayList<>();
        ConnectionPool connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] bottom = request.getParameter("bottom").split("=");
        String[] topping = request.getParameter("top").split("=");
        int price = Integer.parseInt(bottom[1])+Integer.parseInt(topping[1]);
        int amount = Integer.parseInt(request.getParameter("amount"));

        OrderLine ol = new OrderLine(topping[0],bottom[0],price,amount);
        log(ol.toString());

        boolean skipAdd = false;

        for (OrderLine curOl : orderLineList) {
            if (curOl.getBottom().equals(bottom[0]) && curOl.getTopping().equals(topping[0])) {
                curOl.setQuantity(curOl.getQuantity() + ol.getQuantity());
                skipAdd = true;
            }
        }

        if(!skipAdd) {
            orderLineList.add(ol);
        }

        int totalSize = 0;
        for (OrderLine o : orderLineList) {
            totalSize = o.getQuantity() + totalSize;
        }

        int totalPrice = 0;
        for (OrderLine o : orderLineList) {
            totalPrice = totalPrice + (o.getTotalPrice() * o.getQuantity());
        }

        request.getSession().setAttribute("orderLineList", orderLineList);
        request.getSession().setAttribute("size", totalSize);
        request.getSession().setAttribute("price", totalPrice);

        request.getRequestDispatcher("CupcakeServlet").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
