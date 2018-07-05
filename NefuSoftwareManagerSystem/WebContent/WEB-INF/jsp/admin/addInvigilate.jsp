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
<title>添加监考信息</title>
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
<script>
	$(function() {

		$('#date1').datetimepicker({
			format : 'YYYY-MM-DD HH:mm:ss',
			locale : moment.locale('zh-cn')
		});
	});
	$(function() {

		$('#date2').datetimepicker({
			format : 'YYYY-MM-DD HH:mm:ss',
			locale : moment.locale('zh-cn')
		});
	});
</script>

<!-- <body>
<form action="addInvigilate" method="post">
课程名称：<input name="coursename" type="text"><br>
地点：<input name="address" type="text"><br>
所需人数：<input name="count" type="text"><br>
开始时间：<input name="startTime" type="text"><br>
截止时间：<input name="endTime" type="text"><br>
<input type="hidden" value="0" name="state">
<input type="submit" value="确认添加">
</form>
</body> -->

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
                <a href="index" class="list-group-item active">
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
                <a href="task" class="list-group-item">
                    <span class="glyphicon glyphicon-star" aria-hidden="true">
                    </span> 任务</a>
                 <a href="admin/TaskManager" class="list-group-item">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true">
                    </span>  管理任务</a>


            </div>
			<div class="col-sm-10">
				<div id="content">
					<div class="container">
						<h1
							class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 page_title "
							align="center">增加监考信息</h1>
							<br>
							<br>
							<br>
							<br>
							<br>
						<form action="/NefuSoftwareManagerSystem/admin/addInvigilate"
							method="post" class="form-horizontal">
							<div class="row"></div>
							<div class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 register">
								<div class="form-group">
									<label for="coursename" class="col-sm-3 control-label">课程名称：</label>
									<div class="col-sm-8">
										
											<input type="text" class="form-control" name="coursename"
												placeholder="请输入课程名称">

										</div>
									</div>
								
								<div class="form-group">
									<label for="count" class="col-sm-3 control-label">所需人数：</label>
									<div class="col-sm-8">
										
											<input type="text" class="form-control" name="count"
												placeholder="请输入人数">
										</div>
									
								</div>

								<div class="form-group">
									<label for="" class="col-sm-3 control-label">地点：</label>



									<div class="col-sm-8">
										<input type="text" class="form-control" name="address"
											placeholder="请输入监考地点">
									</div>
								</div>


								<div class="form-group">
									<label for="startTime" class="col-sm-3 control-label">开始时间：</label>
									<div class="row">
										<div class="col-sm-8">


											<div class="input-group date" id='date1'>
												<input type="text" class="form-control" name="startTime">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="endTime" class="col-sm-3 control-label">结束时间：</label>
									<div class="row">
										<div class="col-sm-8">


											<div class="input-group date" id='date2'>
												<input type="text" class="form-control" name="endTime">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
							
								<div class="form-group">

									<div class="col-sm-10">
										<div class="input-group">
											<input type="hidden" value="0" name="state">

										</div>
									</div>
								</div>
								<br>
								<br>
								<br>
								

								<div class="form-group">
									<center>
										<button type="submit" class="btn btn-warning btn-large">
											<b>确定添加</b>

										</button>
									</center>
								</div>
						</form>
						<c:if test="${exception!=null }">
                      <script type="text/javascript">
                      alert("${exception}");
 </script>
</c:if>
					</div>


				</div>
			</div>
		</div>

	</div>
</body>
</html>