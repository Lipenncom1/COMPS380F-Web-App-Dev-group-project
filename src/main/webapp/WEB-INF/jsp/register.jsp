<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        :root {
            --primary-purple: #6a0dad;
            --secondary-purple: #9b59b6;
            --light-purple: #bb8fce;
            --lighter-purple: #e8daef;
            --white: #ffffff;
            --dark-purple: #4a235a;
            --error-red: #e74c3c;
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

        .container {
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            border: 1px solid var(--light-purple);
        }

        h1 {
            color: var(--primary-purple);
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 28px;
            text-align: center;
            border-bottom: 2px solid var(--lighter-purple);
            padding-bottom: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: var(--dark-purple);
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 12px;
            border: 2px solid var(--lighter-purple);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            box-sizing: border-box;
        }

        input:focus {
            border-color: var(--secondary-purple);
            outline: none;
        }

        .error {
            color: var(--error-red);
            font-size: 0.9em;
            margin-top: 5px;
            display: block;
        }

        .submit-btn {
            width: 100%;
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: var(--secondary-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            display: block;
        }

        .login-link a {
            color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: var(--secondary-purple);
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Register</h1>
    <form>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <form:form action="${pageContext.request.contextPath}/user/register" method="POST" modelAttribute="registrationForm">
        <div class="form-group">
            <label for="username">Username</label>
            <form:input path="username" id="username" required="required" placeholder="Enter your username"/>
            <form:errors path="username" cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <form:input type="password" path="password" id="password" required="required" placeholder="Enter your password"/>
            <form:errors path="password" cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="fullName">Full Name</label>
            <form:input path="fullName" id="fullName" required="required" placeholder="Enter your full name"/>
            <form:errors path="fullName" cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input type="email" path="email" id="email" required="required" placeholder="Enter your email"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input path="phone" id="phone" required="required" placeholder="Enter your phone number"/>
            <form:errors path="phone" cssClass="error"/>
        </div>

        <form:hidden path="roles" value="ROLE_USER"/> <!--Default role-->

        <button type="submit" class="submit-btn">Create Account</button>
    </form:form>

    <div class="login-link">
        Already have an account? <a href="<c:url value="/login"/>">Login here</a>
    </div>
</div>
</body>
</html>