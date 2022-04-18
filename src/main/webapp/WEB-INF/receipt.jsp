<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<div class="receiptbg">
    <t:pagetemplate>
    <jsp:attribute name="header">
    </jsp:attribute>

        <jsp:attribute name="footer">
    </jsp:attribute>

        <jsp:body>
            <h1>Kvittering</h1>
            <h4>Tak for dit køb!</h4>

            <div class="receiptdesign">
                <form method="post">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>OrderLine ID</th>
                            <th>Bund</th>
                            <th>Topping</th>
                            <th>Antal</th>
                            <th>Pris(kr)</th>
                            <th>Tidspunkt</th>
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
                                <td></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <jsp:useBean id="date" class="java.util.Date"/>
                                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>TOTAL BELØB: ${sessionScope.price}</td>
                            <td>
                            </td>
                        <tr>
                            <td>
                                <button name="proceedbt" id="proceedbt" value="proceedbt"
                                        formaction="removeallfromcart">
                                    KLIK HER FOR AT GÅ VIDERE
                                </button>
                            </td>
                        <tr>
                            <td>
                                <img src="images/transicons.png"
                                     style="margin-right: auto; min-height: 30px; max-width: 130px">
                            </td>
                        </tr>
                        </tr>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </jsp:body>
    </t:pagetemplate>
</div>