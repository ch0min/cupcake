package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.AdminMapper;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminPanel", value = "/AdminPanel")
public class AdminPanel extends HttpServlet {
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminMapper adminMapper = new AdminMapper(connectionPool);
        try {
            request.setAttribute("data", adminMapper.getAllOrders());
        } catch (DatabaseException e) {
            e.printStackTrace();
        }

        User user = (User) request.getSession().getAttribute("user");
        if(user.getRole().equals("admin")){
            request.getRequestDispatcher("WEB-INF/adminpanel.jsp").forward(request, response);
        }else{
            response.sendRedirect("/index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
