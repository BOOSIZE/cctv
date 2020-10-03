<%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/8/27
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>注册</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>

<form class="layui-form" action="">
	<div class="layui-form-item">
		<label class="layui-form-label">输入框</label>
		<div class="layui-input-block">
			<input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密码框</label>
		<div class="layui-input-inline">
			<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-form-mid layui-word-aux">辅助文字</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">选择框</label>
		<div class="layui-input-block">
			<select name="city" lay-verify="required">
				<option value=""></option>
				<option value="0">北京</option>
				<option value="1">上海</option>
				<option value="2">广州</option>
				<option value="3">深圳</option>
				<option value="4">杭州</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">复选框</label>
		<div class="layui-input-block">
			<input type="checkbox" name="like[write]" title="写作">
			<input type="checkbox" name="like[read]" title="阅读" checked>
			<input type="checkbox" name="like[dai]" title="发呆">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">开关</label>
		<div class="layui-input-block">
			<input type="checkbox" name="switch" lay-skin="switch">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">单选框</label>
		<div class="layui-input-block">
			<input type="radio" name="sex" value="男" title="男">
			<input type="radio" name="sex" value="女" title="女" checked>
		</div>
	</div>
	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">文本域</label>
		<div class="layui-input-block">
			<textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>

<script>

	layui.use('form', function(){
		var form = layui.form;

		//监听提交
		form.on('submit(formDemo)', function(data){
			layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
</script>



</body>
</html>
