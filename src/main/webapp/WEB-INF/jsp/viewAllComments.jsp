
<!DOCTYPE html>
<html>
<head>
    <title>All Comments</title>
</head>
<body>
<h1>All Comments</h1>

<h2>Lecture Comments</h2>
<ul>
    <c:forEach var="comment" items="${lectureComments}">
        <li>
            <strong>Lecture:</strong> ${lectureTitles[comment.lecture.id]}<br/>
            <strong>${comment.username}</strong>: ${comment.commentText}<br/>
            <em>Created At:</em> ${comment.createdAt}
        </li>
    </c:forEach>
</ul>

<h2>Poll Comments</h2>
<ul>
    <c:forEach var="comment" items="${pollComments}">
        <li>
            <strong>Poll Question:</strong> ${pollQuestions[comment.pollId]}<br/>
            <strong>${comment.username}</strong>: ${comment.commentText}<br/>
            <em>Created At:</em> ${comment.createdAt}
        </li>
    </c:forEach>
</ul>
</body>
</html>
