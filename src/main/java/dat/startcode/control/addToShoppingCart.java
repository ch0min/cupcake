package dat.startcode.control;

import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.OrderLine;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addToShoppingCart", value = "/addToShoppingCart")
public class addToShoppingCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OrderLine ol = null;

        String[] bottom = request.getParameter("bottom").split("=");
        String[] topping = request.getParameter("top").split("=");
        int price = Integer.parseInt(bottom[1])+Integer.parseInt(topping[1]);
        int amount = Integer.parseInt(request.getParameter("amount"));

        ol= new OrderLine(topping[0],bottom[0], price,amount);

        log(ol.toString());

//        request.setAttribute("orderline", ol);
//        request.getRequestDispatcher("").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
