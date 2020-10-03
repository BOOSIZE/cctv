<%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/8/20
  Time: 6:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>欧冠表格</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	<legend>欧冠冠军</legend>
</fieldset>


<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
	<ul class="layui-tab-title">
		<li class="layui-this">历届冠军</li>
		<li>冠军统计（球队）</li>
		<li>冠军统计（联赛)</li>
	</ul>


	<div class="layui-tab-content" style="height: 100px;">



		<div class="layui-tab-item layui-show">

			<form class="layui-form" action="" id="myForm" >
				<div class="layui-form-item">

					<label class="layui-form-label">球队:</label>
					<div class="layui-input-inline">
						<input type="text" id="cname"  placeholder="球队名称模糊搜索" autocomplete="off" class="layui-input">
					</div>


					<label class="layui-form-label">所属联赛:</label>
					<div class="layui-input-inline">
						<select id="country" >
							<option value="全部">全部</option>
							<option value="西班牙">西班牙</option>
							<option value="英格兰">英格兰</option>
							<option value="意大利">意大利</option>
							<option value="德国">德国</option>
							<option value="葡萄牙">葡萄牙</option>
							<option value="荷兰">荷兰</option>
							<option value="法国">法国</option>
							<option value="苏格兰">苏格兰</option>
							<option value="罗马尼亚">罗马尼亚</option>
							<option value="塞尔维亚">塞尔维亚</option>
						</select>
					</div>
					<button class="layui-btn layui-btn-radius layui-btn-norma" lay-submit lay-filter="select">查询</button>

				</div>


			</form>
			<table id="ogTable" lay-filter="ogTable"></table>
		</div>


		<div class="layui-tab-item">
			<table id="clubTable" lay-filter="clubTable"></table>
		</div>

		<div class="layui-tab-item">
			<table id="countryTable" lay-filter="countryTable"></table>
		</div>


	</div>
</div>





<script>

	layui.use(['table','form','element'], function()
	{
		var table = layui.table;
		var form = layui.form;

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
			elem: '#clubTable'
			,url: "<%=path+"og/getClubList"%>"//后端路径
			,page: true//开启分页
			,limit:10//每页条数
			,limits:[10]//可选择每页条数
			,id:"clubTable"//设置table的id（表格重载时调用）
			,cols: [
				[
					{field:'cname', title: '球队', width:'33%'},
					{field:'date', title: '夺冠次数', width:'33%'},
					{field:'country', title: '所属国家', width:'34%'}
				]
			]
		});

		table.render({
			elem: '#countryTable'
			,url: "<%=path+"og/getCountryList"%>"//后端路径
			,page: true//开启分页
			,limit:10//每页条数
			,limits:[10]//可选择每页条数
			,id:"clubTable"//设置table的id（表格重载时调用）
			,cols: [
				[
					{field:'country', title: '联赛', width:'50%'},
					{field:'date', title: '夺冠次数', width:'50%'}
				]
			]
		});


		form.on('submit(select)', function(data)
		{
			table.reload('ogTable',
				{
					page:
						{
							curr: 1
						}
					, where:
						{
							cname:$('#cname').val(),
							country:$('#country').val()
						}
				});
			return false;
		});

	});


</script>


</body>
</html>
