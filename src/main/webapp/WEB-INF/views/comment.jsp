<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section>
    <table>
        <tr>
            <th colspan="6">
                <h2>新闻标题</h2>
                <a href="index.html">返回新闻列表</a>
            </th>
        </tr>
        <tr>
            <th>评论编号</th>
            <th>评论内容</th>
            <th>评论人</th>
            <th>评论时间</th>
        </tr>
        <c:forEach items="${comments}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.content}</td>
                <td>${comment.author}</td>
                <td><fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
            </tr>
        </c:forEach>
    </table>
</section>
</body>
</html>
