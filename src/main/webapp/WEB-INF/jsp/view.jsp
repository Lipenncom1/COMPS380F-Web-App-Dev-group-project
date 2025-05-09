<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>View Lecture</title>
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

    h2 {
      color: var(--primary-purple);
      margin-top: 0;
      margin-bottom: 20px;
      font-size: 24px;
      border-bottom: 2px solid var(--lighter-purple);
      padding-bottom: 10px;
    }

    .attachments {
      margin: 20px 0;
      padding: 15px;
      background-color: var(--lighter-purple);
      border-radius: 8px;
    }

    .attachment-item {
      margin-bottom: 10px;
      padding: 10px;
      background-color: var(--white);
      border-radius: 5px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .attachment-link {
      color: var(--primary-purple);
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s;
    }

    .attachment-link:hover {
      color: var(--secondary-purple);
      text-decoration: underline;
    }

    .action-link {
      color: var(--secondary-purple);
      text-decoration: none;
      margin-left: 10px;
      font-size: 0.9em;
    }

    .action-link:hover {
      text-decoration: underline;
    }

    .comments-section {
      margin: 30px 0;
    }

    .comments-list {
      list-style-type: none;
      padding: 0;
    }

    .comment-item {
      background-color: var(--lighter-purple);
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 8px;
      border-left: 4px solid var(--primary-purple);
    }

    .comment-user {
      color: var(--primary-purple);
      font-weight: 600;
      margin-bottom: 5px;
    }

    .delete-btn {
      background-color: #e74c3c;
      color: white;
      border: none;
      padding: 5px 10px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      margin-left: 10px;
      transition: background-color 0.3s;
    }

    .delete-btn:hover {
      background-color: #c0392b;
    }

    .no-comments {
      color: var(--secondary-purple);
      font-style: italic;
    }

    .comment-form {
      margin-top: 30px;
    }

    textarea {
      width: 100%;
      padding: 12px;
      border: 2px solid var(--lighter-purple);
      border-radius: 5px;
      font-size: 16px;
      min-height: 100px;
      margin-bottom: 15px;
      resize: vertical;
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
    }

    .submit-btn:hover {
      background-color: var(--secondary-purple);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .nav-links {
      margin-top: 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .return-link {
      color: var(--primary-purple);
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s;
      padding: 8px 12px;
      border-radius: 5px;
    }

    .return-link:hover {
      color: var(--secondary-purple);
      background-color: var(--lighter-purple);
      text-decoration: underline;
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
    }

    .logout-btn:hover {
      background-color: var(--secondary-purple);
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Lecture: <c:out value="${lecture.lectureTitle}"/></h2>

  <c:if test="${!empty lecture.attachments}">
    <div class="attachments">
      <h3>Attachments:</h3>
      <c:forEach items="${lecture.attachments}" var="attachment" varStatus="status">
        <div class="attachment-item">
          <a href="<c:url value="/index/${lectureId}/attachment/${attachment.id}" />"
             class="attachment-link">
            <c:out value="${attachment.name}"/>
          </a>
          <div>
            <security:authorize access="hasRole('ADMIN')">
              <a href="<c:url value="/index/editLecture/${lectureId}" />" class="action-link">Edit</a>
              <a href="<c:url value="/index/${lectureId}/delete/${attachment.id}" />" class="action-link">Delete</a>
            </security:authorize>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:if>

  <div class="comments-section">
    <h2>Comments</h2>
    <c:choose>
      <c:when test="${!empty lecture.lecturecomments}">
        <ul class="comments-list">
          <c:forEach items="${lecture.lecturecomments}" var="comment">
            <li class="comment-item">
              <div class="comment-user">
                <c:out value="${comment.username}"/>:
              </div>
              <div>
                <c:out value="${comment.commentText}"/>
                <security:authorize access="hasRole('ADMIN')">
                  <form method="post"
                        action="<c:url value='/comments/${lectureId}/delete/${comment.commentId}'/>"
                        style="display: inline;">
                    <input type="submit" value="Delete" class="delete-btn"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  </form>
                </security:authorize>
              </div>
            </li>
          </c:forEach>
        </ul>
      </c:when>
      <c:otherwise>
        <p class="no-comments">No comments yet</p>
      </c:otherwise>
    </c:choose>

    <security:authorize access="hasAnyRole('USER', 'ADMIN')">
      <form action="<c:url value="/comments/${lecture.id}/add"/>" method="post" class="comment-form">
        <textarea name="commentText" placeholder="Add your comment here..." required></textarea>
        <input type="submit" value="Add Comment" class="submit-btn"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
    </security:authorize>
  </div>

  <div class="nav-links">
    <a href="<c:url value="/index" />" class="return-link">Return to list lecture</a>
    <c:url var="logoutUrl" value="/logout"/>
    <form action="${logoutUrl}" method="post">
      <input type="submit" value="Log out" class="logout-btn"/>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
  </div>
</div>
</body>
</html>