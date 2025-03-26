<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>Register</h1>
<form action="${pageContext.request.contextPath}/register" method="POST">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required><br>

    <label for="fullName">Full Name</label>
    <input type="text" id="fullName" name="fullName">

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required><br>

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone" required><br>

    <button type="submit">Register</button>
</form>
</body>
</html>