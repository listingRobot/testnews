
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <section>
        <form>
            <table>
                <tr>
                    <th colspan="2">
                        <h2>增加评论</h2>
                    </th>
                </tr>
                <tr>
                    <td>评论内容（*）</td>
                    <td>
                        <textarea name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>评论人</td>
                    <td>
                        <input type="text" name="author">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="保存">
                        <a href="index.html">返回</a>
                    </td>
                </tr>
            </table>
        </form>
    </section>
</body>
</html>
