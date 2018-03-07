<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ToDo List</title>
</head>

<body>
<h1>ToDo List</h1>

<form action="/todo" method="POST">
    <label for="content">Add todo:</label>
    <input type="text" name="content" id="content"/>
    <button type="submit">submit</button>
</form>

<div>
    <ul>
        <c:forEach items="${todoList}" var="item">
            <li>
                <c:out value="${item}" />
                <button type="button" onclick='deleteTodo("${item}")' style="margin-left:10px;padding:5px;">删除</button>
            </li>
        </c:forEach>
    </ul>
</div>

<script type="application/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="application/javascript">
    function deleteTodo(content) {
        $.ajax({
            url: '/todo?content=' + content,
            type: 'DELETE',
            success: function(result) {
                location.reload();
            }
        });
    }
</script>
</body>
</html>
