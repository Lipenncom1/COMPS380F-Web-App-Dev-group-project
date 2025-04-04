<%--
Created By: Maria D
Description: Registration page for users, uses Spring Boot JSP form declarations
Date and Time: 31/03/2025 4:48 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
    <style>
        .error { color: red; }
    </style>
</head>
<body>
<h1>Register</h1>
<form>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<form:form action="${pageContext.request.contextPath}/user/register" method="POST" modelAttribute="registrationForm">
    <label for="username">Username</label>
    <form:input path="username" id="username" required="required"/>

    <label for="password">Password</label>
    <form:input type="password" path="password" id="password" required="required"/>

    <label for="fullName">Full Name</label>
    <form:input path="fullName" id="fullName" required="required"/>

    <label for="email">Email</label>
    <form:input type="email" path="email" id="email" required="required"/>

    <label for="phone">Phone</label>
    <form:input path="phone" id="phone" required="required"/>

    <form:hidden path="roles" value="ROLE_USER"/> <!--Default role-->

    <button type="submit">Register</button>
</form:form>
</body>
</html>