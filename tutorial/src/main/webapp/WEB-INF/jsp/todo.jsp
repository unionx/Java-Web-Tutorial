<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>ToDo List</h1>

<form action="/add-todo" method="POST">
    <label for="content">Add todo:</label>
    <input type="text" name="content" id="content"/>
    <button type="submit">submit</button>
</form>

<div>
    <ul>
        <c:forEach items="${todoList}" var="item">
            <li><c:out value="${item}" /></li>
        </c:forEach>
    </ul>
</div>