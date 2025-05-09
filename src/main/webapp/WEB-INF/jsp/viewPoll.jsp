<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Poll</title>
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
            border-bottom: 2px solid var(--lighter-purple);
            padding-bottom: 10px;
        }

        .poll-question {
            font-size: 1.4em;
            font-weight: 600;
            margin-bottom: 25px;
            color: var(--dark-purple);
            padding: 15px;
            background-color: var(--lighter-purple);
            border-radius: 8px;
            border-left: 4px solid var(--primary-purple);
        }

        .poll-option {
            margin-bottom: 15px;
            padding: 15px;
            border: 2px solid var(--lighter-purple);
            border-radius: 8px;
            background-color: var(--white);
            transition: all 0.3s;
            display: flex;
            align-items: center;
        }

        .poll-option:hover {
            border-color: var(--secondary-purple);
            transform: translateX(5px);
        }

        .poll-option input[type="radio"] {
            accent-color: var(--primary-purple);
            margin-right: 15px;
            transform: scale(1.2);
        }

        .poll-option label {
            flex-grow: 1;
            cursor: pointer;
            font-weight: 500;
        }

        .poll-count {
            color: var(--secondary-purple);
            font-weight: 600;
            margin-left: 10px;
        }

        .error-message {
            color: var(--error-red);
            font-weight: 600;
            margin: 15px 0;
            padding: 10px;
            background-color: #fadbd8;
            border-radius: 5px;
            display: none;
        }

        .vote-btn {
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

        .vote-btn:hover {
            background-color: var(--secondary-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .admin-actions {
            margin: 20px 0;
        }

        .admin-actions a {
            color: var(--secondary-purple);
            text-decoration: none;
            margin-right: 15px;
            font-weight: 600;
            padding: 8px 12px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .admin-actions a:hover {
            color: var(--white);
            background-color: var(--secondary-purple);
        }

        .comments-section {
            margin-top: 40px;
        }

        .comments-list {
            list-style-type: none;
            padding: 0;
            margin: 20px 0;
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

        .delete-comment-btn {
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

        .delete-comment-btn:hover {
            background-color: #c0392b;
        }

        .no-comments {
            color: var(--secondary-purple);
            font-style: italic;
        }

        .comment-form textarea {
            width: 100%;
            padding: 15px;
            border: 2px solid var(--lighter-purple);
            border-radius: 5px;
            font-size: 16px;
            min-height: 100px;
            margin: 15px 0;
            resize: vertical;
        }

        .comment-form input[type="submit"] {
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

        .comment-form input[type="submit"]:hover {
            background-color: var(--secondary-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .return-link {
            display: inline-block;
            margin-top: 30px;
            color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .return-link:hover {
            color: var(--white);
            background-color: var(--primary-purple);
            text-decoration: none;
        }
    </style>
    <script>
        function validateForm() {
            var options = document.getElementsByName('option');
            var selected = false;

            for (var i = 0; i < options.length; i++) {
                if (options[i].checked) {
                    selected = true;
                    break;
                }
            }

            if (!selected) {
                document.getElementById('error-message').style.display = 'block';
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Poll</h2>

    <div class="poll-question">
        <c:out value="${poll.question}"/>
    </div>

    <form action="<c:url value="/index/vote/${poll.id}"/>" method="post" onsubmit="return validateForm()">
        <div class="poll-option">
            <input type="radio" name="option" value="A" id="optionA" ${userVote == 'A' ? 'checked' : ''}/>
            <label for="optionA"><c:out value="${poll.optionA}"/></label>
            <span class="poll-count">(<c:out value="${poll.countA}"/> votes)</span>
        </div>

        <div class="poll-option">
            <input type="radio" name="option" value="B" id="optionB" ${userVote == 'B' ? 'checked' : ''}/>
            <label for="optionB"><c:out value="${poll.optionB}"/></label>
            <span class="poll-count">(<c:out value="${poll.countB}"/> votes)</span>
        </div>

        <div class="poll-option">
            <input type="radio" name="option" value="C" id="optionC" ${userVote == 'C' ? 'checked' : ''}/>
            <label for="optionC"><c:out value="${poll.optionC}"/></label>
            <span class="poll-count">(<c:out value="${poll.countC}"/> votes)</span>
        </div>

        <div class="poll-option">
            <input type="radio" name="option" value="D" id="optionD" ${userVote == 'D' ? 'checked' : ''}/>
            <label for="optionD"><c:out value="${poll.optionD}"/></label>
            <span class="poll-count">(<c:out value="${poll.countD}"/> votes)</span>
        </div>

        <div id="error-message" class="error-message">Please select an option to vote</div>

        <c:if test="${not empty errorMessage}">
            <div class="error-message" style="display: block;">
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>

        <security:authorize access="hasAnyRole('USER', 'ADMIN')">
            <input type="submit" value="${userVote != null ? 'Change Vote' : 'Submit Vote'}" class="vote-btn"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </security:authorize>
    </form>

    <security:authorize access="hasRole('ADMIN')">
        <div class="admin-actions">
            <a href="<c:url value="/index/editPoll/${poll.id}"/>">Edit Poll</a>
            <a href="<c:url value="/index/deletePoll/${poll.id}"/>">Delete Poll</a>
        </div>
    </security:authorize>

    <div class="comments-section">
        <h2>Comments</h2>
        <c:choose>
            <c:when test="${not empty pcomments}">
                <ul class="comments-list">
                    <c:forEach items="${pcomments}" var="comment">
                        <li class="comment-item">
                            <div class="comment-user">
                                <c:out value="${comment.username}"/>:
                            </div>
                            <div>
                                <c:out value="${comment.commentText}"/>
                                <security:authorize access="hasAnyRole('ADMIN')">
                                    <form method="post" action="<c:url value='/index/viewPoll/${pollId}/deleteComment/${comment.id}'/>" style="display: inline;">
                                        <input type="submit" value="Delete" class="delete-comment-btn"/>
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

        <security:authorize access="hasAnyRole('USER','ADMIN')">
            <form action="<c:url value="/index/viewPoll/${poll.id}/addComment"/>" method="post" class="comment-form">
                <textarea name="commentText" placeholder="Add your comment here..."></textarea>
                <input type="submit" value="Add Comment"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>
    </div>

    <a href="<c:url value="/index"/>" class="return-link">Return to Index</a>
</div>
</body>
</html>