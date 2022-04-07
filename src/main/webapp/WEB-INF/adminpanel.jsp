<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

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

    </jsp:attribute>



    <jsp:body>
        ${data}
    </jsp:body>
</t:pagetemplate>