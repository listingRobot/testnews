<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <section>
            <div><span>新闻标题：</span><input type="text" id="keyword"><input type="button" value="查询" onclick="search()"></div>
            <table id="mainTable" style="border: 1px blue solid">
                <tr>
                    <th colspan="6">
                        <h2>新闻标题</h2>
                    </th>
                </tr>
                <tr>
                    <th>新闻编号</th>
                    <th>新闻标题</th>
                    <th>新闻摘要</th>
                    <th>作者</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${Details}" var="detail">
                    <tr>
                        <td>${detail.id}</td>
                        <td>${detail.title}</td>
                        <td>${detail.summary}</td>
                        <td>${detail.author}</td>
                        <td><fmt:formatDate value="${detail.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td>
                            <a href="comment?newsId=${detail.id}">查看评论</a>
                            <a href="#">评论</a>
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="6">
                        <a href="javascript:;" onclick="PgFont()">首页</a>
                        <a href="javascript:;" onclick="PgUp()">上一页</a>
                        <a href="javascript:;" onclick="PgDn(${pageCount})">下一页</a>
                        <a href="javascript:;" onclick="PgLast(${pageCount})">末页</a>
                        <span>共${pageCount}页/第${page}页</span>
                    </td>
                </tr>
            </table>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery-3.4.0.js"></script>
    <script type="text/javascript">

        var page = 1;
        function PgUp() {
            if(page > 1)
                page--;
            search();
        }

        function PgDn(max) {
            if(page < max){
                page++;
                search();
            }
        }

        function PgFont() {
            page = 1;
            search();
        }

        function PgLast(max) {
            page = max;
            search();
        }

        function search() {
            var title = $("#keyword").val();
            $.ajax({
                url:"search",
                type:"get",
                data:{title:title,page:page},
                datetype:JSON,
                success:function (result) {
                    var json = JSON.parse(result);
                    var text = "";
                    text += "<tr>\n" +
                        "                    <th colspan=\"6\">\n" +
                        "                        <h2>新闻标题</h2>\n" +
                        "                    </th>\n" +
                        "                </tr>\n" +
                        "                <tr>\n" +
                        "                    <th>新闻编号</th>\n" +
                        "                    <th>新闻标题</th>\n" +
                        "                    <th>新闻摘要</th>\n" +
                        "                    <th>作者</th>\n" +
                        "                    <th>创建时间</th>\n" +
                        "                    <th>操作</th>\n" +
                        "                </tr>";
                    for (var i = 0; i < json[0].length; i++) {
                        text += "<tr>\n" +
                            "                        <td>"+json[0][i].id+"</td>\n" +
                            "                        <td>"+json[0][i].title+"</td>\n" +
                            "                        <td>"+json[0][i].summary+"</td>\n" +
                            "                        <td>"+json[0][i].author+"</td>\n" +
                            "                        <td>"+json[0][i].createDate+"</td>\n" +
                            "                        <td>\n" +
                            "                            <a href=\"comment?newsId ="+json[0][i].id+"\">查看评论</a>\n" +
                            "                            <a href=\"#\">评论</a>\n" +
                            "                            <a href=\"#\">删除</a>\n" +
                            "                        </td>\n" +
                            "                    </tr>";
                    }
                    text += "<tr>\n" +
                        "                    <td colspan=\"6\">\n" +
                        "                        <a href=\"javascript:;\" onclick='PgFont()'>首页</a>\n" +
                        "                        <a href=\"javascript:;\" onclick='PgUp()'>上一页</a>\n" +
                        "                        <a href=\"javascript:;\" onclick='PgDn("+json[1]+")'>下一页</a>\n" +
                        "                        <a href=\"javascript:;\" onclick='PgLast("+json[1]+")'>末页</a>\n" +
                        "                        <span>共"+json[1]+"页/第"+json[2]+"页</span>\n" +
                        "                    </td>\n" +
                        "                </tr>";
                    $("#mainTable").html(text);
                }

            });
        }
    </script>
</html>
