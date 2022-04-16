<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<div class="cartdesign">
    <t:pagetemplate>
    <jsp:attribute name="header">
    </jsp:attribute>

        <jsp:attribute name="footer">
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

<%--                                                            <td>--%>
<%--                                                                <input type="number" id="amount" name="amount" value="${orderLine.quantity}" formaction="addToShoppingCart"><br><br>--%>
<%--                                                                <input type="submit" id="confirmQ" formaction="cart" value="Bekræft">--%>
<%--                                                            </td>--%>

<%--                                                        <div class="quantityIncDecr">--%>
<%--                                                        <td>--%>
<%--                                                            <button onclick="${orderLine.incrementQ()}" id="btIncr">+</button>--%>
<%--                                                                ${orderLine.quantity}--%>
<%--                                                            <button onclick="${orderLine.decrementQ()}" id="btDecr">-</button>--%>
<%--                                                        </td>--%>
<%--                                                        </div>--%>

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

        </jsp:body>
    </t:pagetemplate>
</div>
