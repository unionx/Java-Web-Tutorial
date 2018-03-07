<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ToDo List</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">ToDo List</a>
        </div>
    </div>
</nav>

<div class="container">
    <form action="/todo" method="POST">
        <div class="form-group">
            <label for="content">Add todo item</label>
            <input type="text" class="form-control" id="content" name="content">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</div>

<div class="container" style="margin-top:20px">
    <table class="table table-bordered">
        <c:forEach items="${todoList}" var="item">
            <tr>
                <td><c:out value="${item}" /></td>
                <td>
                    <button type="button" class="btn btn-danger btn-sm"
                            onclick='deleteTodo("${item}")' style="margin-left:10px;padding:5px;">删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <ul>

    </ul>
</div>

<script type="application/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="application/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
