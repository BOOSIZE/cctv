<%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/8/25
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>demo</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	<legend>简洁风格的Tab</legend>
</fieldset>

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
	<ul class="layui-tab-title">
		<li class="layui-this">网站设置</li>
		<li>用户管理</li>
		<li>权限分配</li>
		<li>商品管理</li>
		<li>订单管理</li>
	</ul>


	<div class="layui-tab-content" style="height: 100px;">
		<div class="layui-tab-item layui-show">

			<table id="ogTable" lay-filter="ogTable"></table>
		</div>


		<div class="layui-tab-item">
			<table id="studentTable" lay-filter="studentTable"></table>
		</div>


		<div class="layui-tab-item">内容3</div>
		<div class="layui-tab-item">内容4</div>
		<div class="layui-tab-item">内容5</div>
	</div>
</div>
<%--layer.open({--%>
<%--title: '标题',--%>
<%--type:0,--%>
<%--content:'内容',--%>
<%--closeBtn :2,--%>
<%--anim:4--%>
<%--});--%>

<script>
	layui.use(['table','element'], function(){
		var table=layui.table;

		var $ = layui.jquery;
		var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块




		var layid = location.hash.replace(/^#test=/, '');
		element.tabChange('test', layid);

		element.on('tab(test)', function(elem){
			location.hash = 'test='+ $(this).attr('lay-id');
		});


		table.render({
			elem: '#ogTable'
			,url: "<%=path+"og/getList"%>"//后端路径
			,page: true//开启分页
			,limit:10//每页条数
			,limits:[10,15]//可选择每页条数
			,id:"ogTable"//设置table的id（表格重载时调用）
			,cols: [
				[
					{field:'date', title: '年份', width:'33%'},
					{field:'cname', title: '球队', width:'33%'},
					{field:'country', title: '所属国家', width:'34%'}
				]
			]
		});

		table.render({
			elem: '#studentTable'
			,url: "<%=path+"student/getList"%>"//后端路径
			,page: true//开启分页
			,limit:5//每页条数
			,limits:[5,10]//可选择每页条数
			,id:"studentTable"//设置table的id（表格重载时调用）
			,cols: [
				[
					{field:'sname', title: '姓名', width:'25%'},
					{field:'ssex', title: '性别', width:'25%'},
					{field:'cname', title: '班级', width:'25%'},
					{toolbar:'#tool', title: '操作', width:'25%'}
				]
			]
		});

	});
</script>



</body>
</html>
