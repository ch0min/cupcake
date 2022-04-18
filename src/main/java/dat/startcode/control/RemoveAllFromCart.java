package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.OrderLine;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.OrderMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "removeallfromcart", urlPatterns = {"/removeallfromcart"})
public class RemoveAllFromCart extends HttpServlet {

    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<OrderLine> ol = (List<OrderLine>) request.getSession().getAttribute("orderLineList");

        int totalSize = (int) request.getSession().getAttribute("size");
        totalSize = totalSize - totalSize;

        int price = (int) request.getSession().getAttribute("price");
        price = price - price;

        ol.clear();
        request.getSession().setAttribute("size", totalSize);
        request.getSession().setAttribute("price", price);
        request.getSession().setAttribute("orderLineList", ol);


        request.getRequestDispatcher("CupcakeServlet").forward(request, response);

    }
}
