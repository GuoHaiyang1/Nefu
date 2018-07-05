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
<script type="text/javascript" src="../../../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="../../../js/My97DatePicker/WdatePicker.js"></script>
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

<script>
	$(function() {

		$('#date1').datetimepicker({
			format : 'YYYY-MM-DD hh:mm:ss',
			locale : moment.locale('zh-cn')
		});
		$('#deadline').datetimepicker({
			format : 'YYYY-MM-DD hh:mm:ss',
			locale : moment.locale('zh-cn')
		});
	});
</script>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="taskOff()">
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
                <a href="task" class="list-group-item">
                    <span class="glyphicon glyphicon-star" aria-hidden="true">
                    </span> 任务</a>
                 <a href="admin/TaskManager" class="list-group-item active">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true">
                    </span>  管理任务</a>


            </div>
<!--                     增加任务                   -->
			<div class="col-sm-10">
				<form action="admin/createTask" method="post"
					class="form-horizontal">

					<h2 align="center">增加任务</h2>
					<br> <br>


					<div class="form-group">
						<label for="taskTitle" class="col-sm-3 control-label">任务名称：</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" class="form-control" name="taskTitle"
									placeholder="请输入任务名称">

							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label">文档类型：</label>
						<div class="col-sm-3">


							<select class="selectpicker" name="type">
								<option value="文档">文档型</option>
								<option value="回复">回复型</option>

							</select>
						</div>

					</div>
					<div class="form-group">
						<label  class="col-sm-3 control-label" >选择日期：</label>
						<div class="row">
							<div class="col-sm-3">


								<div class="input-group date" id='date1'>
									<input type="text" class="form-control" name="deadline"> <span
										class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="taskDescription" class="col-sm-3 control-label">任务描述：</label>
						<div class="col-sm-3">
							<textarea class="form-control" placeholder="请输入任务描述"
								name="taskDescription"></textarea>

						</div>
						</div>


						<br> 

						<div class="form-group">
							<center>
								<button type="submit" class="btn btn-success btn-large"
									>
									<b>创建</b>

								</button>
							</center>
						</div>
				</form>
			
			
			
			<c:if test="${result!=null }">
                         
                            <script type="text/javascript">
                        alert("${result}");
                        </script>
                        </c:if>

			<br> <br> <br>
			
			
			<!-- 修改任务信息 -->

                            <form action="admin/updateTask" method="post" class="form-horizontal">

                                <h2 align="center">修改任务</h2>
                                <br>
                                <br>
                                <div class="form-group">
                                <label for="type" class="col-sm-3 control-label">选择任务：</label>
                                    <div class="col-sm-3">
                
                                        <select name="id" class="form-control">
                                            
                                            <c:forEach items="${tasks}" var="n">
                                                <option id="${n.state }" value="${n.id }">${n.taskTitle}</option>
                                            </c:forEach>
                                        </select><br>
                
                
                                    </div>
                                    </div>

                                <div class="form-group">
                                    <label for="taskTitle" class="col-sm-3 control-label">任务名称：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="taskTitle" placeholder="请输入任务名称">

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="type" class="col-sm-3 control-label">文档类型：</label>
                                    <div class="col-sm-3">


                                        <select class="form-control" name="type">
                                            <option value="文档">文档型</option>
                                            <option value="回复">回复型</option>

                                        </select>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="time" class="col-sm-3 control-label" name="deadline">修改日期：</label>
                                    <div class="row">
                                        <div class="col-sm-3">


                                            <div class="input-group date" id='deadline'>
                                                <input type="text" class="form-control" name="deadline">
                                                <span class="input-group-addon">
                                                    <i class="glyphicon glyphicon-calendar"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="taskDescription" class="col-sm-3 control-label">任务描述：</label>
                                    <div class="col-sm-3">
                                        <textarea class="form-control" placeholder="请输入任务描述" name="taskDescription"></textarea>

                                    </div>
                                </div>


                                <br>
                                
                                
                                
                                
                               

                                <div class="form-group">
                                    <center>
                                        <button type="submit" class="btn btn-warning btn-large" >
											修改
                                        </button>
                                    </center>
                                </div>
                            </form>
             


                        <c:if test="${result2!=null }">
                        <script type="text/javascript">
                        alert("${result2}");
                        </script>
                                </c:if>

                        <br>
                        <br>
                        <br>

