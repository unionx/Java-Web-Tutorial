<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h1>Hello, ${name}</h1>
<form action="/sayHello" method="POST">
    <label for="username">你好啊：</label>
    <input type="text" name="username" id="username" />
    <button type="submit">submit</button>
</form>