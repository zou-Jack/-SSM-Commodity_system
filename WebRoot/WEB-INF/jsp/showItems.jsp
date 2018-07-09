<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品详情页-qxb</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>

<script type="text/javascript">
<!-- 添加模态框（Modal）插件 -->
	$("#myModal").modal({
		keyboard : false,
		backdrop : true
	});
	$(function() {

		$(".form_datetime").datetimepicker({
			format : "yyyy-mm-dd hh:ii",
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			showMeridian : true,
			pickerPosition : "bottom-left",
			language : 'zh-CN',//中文，需要引用zh-CN.js包
			startView : 2,//月视图
			minView : 2
		//日期时间选择器所能够提供的最精确的时间选择视图
		});
	});
</script>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-7">
				<h2>SSM的CRUD+分页+拦截器+日期转换+Ajax</h2>
				<span>柒晓白-2018/3/22</span>
			</div>
			<div class="col-md-offset-10">
				<h4>
					欢迎您:&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>
					<strong>${user1.username }</strong><small>
					<a href="${pageContext.request.contextPath }/user/LogOut.action">注销</a></small>
				</h4>
			</div>
		</div>
		<!-- 按钮-->
		<div class="row">
			<div class="col-md-6 col-md-offset-10">
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myModal">
					<span class="glyphicon glyphicon-plus"></span>添加商品
				</button>
			</div>
		</div>
		<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<form
					action="${pageContext.request.contextPath }/items/addCar.action"
					method="post">
					<table class="table table-bordered table-hover">
						<tr class="success" align="center">
							<th>商品名称</th>
							<th>商品价格</th>
							<th>商品图片</th>
							<th>商品介绍</th>
							<th>生产日期</th>
							<th colspan="3">操作</th>
						</tr>
						<c:forEach items="${pageInfo.list}" var="item">
							<tr align="center">
								<td>${item.name }</td>
								<td>${item.price }</td>
								<!-- 照片显示 -->
								<td><img title="${item.detail }"
									style="width: 60px; height: 60px"
									src="${pageContext.request.contextPath}/upload/${item.pic}"></td>
									
								<td>${item.detail }</td>
								<!-- fmt函数库提供返回日期格式 -->
								<td><fmt:formatDate value="${item.createtime}"
										pattern="yyyy-MM-dd" /></td>
								<!-- 删除操作-带id参数 -->
								<td><a
									href="${pageContext.request.contextPath }/items/del.action?id=${item.id}"><button
											type="button" class="btn btn-success btn-lg"
											onclick="return confirm('确定要删除信息吗？') ">
											<span class="glyphicon glyphicon-trash"></span> 删除
										</button></a></td>
								<!-- 修改操作 -->	
								<td><a
									href="${pageContext.request.contextPath }/items/findOne.action?id=${item.id}"><button
											type="button" class="btn btn-success btn-lg">
											<span class="glyphicon glyphicon-edit"></span> 修改
										</button></a></td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
		<!-- 分页 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6">
				<h4>当前第${pageInfo.pageNum }页，共${pageInfo.pages }页，共${pageInfo.total }条记录数</h4>
			</div>
			<!-- 分页条 -->
			<div class="col-md-6">
				<ul class="pagination pagination-lg">
					<li><a
						href="${pageContext.request.contextPath }/items/queryItems.action?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath }/items/queryItems.action?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="nav">
						<c:if test="${nav==pageInfo.pageNum }">
							<li class="active"><a
								href="${pageContext.request.contextPath }/items/queryItems.action?pn=${nav}">${nav }</a></li>
						</c:if>
						<c:if test="${nav!=pageInfo.pageNum }">
							<li><a
								href="${pageContext.request.contextPath }/items/queryItems.action?pn=${nav}">${nav }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage}">
						<li><a
							href="${pageContext.request.contextPath }/items/queryItems.action?pn=${pageInfo.pageNum+1}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a
						href="${pageContext.request.contextPath }/items/queryItems.action?pn=${pageInfo.pages}">末页</a></li>
				</ul>
			</div>
		</div>
		
		<!-- 为了美化页面随便写的，可以删除！ -->
		<div class="row">
			<div class="col-xs-12">
				<div class="col-md-4">
					<h2>笑话01</h2>
					<p>小保姆嗓门特别大，
					主人叮嘱，今晚来的都是有身份的人，
					说话务必小声一点。吃完饭，主人客人玩牌，
					小保姆收拾完想早点休息，
					于是凑近男主人耳边轻声道：“那我先睡了哈。”</p>
					<p>
						<a class="btn btn-default" href="#" role="button">查看详情
							&raquo;</a>
					</p>
				</div>
				<!--/span-->
				<div class="col-md-4">
					<h2>笑话02</h2>
					<p>02.爱人是路，朋友是树，
					人生有一条路，
					一条路上有许多树，有钱的时候别迷路，
					缺钱的时候靠靠树，幸福的时候莫忘路，
					休息的时候浇浇树。</p>
					<p>
						<a class="btn btn-default" href="#" role="button">查看详情
							&raquo;</a>
					</p>
				</div>
				<!--/span-->
				<div class="col-md-4">
					<h2>笑话03</h2>
					<p>03.今天，我开车走在一段收费公路上。
					靠近一个收费亭的时候车子抛锚了。
					我只好在冒烟的车里等着，痛哭流涕，
					眼睁睁看着其他车子呼啸而过。
					直到一个巡警过来帮我把车子推过了收费站。
					收费站里的妇女跟我说她很同情我，可是仍然收了我3块钱。</p>
					<p>
						<a class="btn btn-default" href="#" role="button">查看详情
							&raquo;</a>
					</p>
				</div>
				<!--/span-->
				<div class="col-md-12">
					<h2>笑话04</h2>
					<p>04.与一家上中产吃饭。
					丈夫在家炒股，有得色，说过去两三个月“炒得不错”。
					女婿在金融界工作，谦称“挣点泡沫的钱”，
					丈母娘坚定地说，“泡沫越多越好！” </p>
					<p>
						<a class="btn btn-default" href="#" role="button">查看详情
							&raquo;</a>
					</p>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
	</div>
	<!-- 添加商品的模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			<!-- 模态框的标题 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加商品</h4>
				</div>
				<!-- 模态框的主体-表单头部 -->
				<form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath }/items/addItems.action"
					method="post" id="form" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="form-group  form-group-lg">
							<label for="firstname" class="col-sm-3 control-label">商品名称:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="name"
									name="name" placeholder="请输入商品名字" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">商品价格:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="price"
									name="price" placeholder="请输入商品价格" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">商品生产日期:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg form_datetime"
									id="createtime" name="createtime">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">商品介绍:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="detail"
									name="detail" placeholder="请输入商品介绍" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">上传商品图片:</label>
							<div class="col-sm-5">
								<input type="file" class="form-control input-lg" id="items_pic"
									name="items_pic">
							</div>
						</div>
					</div>
					<!-- 模态框的尾部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" id="save">保存</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>