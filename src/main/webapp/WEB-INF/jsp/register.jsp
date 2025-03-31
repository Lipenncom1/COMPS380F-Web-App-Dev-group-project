<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>Register</h1>

<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/register" method="POST">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required maxlength="20">
    </div>

    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>

    <div class="form-group">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" maxlength="20">
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" maxlength="50">
    </div>

    <div class="form-group">
        <label for="phoneNum">Phone:</label>
        <input type="text" id="phoneNum" name="phoneNum" maxlength="20">
    </div>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button type="submit">Register</button>
</form>
<p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
</body>
</html>