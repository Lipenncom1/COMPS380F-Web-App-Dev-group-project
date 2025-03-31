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
<form:form action="${pageContext.request.contextPath}/register" method="POST" modelAttribute="userRegistration">
    <label for="username">Username</label>
    <form:input path="username" id="username" required="required"/>
    <form:errors path="username" cssClass="error"/><br>

    <label for="password">Password</label>
    <form:input type="password" path="password" id="password" required="required"/>
    <form:errors path="password" cssClass="error"/><br>

    <label for="fullName">Full Name</label>
    <form:input path="fullName" id="fullName"/><br/>

    <label for="email">Email</label>
    <form:input type="email" path="email" id="email" required="required"/>
    <form:errors path="email" cssClass="error"/><br>

    <label for="phone">Phone</label>
    <form:input path="phone" id="phone" required="required"/>
    <form:errors path="phone" cssClass="error"/><br>

    <button type="submit">Register</button>
</form:form>
</body>
</html>