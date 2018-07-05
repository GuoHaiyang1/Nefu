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
<tr><td>考试科目：</td><td>${modifySession.invigilate.coursename }</td></tr>
<tr><td>考试地点：</td><td>${modifySession.invigilate.address}</td></tr>
<tr><td>考试开始时间:</td><td>${modifySession.invigilate.startTime}</td></tr>
<tr><td>考试结束时间:</td><td>${modifySession.invigilate.endTime}</td></tr>
<tr><td>考试所需人数：</td><td>${modifySession.invigilate.count}</td></tr>
</table>
<form action="/NefuSoftwareManagerSystem/admin/succeedModify" method="post">
选择教师：
<c:forEach items="${usersSession}" var="u">
<input type="checkbox" name="users" value="${u.user_id }"><span>${u.username}</span>
</c:forEach>
<span>(单选框已按老师的监考次数按从小到大排了序)</span><br>
选择发信息的老师：
<c:forEach items="${usersSession}" var="u1">
<input type="radio" name="sendUser" value="${u1.user_id }"><span>${u1.username}</span>
</c:forEach>
<input type="hidden" name="id" value="${modifySession.invigilate.id }">
<br><input type="submit" value="确认修改">
</form>
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
                <a href="/NefuSoftwareManagerSystem/HanderInformation" class="list-group-item ">
                    <span class="glyphicon glyphicon-camera" aria-hidden="true">
                    </span> 查看监考信息分配</a>
                <a href="task" class="list-group-item">
                    <span class="glyphicon glyphicon-star" aria-hidden="true">
                    </span> 任务</a>
                 <a href="admin/TaskManager" class="list-group-item">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true">
                    </span>  管理任务</a>


            </div>


   
            <form action="/NefuSoftwareManagerSystem/admin/succeedModify" method="post" class="form-horizontal">
                <div class="col-sm-8">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>考试科目：</th>
                                <th>考试地点：</th>
                                <th>考试开始时间：</th>
                                <th>考试结束时间：</th>
                                <th>考试所需人数：</th>

                            </tr>

                        </thead>
                        <tbody>
                            <tr>
                                <td>${modifySession.invigilate.coursename }</td>
                                <td>${modifySession.invigilate.address}</td>
                                <td>${modifySession.invigilate.startTime}</td>
                                <td>${modifySession.invigilate.endTime}</td>
                                <td>${modifySession.invigilate.count}</td>
                            </tr>


                        </tbody>
                    </table>
                    <div class="form-group">
                    <h2 >选择教师：</h3>
                   <h4>(单选框已按老师的监考次数按从小到大排了序)</h4>
  
                
                    
                       

                        <div class="col-sm-10">

                            
                                <c:forEach items="${usersSession}" var="u">
                                    <input type="checkbox" name="users" value="${u.user_id }" >
                                    <span>${u.username}</span>
                                </c:forEach>
                              
                          
                        </div>


                    </div>
                    <div class="form-group">

                       
                        <h2>选择发信息的老师：</h2>
                        <div class="col-sm-8">

                            <div class="input-group">

                                <c:forEach items="${usersSession}" var="u1">
                                    <input type="radio" name="sendUser" value="${u1.user_id }">
                                    <span>${u1.username}</span>
                                </c:forEach>
                            </div>


                        </div>

                        <div class="form-group">
                            <input type="hidden" class="form-control" name="id" value="${modifySession.invigilate.id }">

                        </div>
                            <br>
                            <br>
                            <br>


                        <div class="form-group">
                           


                                <center>
                                    <button type="submit" class="btn btn-warning btn-large">
                                        <b>确定修改</b>

                                    </button>
                                </center>
                                






                           
                        </div>
                        
            </form>

<c:if test="${countError!=null }">
 <script type="text/javascript">
 alert("${countError}");
 </script>
 </c:if>







</body>