<%--&lt;%&ndash;--%>
<%--Created By: Maria D--%>
<%--Description: Update Profile Page - allows users to update their information (Except username)--%>
<%--Date: 4/4/2025--%>
<%--&ndash;%&gt;--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>


<%--<html>--%>
<%--<head>--%>
<%--    <title>Update Profile</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form>--%>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--</form>--%>
<%--<h1>Update Your Profile</h1>--%>
<%--<c:if test="${not empty success}">--%>
<%--    <div>${success}</div>--%>
<%--</c:if>--%>

<%--<form:form action="${pageContext.request.contextPath}/index/update" method="POST" modelAttribute="updateForm">--%>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--    <div>--%>
<%--        <form:label path=""></form:label>--%>
<%--        <label>Username : "${updateForm.username}"</label>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <label for="password">New Password (leave blank to keep current)</label>--%>
<%--        <form:password path="password" id="password" />--%>
<%--        <form:errors path="password"/>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <label for="fullName">Full Name</label>--%>
<%--        <form:input path="fullName" id="fullName"/>--%>
<%--        <form:errors path="fullName"/>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <label for="email">Email</label>--%>
<%--        <form:input type="email" path="email" id="email"/>--%>
<%--        <form:errors path="email"/>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <label for="phone">Phone</label>--%>
<%--        <form:input path="phone" id="phone"/>--%>
<%--        <form:errors path="phone"/>--%>
<%--    </div>--%>

<%--    <button type="submit">Update Profile</button>--%>

<%--</form:form>--%>

<%--<p>--%>
<%--    <a href="${pageContext.request.contextPath}/index">Cancel</a>--%>
<%--</p>--%>
<%--</body>--%>
<%--</html>--%>

<%--
Created By: Maria D
Date: 4/4/2025
--%>
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
    <%--    <form:label path="roles">Roles</form:label><br/>--%>
    <%--    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER--%>
    <%--    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN--%>
    <br/><br/>
    <input type="submit" value="Edit User"/>
</form:form>
</body>
</html>