<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="style">

        .form{
            max-width:400px;
        }

        input{
            margin-bottom:4px;
        }

        .form-control{
            border-radius:0px;
        }

        .form-control:focus{
            box-shadow: none !important;
        }

        .btn-primary{
            border-radius:0px;
            width:20%;
            display:block;
            margin-left:auto;
            margin-right:auto;
        }

        .opretBruger{
            text-decoration-line:none;
        }
    </jsp:attribute>



    <jsp:body>
        <div class="form mx-auto">
            <h1>Log ind</h1>
            <form action="login" method="post">
                <label for="username">Email: </label>
                <input type="text" class="form-control" required placeholder="Eksempel@gmail.com" autocomplete="off" id="username" name="username"/>
                <label for="password">Kode: </label>
                <input type="password" class="form-control" required placeholder="Kode" id="password" name="password"/>
                <input type="submit" class="btn btn-primary " value="Log ind"/>
                <a href="opret.jsp" class="opretBruger">Opret bruger</a>
            </form>
        </div>
    </jsp:body>
</t:pagetemplate>