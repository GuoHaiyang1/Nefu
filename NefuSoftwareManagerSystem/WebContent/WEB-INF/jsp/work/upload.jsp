<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    String path=request.getContentType();
    String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<%-- <body>
<c:if test="${warn!=null }">
${warn}
</c:if>
<br>
${task.taskTitle }
<br>
${task.taskDescription }
<form action="upload" method="post" enctype="multipart/form-data">
	<input type="file" name="file"/>
	<input type="submit" value="提交"><a href="../task">退出</a>
</form>
<c:if test="${fileupload!=null }">${fileupload }</c:if><br>
 	文件名称： ${fileName }<br />
        文件大小： ${fileSize }<br />
        
        
<form action="download" method="post"  enctype="multipart/form-data">
<input type="file" name="file">
<button>下载</button>
</form>
<ul>
		<c:forEach items="${files }" var="l">
			<li><a href="file/${l.id }">${l.filename }</a></li>
		</c:forEach>
	</ul>
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
                <a href="/NefuSoftwareManagerSystem/userManager" class="list-group-item ">
                    <span class="glyphicon glyphicon-user" aria-hidden="true">
                    </span> 个人信息用户管理</a>
                <a href="/NefuSoftwareManagerSystem/admin/adminMange" class="list-group-item">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true">
                    </span> 管理员管理用户</a>
                <a href="/NefuSoftwareManagerSystem/admin/invigilate" class="list-group-item">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true">
                    </span> 监考信息管理</a>
                <a href="/NefuSoftwareManagerSystem/HanderInformation" class="list-group-item">
                    <span class="glyphicon glyphicon-camera" aria-hidden="true">
                    </span> 查看监考信息分配</a>
                <a href="/NefuSoftwareManagerSystem/admin/task" class="list-group-item active">
                    <span class="glyphicon glyphicon-star" aria-hidden="true">
                    </span> 任务</a>
                 <a href="/NefuSoftwareManagerSystem/admin/TaskManager" class="list-group-item">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true">
                    </span>  管理任务</a>


            </div>
            <div class="col-sm-10">
                <div id="content">
                    <div class="container">
                        <form action="upload" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <div class="row">
                                <h1 class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 page_title ">上传文件</h1>
                            </div>
                            <div class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 register">
                                <c:if test="${warn!=null }">
                                     
                                     <script type="text/javascript">alert("${warn}");</script>
                                </c:if>
                                <br> ${task.taskTitle }
                                <br> ${task.taskDescription }
                                <br>
                                <br>



                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <input type="file" name="file" />
                                        <br>
                                        <button type="submit" class="btn btn-warning btn-large">提交</button>
                                        <a href="../task">退出</a>
                                    </div>
                                    <br>

                                </div>






                            </div>

                            

                        </form>
                         <div class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 register">
                                                         <c:if test="${fileupload!=null }">${fileupload }</c:if>
                                    <br>
                                 
                                    <div class="form-group">
        
                                        <div class="col-sm-3">
                                            <label for="fileName">文件名称：</label>
                                            </div>
                                            <div class="col-sm-8">
                                             ${fileName }
                                            </div>
                                            
                                     
                                    </div>
                                     <br>
                      
                                    <div class="form-group">
        
                                        
                                           
                                            <div class="col-sm-3">
                                            <label for="fileName">文件大小：</label>
                                            </div>
                                            <div class="col-sm-8">
                                             ${fileSize }
                                            </div>
                                     
                                    </div>
                                    <br>
                      
                                    <div class="form-group">
        
                                       
                                        </div>
                                        </div>
        
                                    </div>
                                    </div>
                        
                        <form action="download" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <div class="row">
                                <h2 class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 page_title ">下载文件</h2>
                            </div>
                            <div class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1 register">
   
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <input type="file" name="file" />
                                            <br>
                                            <button class="btn btn-success btn-large">下载</button>
                                        </div>
                                        <br>
                                        <br><br>
                                        
        
                                    </div>
        
        

                                    <ul>
                              
                                        <c:forEach items="${files }" var="l">
                                            <li>
                                                <a href="file/${l.id }">${l.filename }</a>
                                            </li>
                                        </c:forEach>
                                    </ul>


                            </div>
                            </form>

                            
                    </div>
                </div>


            </div>

        </div>



    </div>
    
    





</body>
</html>