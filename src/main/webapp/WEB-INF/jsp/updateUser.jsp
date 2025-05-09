<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
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

        .container {
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 500px;
            border: 1px solid var(--light-purple);
        }

        h2 {
            color: var(--primary-purple);
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 28px;
            border-bottom: 2px solid var(--lighter-purple);
            padding-bottom: 10px;
        }

        .logout-btn {
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s;
            margin-bottom: 20px;
        }

        .logout-btn:hover {
            background-color: var(--secondary-purple);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            text-align: left;
            margin-bottom: 8px;
            color: var(--dark-purple);
            font-weight: 600;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="tel"],
        form input[type="password"] {
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid var(--lighter-purple);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            width: 100%;
            box-sizing: border-box;
        }

        form input:focus {
            border-color: var(--secondary-purple);
            outline: none;
        }

        .username-display {
            font-weight: bold;
            color: var(--primary-purple);
            margin-bottom: 20px;
            padding: 10px;
            background-color: var(--lighter-purple);
            border-radius: 5px;
        }

        .password-note {
            font-size: 0.9em;
            color: var(--secondary-purple);
            margin-top: -10px;
            margin-bottom: 15px;
        }

        .submit-btn {
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            margin-top: 15px;
        }

        .submit-btn:hover {
            background-color: var(--secondary-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <c:url var="logoutUrl" value="/logout"/>
    <form action="${logoutUrl}" method="post">
        <input type="submit" value="Log out" class="logout-btn"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

    <h2>Update Profile</h2>

    <form:form action="${pageContext.request.contextPath}/index/update/${updateForm.username}" method="POST" modelAttribute="updateForm">
        <div class="username-display">
            Username: ${updateForm.username}
        </div>

        <form:label path="password">New password</form:label>
        <form:input type="password" path="password" placeholder="Enter new password (leave blank to keep current)"/>
        <p class="password-note">Leave blank if you don't want to update your password</p>

        <form:label path="fullName">Full name</form:label>
        <form:input type="text" path="fullName" placeholder="Enter your full name"/>

        <form:label path="email">Email</form:label>
        <form:input type="email" path="email" placeholder="Enter your email address"/>

        <form:label path="phone">Phone</form:label>
        <form:input type="tel" path="phone" placeholder="Enter your phone number"/>

        <input type="submit" value="Update Profile" class="submit-btn"/>
    </form:form>
</div>
</body>
</html>