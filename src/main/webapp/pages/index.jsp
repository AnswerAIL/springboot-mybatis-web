<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value ="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Index Page</title>

        <script src="${contextPath}/js/common/jquery-2.0.0.min.js"></script>
        <script src="${contextPath}/js/index.js"></script>
    </head>
    <body>

        <h1>首页: ${contextPath}</h1>
        <h2>${user.userName}</h2>
        <h3>age: ${age}</h3>

    </body>

</html>