<div class="form-group">						
<h2 align="center">任务操作</h2>

			<table class="table table-striped">


				<thead>
					<tr>
						<th>任务名称</th>
						<th>任务描述</th>
						<th>任务类型</th>
						<th>任务截至时间</th>
						<th>任务当前状态 <th>任务操作</th>
                        </tr>

                        
                    
				</thead>
                    <tbody>
                    <c:forEach items="${tasks}" var="t">
                        <tr>
                            <td>${t.taskTitle }</td>
                            <td>${t.taskDescription }</td>
                            <td>${t.type }</td>
                            <td>${t.deadline }</td>
                            <td>${t.state}</td>
                            <td>
                                <a href="admin/${t.id}">关闭任务</a>
                            </td>
                        </tr>
                         </c:forEach>
                    </tbody>

                   
                </table>
                </div>
                </div>



                        <script>
																									function taskOff() {
																										var obj = document
																												.getElementsByTagName("option");
																										for (var i = 0; i < obj.length; i++) {
																											if (obj[i].id == '关闭') {
																												obj[i].disabled = true;
																											}
																										}
																									}
																								</script></div>
                  
						  </div>
                    </div>
    <c:if test="${exception!=null }">
                      <script type="text/javascript">
                      alert("${exception}");
 </script>
</c:if>

</body>
<%-- <body onload="taskOff()">

<!-- 创建任务 -->

<form action="createTask" method="post">
任务名称：<input name="taskTitle" type="text"><br>
任务描述：<br><textarea rows="5" cols="15" name="taskDescription"></textarea><br>
任务类型：<select name="type">
<option value="文档">文档型</option>
<option value="回复">回复型</option>
</select><br>
截止时间：<input name="deadline" type="text" onFocus="WdatePicker(dateFmt:'yyyy-mm-dd HH:mm')"/><br>
<input type="submit" value="创建"><br>
</form> 
<c:if test="${result!=null }">
${result}
</c:if>

<br>
<br>
<br>
<br>

<!-- 修改任务信息 -->
<form action="updateTask" method="post">
<select name="id">
<option></option>
<c:forEach items="${tasks}" var="n">
<option id="${n.state }" value="${n.id }">${n.taskTitle}</option>
</c:forEach>
</select><br>
任务名称：<input id="name" name="taskTitle" type="text"><br>
任务描述：<br><textarea rows="5" cols="15" name="taskDescription"></textarea><br>
任务类型：<select name="type">
<option value="文档">文档型</option>
<option value="回复">回复型</option>
</select><br>
截止时间：<input name="deadline" type="text"/><br>
<input type="submit" value="修改"><br>
</form>
<c:if test="${result2!=null }">
${result2}
</c:if>


<br>
<br>
<br>



<!-- 关闭任务 --><!-- 未完成指定任务关闭功能 -->
<table>
<tr><th>任务名称</th><th>任务描述</th><th>任务类型</th><th>任务截至时间</th><th>任务当前状态<th>任务关闭</th></tr>
<c:forEach items="${tasks }" var="t">
<tr><td>${t.taskTitle }</td><td>${t.taskDescription }</td><td>${t.type }</td><td>${t.deadline }</td><td>${t.state}</td><td><a href="${t.id}">关闭任务</a></td></tr>
</c:forEach>
</table>

<br><a href="../index">返回</a>
<script>
function taskOff(){
	var obj=document.getElementsByTagName("option");
	for(var i=0;i<obj.length;i++){
		if(obj[i].id=='关闭'){
			obj[i].disabled=true;
		}
	}
}
</script>

</body> --%>
</html>