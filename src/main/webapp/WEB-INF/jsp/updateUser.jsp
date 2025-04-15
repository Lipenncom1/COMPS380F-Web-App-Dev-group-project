<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<h2>Update User</h2>
<form:form action="${pageContext.request.contextPath}/index/update/${updateForm.username}" method="POST" modelAttribute="updateForm">
    <form:label path="username">Username: ${updateForm.username}</form:label><br/>

    <form:label path="password">New password: (leave blank if you don't want to update it)</form:label><br/>
    <form:input type="text" path="password"/><br/><br/>
    <form:label path="fullName">New full name</form:label><br/>
    <form:input type="text" path="fullName"/><br/><br/>
    <form:label path="email">New email</form:label><br/>
    <form:input type="email" path="email"/><br/><br/>
    <form:label path="phone">New phone</form:label><br/>
    <form:input type="phone" path="phone"/><br/><br/>

    <br/><br/>
    <input type="submit" value="Edit User"/>
</form:form>
</body>
</html>