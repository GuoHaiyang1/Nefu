<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>task</title>
<!-- 引入 Bootstrap -->
<!-- 增加日期控件 -->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css"
	rel="stylesheet" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
</head>
<%-- <body>
<!-- 显示所有任务信息，用户可选择工作，并进行工作 -->
<table>
<tr><th>任务名称</th><th>任务描述</th><th>任务类型</th><th>任务截至时间</th><th>选择任务</th><th>开始工作</th></tr>
<c:forEach items="${tasks2 }" var="t">
<tr><td>${t.taskTitle }</td><td>${t.taskDescription }</td><td>${t.type }</td><td>${t.deadline }</td><td><a href="${t.id }">选择</a></td><td><a href="work/${t.id }">工作</a></td></tr>
</c:forEach>
</table>
<c:if test="${result!=null }">
${result }
</c:if>

<!-- 查看当前任务 -->
<form action="select1" method="post" >
<input type="submit" value="查询当前所有任务信息">
</form>
<table>
<tr><th>任务名称</th><th>任务描述</th><th>任务类型</th><th>任务回复信息</th><th>任务完成时间</th><th>任务状态</th><th>任务工作人</th></tr>
<c:forEach items="${userTasks }" var="ut">
<tr><td>${ut.task.taskTitle }</td><td>${ut.task.taskDescription }</td><td>${ut.task.type }</td><td>${ut.responseInfo }</td><td>${ut.completeTime }</td><td>${ut.state }</td><td>${ut.user.username }</td></tr>
</c:forEach>
</table>

<!-- 查询历史任务 -->
<form action="select2" method="post" >
<input type="submit" value="查询历史所有任务信息">
</form>
<table>
<tr><th>任务名称</th><th>任务描述</th><th>任务类型</th><th>任务回复信息</th><th>任务完成时间</th><th>任务状态</th><th>任务工作人</th></tr>
<c:forEach items="${userTasks2 }" var="ut">
<tr><td>${ut.task.taskTitle }</td><td>${ut.task.taskDescription }</td><td>${ut.task.type }</td><td>${ut.responseInfo }</td><td>${ut.completeTime }</td><td>${ut.state }</td><td>${ut.user.username }</td></tr>
</c:forEach>
</table>

<br><a href="index">返回</a>
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
                <a href="admin/invigilate" class="list-group-item">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true">
                    </span> 监考信息管理</a>
                <a href="/NefuSoftwareManagerSystem/HanderInformation" class="list-group-item">
                    <span class="glyphicon glyphicon-camera" aria-hidden="true">
                    </span> 查看监考信息分配</a>
                <a href="task" class="list-group-item active">
                    <span class="glyphicon glyphicon-star" aria-hidden="true">
                    </span> 任务</a>
                 <a href="admin/TaskManager" class="list-group-item">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true">
                    </span>  管理任务</a>


            </div>
			<div class="col-sm-10">

				<table class="table table-striped">


					<thead>
						<tr>
							<th>任务名称</th>
							<th>任务描述</th>
							<th>任务类型</th>
							<th>任务截至时间</th>
							<th>选择任务</th>
							<th>开始工作</th>
						</tr>
						<c:forEach items="${tasks2 }" var="t">
					</thead>
					<tbody>
						<tr>
							<td>${t.taskTitle }</td>
							<td>${t.taskDescription }</td>
							<td>${t.type }</td>
							<td>${t.deadline }</td>
							<td>
                    <button type="button" class="btn btn-warning ">
             
<a href="${t.id }">选择</a>
                    </button>
               </td>
							<td>                    <button type="button" class="btn btn-success ">
             
<a href="work/${t.id }">工作</a>
                    </button>
							</td>
						</tr>

					</tbody>

					</c:forEach>
				</table>

				<c:if test="${result!=null }">
				<script type="text/javascript">
				alert("${result}");
				</script>
				</c:if>
				<!-- 查看当前任务 -->
				<form action="select1" method="post">
					<center>
                    <button type="submit" class="btn btn-primary btn-large">
                        查询当前所有任务

                    </button>
                </center>
				</form>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>任务名称</th>
							<th>任务描述</th>
							<th>任务类型</th>
							<th>任务回复信息</th>
							<th>任务完成时间</th>
							<th>任务状态</th>
							<th>任务工作人</th>
						</tr>

						<c:forEach items="${userTasks }" var="ut">
					</thead>
					<tbody>
						<tr>
							<td>${ut.task.taskTitle }</td>
							<td>${ut.task.taskDescription }</td>
							<td>${ut.task.type }</td>
							<td>${ut.responseInfo }</td>
							<td>${ut.completeTime }</td>
							<td>${ut.state }</td>
							<td>${ut.user.username }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 查询历史任务 -->
				<form action="select2" method="post">
				
					<center>
                    <button type="submit" class="btn btn-primary btn-large">
                        查询历史任务

                    </button>
                </center>
				</form>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>任务名称</th>
							<th>任务描述</th>
							<th>任务类型</th>
							<th>任务回复信息</th>
							<th>任务完成时间</th>
							<th>任务状态</th>
							<th>任务工作人</th>
						</tr>
						<c:forEach items="${userTasks2 }" var="ut">
					</thead>
					<tbody>
						<tr>
							<td>${ut.task.taskTitle }</td>
							<td>${ut.task.taskDescription }</td>
							<td>${ut.task.type }</td>
							<td>${ut.responseInfo }</td>
							<td>${ut.completeTime }</td>
							<td>${ut.state }</td>
							<td>${ut.user.username }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>


				<%--   <center>
                    <button type="submit" class="btn btn-primary btn-large">
                        查询当前所有任务

                    </button>
                </center>

                <table class="table table-striped">


                    <thead>
                        <tr>
                            <th>任务名称</th>
                            <th>任务描述</th>
                            <th>任务类型</th>
                            <th>任务截至时间</th>
                            <th>选择任务</th>
                            <th>开始工作</th>
                        </tr>
                        <c:forEach items="${tasks2 }" var="t">

                            <c:forEach items="${tasks}" var="t">
                    </thead>
                    <tbody>
                        <tr>
                            <td>${t.taskTitle }</td>
                            <td>${t.taskDescription }</td>
                            <td>${t.type }</td>
                            <td>${t.deadline }</td>
                            <td>
                                <a href="${t.id }">选择</a>
                            </td>
                            <td>
                                <a href="work/${t.id }">工作</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>

                    </c:forEach>
                </table>
            
            <center>
                <button type="submit" class="btn btn-primary btn-large">
                    查询所有历史任务

                </button>
            </center>
            <table class="table table-striped">


                <thead>
                    <tr>
                        <th>任务名称</th>
                        <th>任务描述</th>
                        <th>任务类型</th>
                        <th>任务截至时间</th>
                        <th>选择任务</th>
                        <th>开始工作</th>
                    </tr>
                    <c:forEach items="${tasks2 }" var="t">

                        <c:forEach items="${tasks}" var="t">
                </thead>
                <tbody>
                    <tr>
                        <td>${t.taskTitle }</td>
                        <td>${t.taskDescription }</td>
                        <td>${t.type }</td>
                        <td>${t.deadline }</td>
                        <td>
                            <a href="${t.id }">选择</a>
                        </td>
                        <td>
                            <a href="work/${t.id }">工作</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>

                </c:forEach>
            </table>
        </div>




        </div>

 --%>

			</div>
</body>


</html>