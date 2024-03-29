<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<div class="cartdesignbg">
    <t:pagetemplate>
    <jsp:attribute name="header">
    </jsp:attribute>

        <jsp:attribute name="footer">
    </jsp:attribute>

        <jsp:body>
            <h1>Kurv</h1>

            <div class="cartdesign">
            <form method="post">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>OrderLine ID</th>
                        <th>Bund</th>
                        <th>Topping</th>
                        <th>Antal</th>
                        <th>Pris(kr)</th>
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
                                <button name="fjern" id="fjern" value="${sessionScope.orderLineList.indexOf(orderLine)}"
                                        formaction="removefromcart">Fjern
                                </button>
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
                            <button name="buy" id="buy" value="buy" formaction="BuyServlet">Køb nu</button>
                        </td>

                    </tr>
                    </tbody>
                </table>
            </form>
            </div>
        </jsp:body>
    </t:pagetemplate>
</div>