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
<title>Index</title>
<!-- 引入 Bootstrap -->
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
<!-- <body>
<form action="addUser" method="post">
姓名：<input name="username" type="text"><br>
密码：<input name="password" type="password"><br>
职称：<select name="user_title">
<option value="teacher">教师</option>
<option value="director">主任</option>
</select><br>
个人简介：<br><textarea rows="5" cols="15" name="user_info"></textarea><br>
手机号：<input type="text" name="phone"><br>
用户权限：<input type="radio" name="authority" value="1">教师
<input type="radio" name="authority" value="2">管理员<br>
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
											class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 page_title " align="center">增加用户</h1>
								<form action="/NefuSoftwareManagerSystem/admin/addUser" method="post" class="form-horizontal"
									onSubmit="return Check()" name="send">
									<div class="row">
										
									</div>
									<div
										class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 register">
										<div class="form-group">
											<label for="username" class="col-sm-3 control-label">用户名：</label>
											<div class="col-sm-8">
												<div class="input-group">
													<input type="text" class="form-control" name="username"
														placeholder="请输入用户名">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-user"></span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="password" class="col-sm-3 control-label">密码：</label>
											<div class="col-sm-8">
												<div class="input-group">
													<input type="password" class="form-control" name="password"
														placeholder="请输入密码（六位以上）">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-lock"></span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="phone" class="col-sm-3 control-label">手机号：</label>
											<div class="col-sm-8">
												<div class="input-group">
													<input type="text" class="form-control" name="phone"
														placeholder="请输入手机号码">
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-phone"></span>
													</div>
												</div>
											</div>
										</div>
										<br>
										<div class="form-group">
											<label for="user_title" class="col-sm-3 control-label">职称：</label>
											<div class="col-sm-8">
											<select name="user_title" class="form-control">
												<option value="teacher">教师</option>
												<option value="director">主任</option>
											</select></div>
											
										</div>
										
											<div class="form-group">
												<label for="title" class="col-sm-3 control-label"
													name="authority">用户权限</label>
													<div class="col-sm-8">
													<div class="radio">
													<label> <input type="radio" name="authority"
														value="1">教师
													</label>
													<label> <input type="radio" name="authority"
													value="2">管理员
												</label>
												</div>
													</div>
												


												
										

						
											<br> <br><br>
											<div class="form-group">
												<label for="user_info" class="col-sm-3 control-label">个人简介：</label>
												<div class="col-sm-8">
													<textarea class="form-control" placeholder="请输入个人简介"
														name="user_info">
														</textarea>

												</div>
												</div>


												<br> <br> <br> <br>
												<div class="form-group">
													<center>
														<button type="submit" class="btn btn-warning btn-large">
															<b>确定添加</b> 
														</button>
													</center>
												</div>
												<div class="form-group">

													<div class="col-sm-5">
														<div class="input-group"></div>
													</div>
												</div>

											</div>
											
								</form>
							</div>


						</div>
					</div>
				</div>

			</div>
</body>

</html>