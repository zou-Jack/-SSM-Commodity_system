<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录页-qxb</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="登录,ssm练习,web项目">
<meta http-equiv="description" content="This is login page">

<!-- 引入css和js -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>

<!-- ajax提交方式 -->
<script type="text/javascript">
	/* Js控制通过#myModal的状态：*/
	$("#myModal").modal({
		keyboard : false,
		backdrop : false
	});

	/* Js控制注册日期的状态：*/
	$(function() {

		$(".form_datetime").datetimepicker({
			format : "yyyy-mm-dd hh:ii",
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			showMeridian : true,
			pickerPosition : "bottom-left",
			language : 'zh-CN', //中文，需要引用zh-CN.js包
			startView : 2, //月视图
			minView : 2
		//日期时间选择器所能够提供的最精确的时间选择视图
		});

		/* 以json的格式提交登录传参 */
		$("#lo")
				.click(
						function() {
							$
									.ajax({
										type : 'post',
										//提交路径
										url : '${pageContext.request.contextPath}/user/checkLogin.action',
										//声明为json格式
										contentType : 'application/json;charset=utf-8',
										//转为json格式
										data : JSON.stringify({
											"username" : $("#loginusername")
													.val(),
											"password" : $("#loginpassword")
													.val()
										}),
										//点击登录以后拿到数据
										success : function(data) {
											//判断
											if (data == "" || data == null) {
												$("#message").html("用户名或密码错误！");
											} else {
												//正常跳转--已修改
												window.location.href = "${pageContext.request.contextPath}/items/queryItems.action";
											}
										}
									});
						});
	});
</script>

<style>
#login {
	width: 450px;
	height: 100px;
	margin: 50px auto;
}
</style>

<body>
	<div class="container">
		<div id="login">
			<!-- 登录模块，以json提交from就可以不写action -->
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">用户名:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="loginusername"
							name="username" placeholder="请输入用户名" required autofocus>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="loginpassword"
							name="password" placeholder="请输入密码" required> <label
							class="control-label" for="inputSuccess1" style="color: red;"
							id="message"></label>
					</div>
				</div>
				<!-- 登录注册按钮 -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-info" id="lo">登录</button>
						<button type="button" class="btn btn-danger" data-toggle="modal"
							data-target="#myModal">注册</button>
					</div>
				</div>
			</form>


			<!-- 注册框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">注册新用户</h4>
						</div>
						<!-- 表单提交注册 -->
						<form class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/user/register.action"
							method="post" id="form">
							<div class="modal-body">
								<!-- 表格 -->
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">用户名:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="username"
											name="username" placeholder="请输入用户名" required autofocus>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">密
										码:</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="password"
											name="password" placeholder="请输入密码" required autofocus>
									</div>
								</div>
								<!-- js控制以日期类型录入-->
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">注册日期:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control input-lg form_datetime"
											id="birthday" name="birthday">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">居住地址:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="address"
											name="address" placeholder="请输入现居住地址" required autofocus>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" id="save">注册</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
