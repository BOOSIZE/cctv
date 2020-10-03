<%--
  Created by IntelliJ IDEA.
  User: 29778
  Date: 2020/9/2
  Time: 21:47
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

<table id="a" lay-filter="a"></table>


<script>


	layui.use('table', function()
	{

		var table = layui.table;


		//msg:"",code:"",count:"",data:""//String

		table.render({
			elem: '#a'
			,url: "<%=path+"aaa/getList"%>"//后端路径
			,page: true//开启分页
			,limit:5//每页条数
			,limits:[5,10]//可选择每页条数
			,id:"a"//设置table的id（表格重载时调用）
			,cols: [
				[
					{field:'sname', title: '姓名', width:'50%'},
					{field:'ssex', title: '性别', width:'50%'}
				]
			]
		});

	});



</script>




</body>
</html>
