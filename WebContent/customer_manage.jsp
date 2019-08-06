<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户管理</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入easyui的资源文件 -->
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  </head>
  	
  
  <body>
  	<table id="list" title="公司客户管理"></table>
  <!-- 工具条 -->
	<div id="tb">
		<a id="addBtn" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="editBtn" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="deleteBtn" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="findBtn" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true">查询</a>
		<a id="refreshbtn" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true">刷新</a>
	</div>
	
	
  	<!-- 编辑窗口 -->
  	<div id="win" class="easyui-window" title="客户数据编辑" style="width:300px;height:200px;top:0;right:0;left:0;bottom:0;margin:auto"
	data-options="iconCls:'icon-save',modal:true,closed:true" >
	<form id="editForm" method="post">
		<!-- 为id提供一个隐藏域 -->
		<input type="hidden" name="id">
		客户姓名：<input type="text" name="name" class="easyui-validatebox" data-options="required:true"/><br/>
		客户工作：<input type="text" name="work" class="easyui-validatebox" data-options="required:true"/><br/>
		客户手机：<input type="text" name="tel" class="easyui-validatebox" data-options="required:true"/><br/>
		客户邮箱：<input type="text" name="email" class="easyui-validatebox" data-options="required:true"/><br/>
		客户生日：<input type="text" name="birth" class="easyui-validatebox" data-options="required:true"/><br/>
		<a id="saveBtn" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true">保存</a>
	</form>
	</div>
	
	<div id="win1" class="easyui-window" title="ID查询" style="width:300px;height:200px;top:0;right:0;left:0;bottom:0;margin:auto"
	data-options="closed:true">
	<form id="findForm" method="post">
	输入您要查询的客户ID:<input type="text" name="uid" class="easyui-validatebox" data-options="required:true" /><br/>
	<a id="searchBtn" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true">查询</a>
	</form>
	</div>
	
	<div id="win2" class="easyui-window" title="查询结果" style="width:300px;height:200px;top:0;right:0;left:0;bottom:0;margin:auto"
	data-options="closed:true">
	<form id="xianshi" method="post">
	<!-- 为id提供一个隐藏域 -->
	<input type="hidden" name="id">
	客户姓名：<input type="text" name="name" disabled="disabled" value="邓拓"/><br/>
	客户工作：<input type="text" name="work" disabled="disabled" value="学生"/><br/>
	客户手机：<input type="text" name="tel" disabled="disabled" value="15697408854"/><br/>
	客户邮箱：<input type="text" name="email" disabled="disabled" value="dt@163.com"/><br/>
	客户生日：<input type="text" name="birth" disabled="disabled" value="12.10"/><br/>
	</form>
	</div>
 	
  	<script type="text/javascript">
  		$(function(){
  			$("#list").datagrid({
  				//url:后台数据查询的地址
  				url:"customer/list.action",
  				//columns：填充的列数据
  					//field:后台对象的属性
  					//tille:列标题
  				columns:[[
  					{
  						field:"id",
  						title:"客户编号",
  						width:100,
  						checkbox:true
  					},
  					{
  						field:"name",
  						title:"客户姓名",
  						width:200
  					},
  					{
  						field:"work",
  						title:"客户工作",
  						width:200
  					},
  					{
  						field:"tel",
  						title:"客户手机",
  						width:200
  					},
  					{
  						field:"email",
  						title:"客户邮箱",
  						width:200
  					},
  					{
  						field:"birth",
  						title:"客户生日",
  						width:200
  					}
  				]],
  				//工具条
  				toolbar:"#tb"
  			});
  			//打开addBtn，编辑
  	  			$("#addBtn").click(function(){
  	  				//清空表单数据
  		  			$("#editForm").form("clear");
  		  	  		$("#win").window("open");
  	  	  			});
  	  			//保存
  	  			$("#saveBtn").click(function(){
  	  				$("#editForm").form("submit",{
  	  					url:"customer/save.action",
  	  					onSubmit:function(){
  	  						return $("#editForm").form("validate");
  	  					},
  	  					success:function(data){
  	  						data = eval("("+data+")");
  	  						if(data.success){
  	  							$.messager.alert("提示","保存成功","info");
  	  							//保存完自动自动关闭当前窗口
  	  							$("#win").window("close");
  	  							location.reload();//自动刷新页面
  	  						}else{
  	  							$.messager.alert("提示","保存失败"+data.msg,"error");
  	  						}
  	  					}
  	  				})
  	  			});
  	  			//编辑
  	  			$("#editBtn").click(function(){
  	  				var rows = $("#list").datagrid("getSelections");
  	  				if(rows.length!=1){
  	  					$.messager.alert("提示","修改只能选择一行","warning");	
  	  					return;
  	  				}
  	  				//表单回显
  	  				$("#editForm").form("load","customer/findById.action?id="+rows[0].id);
  	  				$("#win").window("open");
  				
  				});
  	  			
  	  			//刷新
  	  			$('#refreshbtn').click(function() {
  	         		 $("#list").datagrid("reload");
  	   	  		 });
  	  			
  	  			
  	  			//删除
  	  			$("#deleteBtn").click(function(){
  	  				var rows =$("#list").datagrid("getSelections");
  	  				if(rows.length==0){
  	  					$.messager.alert("提示","删除操作至少选择一行","warning");
  	  					return;
  	  				}
  	  				
  	  				//格式： id=1&id=2&id=3
  	  				$.messager.confirm("提示","确认删除数据吗?",function(value){
  	  					if(value){
  	  						var idStr = "";
  	  						//遍历数据
  	  						$(rows).each(function(i){
  	  							idStr+=("id="+rows[i].id+"&");
  	  						});
  	  						idStr = idStr.substring(0,idStr.length-1);
  							
  	  						//传递到后台
  	  						$.post("customer/delete.action",idStr,function(data){
  	  							if(data.success){
  	  	  							//刷新datagrid
  	  	  							$("#list").datagrid("reload");
  	  	  							
  	  	  							$.messager.alert("提示","删除成功","info");
  	  	  						}else{
  	  	  							$.messager.alert("提示","删除失败："+data.msg,"error");
  	  	  						}
  	  						},"json");
  	  					}
  	  				});
  	  			});
  	  		
  	  		$("#findBtn").click(function(){
	  				//清空表单数据
		  			$("#findForm").form("clear");
		  	  		$("#win1").window("open");
		  	  	$("#searchBtn").click(function(){
					//表单回显
					//$("#xianshi").form("load","customer/findById.action?id="+$(uid));
					$("#win1").window("close");
					$("#win2").window("open");
  	  			});
	  	  	});
  	  		
  			
  		});
  	
  	</script>
  </body>
</html>
