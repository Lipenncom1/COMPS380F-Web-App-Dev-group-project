
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Page</title>
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
            padding: 20px;
            color: var(--dark-purple);
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border: 1px solid var(--light-purple);
        }

        h2 {
            color: var(--primary-purple);
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 28px;
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
            margin-bottom: 30px;
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
            margin-bottom: 5px;
            color: var(--dark-purple);
            font-weight: 500;
        }

        form input[type="text"] {
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid var(--lighter-purple);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        form input[type="text"]:focus {
            border-color: var(--secondary-purple);
            outline: none;
        }

        .checkbox-group {
            margin: 15px 0;
        }

        .checkbox-option {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }

        .checkbox-option input[type="checkbox"] {
            margin-right: 10px;
            accent-color: var(--primary-purple);
        }

        .submit-btn {
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
            width: 150px;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: var(--secondary-purple);
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

    <h2>Create a User</h2>
    <form:form method="POST" modelAttribute="IndexUser">
        <form:label path="username">Username</form:label>
        <form:input type="text" path="username" placeholder="Enter username"/>

        <form:label path="password">Password</form:label>
        <form:input type="text" path="password" placeholder="Enter password"/>

        <form:label path="roles">Roles</form:label>
        <div class="checkbox-group">
            <div class="checkbox-option">
                <form:checkbox path="roles" value="ROLE_USER" id="roleUser"/>
                <label for="roleUser">ROLE_USER</label>
            </div>
            <div class="checkbox-option">
                <form:checkbox path="roles" value="ROLE_ADMIN" id="roleAdmin"/>
                <label for="roleAdmin">ROLE_ADMIN</label>
            </div>
        </div>

        <input type="submit" value="Add User" class="submit-btn"/>
    </form:form>
</div>
</body>
</html>