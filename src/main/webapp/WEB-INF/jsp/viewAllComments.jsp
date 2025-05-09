<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Comments</title>
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
            max-width: 1000px;
            margin: 0 auto;
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border: 1px solid var(--light-purple);
        }

        h1 {
            color: var(--primary-purple);
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 32px;
            border-bottom: 2px solid var(--lighter-purple);
            padding-bottom: 10px;
        }

        h2 {
            color: var(--secondary-purple);
            margin: 30px 0 20px 0;
            font-size: 24px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            background-color: var(--lighter-purple);
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            border-left: 4px solid var(--primary-purple);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        li:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        strong {
            color: var(--primary-purple);
            display: inline-block;
            margin-bottom: 5px;
        }

        em {
            color: var(--secondary-purple);
            font-size: 0.9em;
            display: block;
            margin-top: 10px;
        }

        .comment-meta {
            margin-bottom: 10px;
        }

        .comment-content {
            margin-left: 15px;
            padding-left: 15px;
            border-left: 2px solid var(--light-purple);
        }

        .return-link {
            display: inline-block;
            margin-top: 30px;
            color: var(--white);
            background-color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            padding: 12px 20px;
            border-radius: 5px;
        }

        .return-link:hover {
            background-color: var(--secondary-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>All Comments</h1>

    <h2>Lecture Comments</h2>
    <security:authorize access="hasRole('ADMIN')">
        <ul>
            <c:forEach var="comment" items="${lectureComments}">
                <li>
                    <div class="comment-meta">
                        <strong>Lecture:</strong> ${lectureTitles[comment.lecture.id]}<br/>
                        <strong>User:</strong> ${comment.username}
                    </div>
                    <div class="comment-content">
                            ${comment.commentText}
                        <em>Posted on: ${comment.createdAt}</em>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </security:authorize>

    <h2>Poll Comments</h2>
    <security:authorize access="hasRole('ADMIN')">
        <ul>
            <c:forEach var="comment" items="${pollComments}">
                <li>
                    <div class="comment-meta">
                        <strong>Poll:</strong> ${pollQuestions[comment.pollId]}<br/>
                        <strong>User:</strong> ${comment.username}
                    </div>
                    <div class="comment-content">
                            ${comment.commentText}
                        <em>Posted on: ${comment.createdAt}</em>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </security:authorize>

    <a href="<c:url value="/index" />" class="return-link">Return to Lectures</a>
</div>
</body>
</html>