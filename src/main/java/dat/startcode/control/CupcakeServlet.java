package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.CupcakeMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Objects;

@WebServlet(name = "CupcakeServlet", value = "/CupcakeServlet")
public class CupcakeServlet extends HttpServlet {
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CupcakeMapper cm = new CupcakeMapper(connectionPool);

        HashMap<String, Integer> top = null;
        HashMap<String, Integer> bottom = null;

        try {
            top = cm.getTop();
            bottom = cm.getBottom();
        } catch (DatabaseException e) {
            e.printStackTrace();
        }

        log(Objects.requireNonNull(top).toString());
        log(Objects.requireNonNull(bottom).toString());

        request.setAttribute("top", top);
        request.setAttribute("bottom", bottom);
        request.getRequestDispatcher("WEB-INF/cupcakes.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
