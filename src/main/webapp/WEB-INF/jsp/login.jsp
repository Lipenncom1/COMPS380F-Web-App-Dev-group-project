<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Page Login</title>
    <style>
        :root {
            --primary-purple: #6a0dad;
            --secondary-purple: #9b59b6;
            --light-purple: #bb8fce;
            --lighter-purple: #e8daef;
            --white: #ffffff;
            --dark-purple: #4a235a;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, var(--lighter-purple), var(--white));
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--dark-purple);
        }

        .login-container {
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 350px;
            text-align: center;
            border: 1px solid var(--light-purple);
        }

        h2 {
            color: var(--primary-purple);
            margin-bottom: 25px;
            font-size: 28px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            text-align: left;
            margin-bottom: 5px;
            color: var(--dark-purple);
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid var(--lighter-purple);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: var(--secondary-purple);
            outline: none;
        }

        input[type="checkbox"] {
            margin-right: 10px;
            accent-color: var(--primary-purple);
        }

        input[type="submit"] {
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: var(--secondary-purple);
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .register-link {
            display: inline-block;
            margin-top: 20px;
            color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .register-link:hover {
            color: var(--secondary-purple);
            text-decoration: underline;
        }

        p {
            margin: 10px 0;
            color: var(--dark-purple);
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .error {
            background-color: #fadbd8;
            color: #e74c3c;
        }

        .success {
            background-color: #d5f5e3;
            color: #27ae60;
        }
    </style>
</head>
<body>
<div class="login-container">
    <c:if test="${param.error != null}">
        <div class="message error">
            <p>Login failed. Please check your credentials.</p>
        </div>
    </c:if>
    <c:if test="${param.logout != null}">
        <div class="message success">
            <p>You have been logged out successfully.</p>
        </div>
    </c:if>
    <h2>Course Page Login</h2>
    <form action="login" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" placeholder="Enter your username"/>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password"/>

        <div class="remember-me">
            <input type="checkbox" id="remember-me" name="remember-me"/>
            <label for="remember-me">Remember me</label>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Log In"/>
    </form>

    <p>Don't have an account?</p>
    <a href="${pageContext.request.contextPath}/user/register" class="register-link">Register Here</a>
</div>
</body>
</html>