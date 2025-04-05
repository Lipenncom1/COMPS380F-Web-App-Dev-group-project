<%--
Created By: Maria D
Date: 4/4/2025
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><title>Course Page</title></head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<h2>Edit User</h2>
<form:form action="${pageContext.request.contextPath}/user/edit/${editForm.username}" method="POST" modelAttribute="editForm">
    <form:label path="username">Username: ${editForm.username}</form:label><br/>

    <form:label path="password">new password</form:label><br/>
    <form:input type="text" path="password"/><br/><br/>
    <form:label path="fullName">New full name</form:label><br/>
    <form:input type="text" path="fullName"/><br/><br/>
    <form:label path="email">New email</form:label><br/>
    <form:input type="email" path="email"/><br/><br/>
    <form:label path="phone">New phone</form:label><br/>
    <form:input type="phone" path="phone"/><br/><br/>
<%--    <form:label path="roles">Roles</form:label><br/>--%>
<%--    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER--%>
<%--    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN--%>
    <br/><br/>
    <input type="submit" value="Edit User"/>
</form:form>
</body>
</html>