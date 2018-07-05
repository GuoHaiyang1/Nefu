<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
        String path=request.getContextPath();
    String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
 <!-- 引入 Bootstrap -->
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css" rel="stylesheet"
    />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
</head>
<%-- <body>
<table>
<tr><th>username</th><th>password</th><th>职称</th><th>电话</th><th>个人简介</th><th>用户权限</th><th>操作</th></tr>
<c:forEach items="${users }" var="u">
<tr>
<td>${u.username}</td>
<td>${u.password}</td>
<td>${u.user_title}</td>
<td>${u.phone}</td>
<td>${u.user_info}</td>
<td>${u.authority}</td>
<td><a href="updateUser/${u.user_id }">修改用户信息</a><a href="updateAuthority/${u.user_id }">修改权限</a><a href="deleteUser/${u.user_id }">删除用户</a></td>
</tr>
</c:forEach>
<tr><a href="addUser">添加用户</a></tr>
</table>
<c:if test="${adminModifyMessage!=null }">
${adminModifyMessage}
</c:if>
<c:if test="${updateAythorityMessage!=null }">
${updateAythorityMessage}
</c:if>
<c:if test="${deleteUseMessage!=null }">
${deleteUseMessage}
</c:if>
<c:if test="${addUserMessage!=null}">
${addUserMessage}
</c:if>
</body> --%>

<body>

    <!-- 固定在顶部的导航栏 -->
      <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="" title="Home">东北林业大学软件管理</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    
    
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a>欢迎您,${user.username}</a>
                        </li>
                        <li>
                            <a href="login">安全退出</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 导航栏结束 -->
        <br><br><br>
        <br><br>

  <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">
                <a href="index" class="list-group-item ">
                    <span class="glyphicon glyphicon-home"></span> 首页
                </a>

                <!-- 小图标样式设置 -->
                <a href="userManager" class="list-group-item ">
                    <span class="glyphicon glyphicon-user" aria-hidden="true">
                    </span> 个人信息用户管理</a>
                <a href="/NefuSoftwareManagerSystem/admin/adminMange" class="list-group-item active">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true">
                    </span> 管理员管理用户</a>
                <a href="admin/invigilate" class="list-group-item">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true">
                    </span> 监考信息管理</a>
                <a href="/NefuSoftwareManagerSystem/HanderInformation" class="list-group-item">
                    <span class="glyphicon glyphicon-camera" aria-hidden="true">
                    </span> 查看监考信息分配</a>
                <a href="task" class="list-group-item">
                    <span class="glyphicon glyphicon-star" aria-hidden="true">
                    </span> 任务</a>
                 <a href="admin/TaskManager" class="list-group-item">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true">
                    </span>  管理任务</a>


            </div>
            <div class="col-sm-8">
                <table class="table table-striped">
                       
            
                    <thead>
                        <tr>
                            <th>username</th>
                            <th>password</th>
                            <th>职称</th>
                            <th>电话</th>
                            <th>个人简介</th>
                            <th>用户权限</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${users }" var="u">
                    </thead>
                    <tbody>
                        <tr>
                            <td>${u.username}</td>
                            <td>${u.password}</td>
                            <td>${u.user_title}</td>
                            <td>${u.phone}</td>
                            <td>${u.user_info}</td>
                            <td>${u.authority}</td>
                            <!-- <td><a href="updateUser/${u.user_id }">修改用户信息</a><a href="updateAuthority/${u.user_id }">修改权限</a><a href="deleteUser/${u.user_id }">删除用户</a></td> -->
                            <td>
                                <button class="btn btn-primary" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/updateUser/${u.user_id }';">修改用户信息</button>
                                <button class="btn btn-warning" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/updateAuthority/${u.user_id }';">修改权限</button>
                                <button class="btn btn-danger" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/deleteUser/${u.user_id }';">删除用户
                                </button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <center><button class="btn btn-success" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/addUser';">增加用户</center>
            </div>
            <script type="text/javascript">
            </script>
<c:if test="${adminModifyMessage!=null }">
<script type="text/javascript">
alert("${adminModifyMessage}");
</script>

</c:if>
<c:if test="${updateAythorityMessage!=null }">
<script type="text/javascript">
alert("${updateAythorityMessage}");
</script>

</c:if>
<c:if test="${deleteUseMessage!=null }">
<script type="text/javascript">
alert("${deleteUseMessage}");
</script>


</c:if>
<c:if test="${addUserMessage!=null}">
<script type="text/javascript">
alert("${addUserMessage}");
</script>

</c:if>

        </div>
    </div>
    </div>

    </div>
</body>
</html>