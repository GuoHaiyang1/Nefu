<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Insert title here</title>
</head>
<body>
<!-- 用户登录 -->
<img alt="" src="/resources/img/01.jpg">
<form action="login" method="post">
姓名：<input name="username" type="text"><br>
密码：<input name="password" type="password"><br>
<input type="submit" value="登录"><a href="registaer">注册</a>
</form>
<c:if test="${result!=null }">
${result }
</c:if>
</body>
</html> --%>
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
<%-- <base href="<%=basepath%>"> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/js/style.css">
<link rel="stylesheet" href="<%=basepath%>resources/css/style.css">
</head>
    <script language="javascript">
        function Check()  // 验证表单数据有效性
        {
            if (document.send.username.value == "") {
                window.alert('请输入用户名!');
                return false;
            }
            if (document.send.username.value.length < 2) {
                window.alert('用户名长度必须大于2!');
                return false;
            }
            if (document.send.password.value == "") {
                alert('请输入密码!');
                return false;
            }
            if (document.send.password.value.length < 6) {
                alert('密码长度必须大于6!');
                return false;
            }

           


            return true;
        }
    </script>
<body>
	<div class="container">
		<div class="form row">
			<div class="form-horizontal col-md-offset-3" id="login_form">
				<h3 class="form-title" style="color: black;">软件工程管理系统</h3>



				<form action="/NefuSoftwareManagerSystem/login" method="post" onSubmit="return Check()" name="send">
					<div class="col-md-9">
						<div class="form-group">
							<i class="fa fa-user fa-lg"></i> <input
								class="form-control required" type="text" placeholder="Username"
								id="username" name="username" autofocus="autofocus"
								maxlength="20" />
						</div>
						<div class="form-group">
							<i class="fa fa-lock fa-lg"></i> <input
								class="form-control required" type="password"
								placeholder="Password" id="password" name="password"
								maxlength="8" />
						</div>
						<div class="form-group"></div>

						<div class="row">
							<div class="form-group col-md-offset-9">

								<button type="submit" class="btn btn-success pull-right"
									name="submit">登录</button>
							</div>
							<div class="form-group col-md-offset-9">
								<button type="botton" class="btn btn-warning pull-right"
									name="register">
									<a href="register">注册</a>
								</button>

							</div>

						</div>
					</div>
					</form>
			</div>
		</div>
	</div>
	
	<c:if test="${result!=null }">

 <script type="text/javascript">alert("${result}");</script>
</c:if>
</body>





</html>