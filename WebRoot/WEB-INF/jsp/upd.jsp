<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改页面</title>

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

<!-- 添加模态框（Modal）插件 -->
<script type="text/javascript">
	$(function() {
		$('#myModal').modal({
			keyboard : false,
			backdrop : true
		})
	});

	(function() {
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
	<!-- 添加修改商品的模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- 模态框的标题 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改商品</h4>
				</div>

				<!-- 模态框的主体-表单头部 -->
				<form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath }/items/upd.action"
					method="post" id="form" enctype="multipart/form-data">

					<!-- 将id作为隐藏域提交这样就不会出现找不到修改的数据而报错问题 -->
					<input type="hidden" name="id" value="${items.id }" />

					<!-- 主体-表单内容 -->
					<div class="modal-body">
						<div class="form-group  form-group-lg">
							<label for="firstname" class="col-sm-3 control-label">商品名称:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="name"
									name="name" value="${items.name }" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">商品价格:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="price"
									name="price" value="${items.price }" required autofocus>
							</div>
						</div>
						<!-- 重要-日期和图片的获取方式 -->
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">生产日期:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg form_datetime"
									value="<fmt:formatDate value="${items.createtime}" 
							pattern="yyyy-MM-dd"/>"
									name="createtime" id="createtime">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">商品图片:</label>
							<div class="col-sm-5">
								<c:if test="${items.pic!=null }">
									<img style="width: 80px; height: 70px"
										src="${pageContext.request.contextPath }/upload/${items.pic}">
									<br />
									<input type="file" name="items_pic1" />
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">商品介绍:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="detail"
									name="detail" value="${items.detail}" required autofocus>
							</div>
						</div>
					</div>
					<!-- 模态框的尾部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default">
						<a href="${pageContext.request.contextPath }/items/queryItems.action" >返回</a></button> 
						<button type="submit" class="btn btn-primary" id="save">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
