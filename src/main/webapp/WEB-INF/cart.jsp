<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
             Kurv
    </jsp:attribute>

    <jsp:attribute name="footer">
            Kurv
    </jsp:attribute>

    <jsp:body>

        <form method="post">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>OrderLine ID</th>
                    <th>Bund</th>
                    <th>Topping</th>
                    <th>Antal</th>
                    <th>Pris</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="orderLine" items="${sessionScope.orderLineList}">
                    <tr>
                        <td>${sessionScope.orderLineList.indexOf(orderLine)+1}</td>
                        <td>${orderLine.bottom}</td>
                        <td>${orderLine.topping}</td>
                        <td>${orderLine.quantity}</td>
                        <td>${orderLine.totalPrice*orderLine.quantity}</td>
                        <td>
                            <button name="fjern" value="${sessionScope.orderLineList.indexOf(orderLine)}" formaction="removefromcart">fjern</button>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>

                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>${sessionScope.price}</td>
                    <td>
                        <button name="buy" value="buy" formaction="BuyServlet"> buy</button>
                    </td>

                </tr>
                </tbody>
            </table>
        </form>
    </jsp:body>
</t:pagetemplate>

