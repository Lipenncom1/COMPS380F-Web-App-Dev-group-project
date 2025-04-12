<!DOCTYPE html>
<html>
<head>
    <title>Your Own Comments</title>
</head>
<body>
<h1>Your Own Comments</h1>

<h2>Lecture Comments</h2>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
    <ul>
        <c:forEach var="comment" items="${userLectureComments}">
            <li>
                <strong>Lecture:</strong> ${lectureTitles[comment.lecture.id]}<br/>
                <strong>${comment.username}</strong>: ${comment.commentText}<br/>
                <em>Created At:</em> ${comment.createdAt}
            </li>
        </c:forEach>
    </ul>
</security:authorize>

<h2>Poll Comments</h2>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
    <ul>
        <c:forEach var="comment" items="${userPollComments}">
            <li>
                <strong>Poll Question:</strong> ${pollQuestions[comment.pollId]}<br/>
                <strong>${comment.username}</strong>: ${comment.commentText}<br/>
                <em>Created At:</em> ${comment.createdAt}
            </li>
        </c:forEach>
    </ul>
</security:authorize>

<a href="<c:url value="/index" />">Return to list lecture</a>
</body>
</html>