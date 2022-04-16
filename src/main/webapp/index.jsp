<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<div class="frontpage">
    <t:pagetemplate>
        <jsp:attribute name="header">
    </jsp:attribute>
        <jsp:attribute name="footer">
    </jsp:attribute>
        <jsp:body>
            <h1>Velkommen ombord</h1>
            <h4>Øens bedste cupcakes <br> Vælg og bestil her:</h4>

            <div class="booking-form-box">
                <div class="dropdown">
                    <div id="myDropdown" class="dropdown-content">
                        <form action="addToShoppingCart">
                            <label>Vælg bund: </label><br>
                            <select name="bottom">
                                <c:forEach items="${requestScope.bottom}" var="bottoms">
                                    <option value="${bottoms}"> ${bottoms} </option>
                                </c:forEach>
                            </select><br>

                            <label>Vælg topping: </label><br>
                            <select name="top">
                                <c:forEach items="${requestScope.top}" var="tops">
                                    <option value="${tops}"> ${tops} </option>
                                </c:forEach>
                            </select><br>
                            <label> Antal: </label><br>
                            <input type="number" id="amount" name="amount" value="1"><br><br>
                            <input type="submit" formaction="addToShoppingCart" value="Tilføj til kurv">
                        </form>
                    </div>
                </div>
            </div>


        </jsp:body>

    </t:pagetemplate>
</div>
