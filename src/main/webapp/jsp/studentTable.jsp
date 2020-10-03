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
	<title>班学生表格</title>
	<link rel="stylesheet" href="<%=path+"js/layui/css/layui.css"%>">
	<script type="text/javascript" src="<%=path+"js/layui/layui.js"%>"></script>
	<script type="text/javascript" src="<%=path+"js/jquery-3.4.1.js"%>"></script>
</head>
<body>

<script type="text/html" id="tool">
	<a class="layui-btn layui-btn-xs" lay-event="update">修改姓名</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>


<script type="text/html" id="msg">
	<form class="layui-form" action=""  >
		<div class="layui-form-item">

			<label class="layui-form-label">姓名:</label>
			<div class="layui-input-inline">
				<input type="text" id="sname2"  placeholder="请输入姓名" lay-verify="required" autocomplete="off" class="layui-input">
			</div>

		</div>
		<div class="layui-form-item">

			<label class="layui-form-label">性别:</label>
			<div class="layui-input-inline">
				<select id="ssex2" >
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>

		</div>



		<div class="layui-form-item">

			<label class="layui-form-label">班级:</label>
			<div class="layui-input-inline">
				<select id="cid">
				</select>
			</div>

		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="yes">确认</button>
			</div>
		</div>

	</form>

</script>

<form class="layui-form" action="" id="myForm" >
	<div class="layui-form-item">

		<label class="layui-form-label">姓名:</label>
		<div class="layui-input-inline">
			<input type="text" id="sname"  placeholder="姓名模糊搜索" autocomplete="off" class="layui-input">
		</div>


		<label class="layui-form-label">性别:</label>
		<div class="layui-input-inline">
			<select id="ssex" >
				<option value="全部">全部</option>
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
		</div>
		<button class="layui-btn layui-btn-radius layui-btn-norma" lay-submit lay-filter="select">查询</button>
		<button class="layui-btn layui-btn-radius layui-btn-danger" lay-submit lay-filter="add">新增</button>

	</div>


</form>
<table id="studentTable" lay-filter="studentTable"></table>

<script>





	layui.use(['table','form'], function()
	{
		var table = layui.table;
		var form = layui.form;

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

		form.on('submit(select)', function(data)
		{
			table.reload('studentTable',
				{
					page:
						{
							curr: 1//从第一页开始
						}
					, where:
						{
							sname: $('#sname').val()//写条件
							, ssex: $('#ssex').val()
						}
				});
			return false;
		});

		form.on('submit(add)', function(data)
		{
			var dialog=layer.open({
				title: '新增',
				content: $('#msg').html(),
				closeBtn :2,
				anim:4,
				type:0,
				area: ['400px','300px'],
				success:function ()
				{
					$.ajax({
						type:'POST',
						url:'<%=path+"class/getList"%>',
						success:function(msg)
						{
							for(var i=0;i<msg.length;i++)
							{
								$("#cid").append("<option value='"+msg[i].cid+"'>"+msg[i].cname+"</option>");
							}
							form.render();
						},
						error:function ()
						{
							layer.alert("服务器正忙.....", {icon: 5});
						}
					});				}
			});
			form.on('submit(yes)', function(data)
			{
				var sname=$('#sname2').val();
				var ssex=$('#ssex2').val();
				var cid=$('#cid').val();
				if(sname.length<2 || sname.length>6)
				{
					layer.alert("请输入2-6位的姓名",{icon:5});
				}
				else
				{
					$.ajax({
						type:'POST',
						url:'<%=path+"student/addStudent"%>',
						data:{sname:sname,ssex:ssex,cid:cid},
						success:function(msg)
						{
							if(msg ==="yes")
							{
								layer.alert("新增成功", {icon: 6});
								table.reload('studentTable');
								layer.close(dialog);
							}
							else
							{
								layer.alert("新增失败，请重试", {icon: 5});
							}
						},
						error:function ()
						{
							layer.alert("服务器正忙.....", {icon: 5});
						}
					});

				}

				return false;
			});
			return false;
		});

		table.on('tool(studentTable)', function(obj)
		{
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event;//被点击的按钮

			if(layEvent==="delete")
			{
				layer.confirm('确定要删除'+data.sname+'学生吗？', {title:'温馨提示',icon:'7'}, function(index)
				{
					$.ajax({
						type:'POST',
						url:'<%=path+"student/deleteStudent"%>',
						data:{sid:data.sid},
						success:function(msg)
						{
							if(msg ==="yes")
							{
								layer.alert("删除成功", {icon: 6});
								table.reload('studentTable');
							}
							else
							{
								layer.alert("删除失败，请重试", {icon: 5});
							}
						},
						error:function ()
						{
							layer.alert("服务器正忙.....", {icon: 5});
						}
					});
				});
			}
			else
			{
				layer.prompt({title:'请输入新的姓名'},function(value, index, elem)
				{
					if(value.length<2 || value.length>6)
					{
						layer.alert("请输入2-6位的姓名",{icon:5});
					}
					else
					{
						$.ajax({
							type:'POST',
							url:'<%=path+"student/updateSname"%>',
							data:{sid:data.sid,sname:value},
							success:function(msg)
							{
								if(msg ==="yes")
								{
									layer.alert("修改成功", {icon: 6});
									table.reload('studentTable');
									layer.close(index);
								}
								else
								{
									layer.alert("修改失败，请重试", {icon: 5});
								}
							},
							error:function ()
							{
								layer.alert("服务器正忙.....", {icon: 5});
							}
						});
					}
				});
			}
		});


	});


</script>


</body>
</html>
