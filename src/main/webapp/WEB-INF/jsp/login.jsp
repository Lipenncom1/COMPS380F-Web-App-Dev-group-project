<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Login</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Login</h1>--%>
<%--<c:if test="${param.error != null}">--%>
<%--    <p>Login failed.</p>--%>
<%--</c:if>--%>
<%--<c:if test="${param.logout != null}">--%>
<%--    <p>You have logged out.</p>--%>
<%--</c:if>--%>
<%--<form method="post" action="login">--%>
<%--    <label for="username">Username:</label>--%>
<%--    <input type="text" name="username" id="username" required>--%>
<%--    <br>--%>
<%--    <label for="password">Password:</label>--%>
<%--    <input type="password" name="password" id="password" required>--%>
<%--    <br>--%>
<%--    <input type="checkbox" id="remember-me" name="remember me"/>--%>
<%--    <label for="remember-me">Remember me</label>--%>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--    <button type="submit">Login</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login</h1>
<c:if test="${param.error != null}">
    <p>Login failed.</p>
</c:if>
<c:if test="${param.logout != null}">
    <p>You have logged out.</p>
</c:if>

<c:if test="${param.registered != null}">
    <p style="color: green;">Registration successful! Please login.</p>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/login">
    <label for="username">Username:</label>
    <input type="text" name="username" id="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" required>
    <br>
    <input type="checkbox" id="remember-me" name="remember-me"/>
    <label for="remember-me">Remember me</label>
    <button type="submit">Login</button>
</form>
</body>
</html>