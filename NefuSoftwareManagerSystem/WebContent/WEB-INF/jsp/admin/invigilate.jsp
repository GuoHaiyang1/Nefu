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
<!-- 引入 Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css" rel="stylesheet"
    />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<title>监考</title>
</head>
<%-- <body>
考试信息表
<table>
<tr><th>课程名称</th><th>起止时间</th><th>截止时间</th><th>所需人数</th><th>地点</th><th>监考状态</th></tr>
<c:forEach items="${invigilates}" var="i">
<tr>
<td>${i.coursename}</td>
<td>${i.startTime}</td>
<td>${i.endTime}</td>
<td>${i.count}</td>
<td>${i.address}</td>
<td>
<c:if test="${i.state==0 }">
<span>未分配</span><a href="invigilateHander/${i.id}">分配监考</a>
</c:if>
<c:if test="${i.state==1}">
<span>已分配</span><a href="seeInformation">查看分配信息</a>
</c:if>
<c:if test="${i.state==2}">
<span>已完成</span>
</c:if>
</td>
</tr>
</c:forEach>
</table>
<a href="addInvigilate">添加考试</a><br>
<c:if test="${addInvigilateMessage!=null }">
${addInvigilateMessage}
</c:if>
<c:if test="${addInvigilateError!=null }">
${addInvigilateError}
</c:if>
<c:if test="${handerError!=null }">
${handerError}
</c:if>
<c:if test="${succeedHander!=null }">
${succeedHander}
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
                <a href="/NefuSoftwareManagerSystem/admin/adminMange" class="list-group-item">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true">
                    </span> 管理员管理用户</a>
                <a href="admin/invigilate" class="list-group-item active">
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
            <div class="col-sm-10">
                <table class="table table-striped">
                       
            
                    <thead>
                            <tr><th>课程名称</th><th>起止时间</th><th>截止时间</th><th>所需人数</th><th>地点</th><th>监考状态</th></tr>
                            <c:forEach items="${invigilates}" var="i">
                    </thead>
                    <tbody>
                            <tr>
                                    <td>${i.coursename}</td>
                                    <td>${i.startTime}</td>
                                    <td>${i.endTime}</td>
                                    <td>${i.count}</td>
                                    <td>${i.address}</td>
                                    <td>
                                    <c:if test="${i.state==0 }">
                                    <span>未分配</span>&nbsp;&nbsp;
                                    <button class="btn btn-primary" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/invigilateHander/${i.id}';">分配监考</button>
                                     <button class="btn btn-warning" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/deleteInvigilateInformation/${i.id}';">删除考试</button>
                                    </c:if>
                                    <c:if test="${i.state==1}">
                                    <span>已分配</span>
                                    <button class="btn btn-warning" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/seeInformation';">查看分配信息</button>
                                    </c:if>
                                    <c:if test="${i.state==2}">
                                    <span>已完成</span>
                                    </c:if>
                                    </td>
                                    </tr>
                                    </c:forEach>
                    </tbody>
                </table>
                <center><button class="btn btn-success" onclick="javascript:window.location.href='/NefuSoftwareManagerSystem/admin/addInvigilate';">增加考试</center>
            </div>
 <c:if test="${deleteInvigilateInformation!=null }">
 <script type="text/javascript">
 alert("${deleteInvigilateInformation}")
 </script>

</c:if>
<c:if test="${addInvigilateMessage!=null }">
 <script type="text/javascript">
 alert("${addInvigilateMessage}")
 </script>
</c:if>
<c:if test="${addInvigilateError!=null }">

 <script type="text/javascript">
 alert("${addInvigilateError}")
 </script>
</c:if>
<c:if test="${handerError!=null }">
 <script type="text/javascript">
 alert("${handerError}")
 </script>

</c:if>
<c:if test="${succeedHander!=null }">
 <script type="text/javascript">
 alert("${succeedHander}");
 </script>

</c:if>
<c:if test="${countError!=null }">
 <script type="text/javascript">
 alert("${countError}");
 </script>
 </c:if>
        </div>
    </div>
    </div>

    </div>
</body>
</html>