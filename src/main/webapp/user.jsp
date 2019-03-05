<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息列表</title>	

<style type="text/css">
	.right{
		text-align: right;
	}
</style>

<script type="text/javascript">

	var url = "";

	
	//将表单数据转为json
	function form2Json(id) {
	
	    var arr = $("#" + id).serializeArray();
	    var jsonStr = "";
	
	   	jsonStr += '{';
	    for (var i = 0; i < arr.length; i++) {
	        jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
	    }
	    jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
	    jsonStr += '}'
	
	    var json = JSON.parse(jsonStr);
	    return json;
	}

	$(function(){

		//点击搜索
		$("#search_btn").click(function() {
		    $('#dg').datagrid({ 
		    	queryParams: form2Json("searchForm")//查询参数
		    });
	    });
		
		//点击导入
		$("#import_btn").click(function() {
			var filename = $("#file").filebox("getText");
			if(filename==""){
				$.messager.alert("提示","请选择需要导入的文件！","info");
				return;
			} else{
				url = "userServlet?opType=importFile";
				importFile();
			}
	    });
		
		//点击导出
		$("#export_btn").click(function() {
			$.messager.confirm('确认对话框', '确认下载?', function(r){
				if (r){
					url = "userServlet?opType=exportFile&filename=user.xls";
					exportFile();
					/* 
					$("#export_btn").attr("href",url);
					$('#export_btn').linkbutton('click');
					 */
				}
			});
	    });
		
		$("#dg").datagrid({
			idField:"id",
			url:'user/queryByPage',
			fitColumns:true,
			striped:true,
			pagination:true,
			rownumbers:true,
			singleSelect:false,
			scrollbarSize:0,
			pageSize:30,
			//queryParams: form2Json("searchForm"),//查询参数
			pageList:[1,10,20,30,40],
			columns:[[
				{field:'',checkbox:true},
				{field:'id',width:100,align:'center',title:'编号',sortable:false,hidden:false},
				{field:'username',width:100,align:'center',title:'帐号'},
				{field:'password',width:100,align:'center',title:'密码'},
				{field:'name',width:100,align:'center',title:'姓名'},
				{field:'sex',width:100,align:'center',title:'性别',formatter:function(value,row,index){
					if(value==1){
						return "男";
					}else{
						return "女";
					}
				}},
				{field:'phone',width:100,align:'center',title:'联系方式'},
				{field:'address',width:100,align:'center',title:'联系地址'},
				{field:'email',width:100,align:'center',title:'邮箱'},
				{field:'photo',width:100,align:'center',title:'用户头像'},
				{field:'createTime',width:100,align:'center',title:'创建时间'},
				{field:'role',width:100,align:'center',title:'所属角色',formatter:function(value,row,index){
					if(value==1){
						return "管理员";
					}else if(value==2){
						return "公众号运营";
					}else{
						return "营业员";
					}
				}}
			]],
			toolbar:[{
				text:"新增",
				iconCls:"icon-add",
				handler:function(){
					add();
				}
			},{
				text:"编辑",
				iconCls:"icon-edit",
				handler:function(){
					update();
				}
			},{
				text:"删除",
				iconCls:"icon-remove",
				handler:function(){
					remove();
				}
			},{
				text:"绑定公众号",
				iconCls:"icon-remove",
				handler:function(){
					savePublic();
				}
			}]
	
		})
		
		$("#savePublic").datagrid({
			idField:"id",
			url:"publicNumber/queryByPage",
			fitColumns:true,
			striped:true,
			pagination:true,
			rownumbers:true,
			singleSelect:false,
			scrollbarSize:0,
			pageSize:10,
			columns:[[
				{field:"",checkbox:true},
				{field:"id",title:"编号",width:100,align:"center"},
				{field:"publicId",title:"公众号帐号",width:100,align:"center"},
				{field:"publicName",title:"公众号昵称",width:100,align:"center"}
			]]
		})
	})
	
	$.extend($.fn.validatebox.defaults.rules, {    
	    equals: {    
	        validator: function(value,param){    
	            return value == $(param[0]).val();    
	        },
	        message: '两次输入的密码不一致！'   
	    },
	    age: {    
	        validator: function(value,param){    
	            return value>=param[0] && value<=param[1];    
	        },    
	        message: '年龄范围在{0}到{1}之间！'
	    },
	    fileType: {    
	        validator: function(value,param){    
	            return value.substring(value.lastIndexOf("."))==param[0];    
	        },    
	        message: '要求文件类型为{0}'
	    },
	    photoType: {    
	        validator: function(value,param){    
	            return value.substring(value.lastIndexOf("."))==param[0]
	            	|| value.substring(value.lastIndexOf("."))==param[1]
            		|| value.substring(value.lastIndexOf("."))==param[2];    
	        },    
	        message: '要求图片格式为{0}或{1}或{2}'
	    }
	});
	
	function remove() {
		var array = $("#dg").datagrid("getSelections");
		if (array==0) {
			$.messager.alert("提示","请选择要删除的选项！","info");
			return;
		}
		$.messager.confirm("提示","请确定要删除所选的【"+array.length+"】条记录吗？",function(yes){
			if(yes){
				var ids = "";
				for (var i = 0; i < array.length; i++) {
					ids += array[i].id+",";
				}
				ids = ids.substring(0,ids.length-1);
				$.ajax({
					url:"user/deleteMore?ids="+ids,
					type:"post",
					data:"ids="+ids,
					dataType:"json",
					success:function(result){
						if(result.state==0){
							$.messager.alert("提示",result.msg,"info");
						}else{
							$.messager.alert("提示",result.msg,"error");
						}
						//刷新表格
						$("#dg").datagrid("reload");
						//清除所有选择的行。
						$("#dg").datagrid("clearSelections");
					}
				})
			}
		})
	}
	
	//绑定公众号
	function savePublic() {
		var array = $("#dg").datagrid("getSelections");
		if(array.length==0){
			$.messager.alert("提示","请选择要绑定公众号的用户！","info");
			return;
		}
		var uid = "";
		for (var i = 0; i < array.length; i++) {
			uid += array[i].id + ",";
		}
		uid = uid.substring(0,uid.length-1);
		url = "publicNumber/getOwnerPublicNumbers";
		openSavePublicDialog(uid);
		//$("#dr").dialog("setTitle","绑定公众号");
	}
	
	//打开绑定公众号窗口
	function openSavePublicDialog(uid) {
		$.ajax({
			url:url,
			type:"post",
			data:"uids="+uid,
			dataType:"json",
			success:function(result){
				
				$("#dr").dialog({
					title:"绑定公众号",
					modal:true,
					buttons:[{
						text:"确认",
						iconCls:"icon-save",
						handler:function(){
							savePublicNumber(uid);
						}
					},{
						text:"取消",
						iconCls:"icon-cancel",
						handler:function(){
							$("#dr").dialog("close");
						}
					}]
				})
				//清除之前选择的所有行
				$("#savePublic").datagrid("clearSelections");
				for(var i=0;i<result.length;i++){
					//根据后台返回的角色id，设置列表框默认选中状态
					$("#savePublic").datagrid("selectRecord",result[i].id);
				}
				$("#savePublic").datagrid("getSelections");
				//打开对话框
				$("#dr").dialog("open");
			}
		});
		
	}
	
	//保存绑定的公众号
	function savePublicNumber(uid){
		var array = $("#savePublic").datagrid("getSelections");
		if(array.length==0){
			$.messager.alert("提示","请选择公众号！","info");
			return;
		}
		//公众号的编号Id
		var pid = "";
		for(var i=0;i<array.length;i++){
			pid += array[i].id + ",";
		}
		pid = pid.substring(0,pid.length-1);
		$.ajax({
			url:"publicNumberCheck/savePublicNumberCheck",
			type:"post",
			data:"uids="+uid+"&pids="+pid,
			dataType:"json",
			success:function(result){
				if(result.state==0){
					$.messager.alert("提示",result.msg,"info");
				}else{
					$.messager.alert("提示",result.msg,"error");
				}
				//清除之前选择的所有行
				$("#savePublic").datagrid("clearSelections");
				//清除所有选择的行。
				$("#dg").datagrid("clearSelections");
				//关闭对话框
				$("#dr").dialog("close");
			}
		});
	}
	
	//点击新增
	function add() {
		//清除所有选择的行。
		$("#dg").datagrid("clearSelections");
		$("#Form").form("reset");
		url = "user/add";
		openDialogForm();
		$("#dd").dialog("setTitle","新增用户信息");
	}
	
	//点击编辑
	function update() {
		var array = $("#dg").datagrid("getSelections");
		if(array.length==0){
			$.messager.alert("提示","请选择要修改的选项！","info");
			return;
		}else if(array.length>1){
			$.messager.alert("提示","单次只能对一条信息进行修改！","info");
			return;
		}
		$("#Form").form("reset");
		$("#Form").form("load",array[0]);
		url = "user/update?id="+array[0].id;
		openDialogForm();
		$("#dd").dialog("setTitle","修改用户信息");
		//$("#pwd").textbox("disable");
		//$("#rpwd").textbox("disable");
	}
	
	//打开 新增、编辑 对话框窗口
	function openDialogForm() {
		$("#dd").dialog({
			modal:true,
			buttons:[{
				text:"保存",
				iconCls:"icon-save",
				handler:function(){
					save();
				}
			},{
				text:"重置",
				iconCls:"icon-reload",
				handler:function(){
					var array = $("#dg").datagrid("getSelections");
					if (array.length==0) {
						$("#Form").form("reset");
					}
					if (array.length==1) {
						$("#Form").form("load",array[0]);
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					$("#dd").dialog("close");
				}
			}]
		})
		$("#dd").dialog("open");
	}
	
	//保存
	function save() {
		$("#Form").form("submit",{
			url:url,
			success:function(result){
				
				//将传来的json字符串转换为json对象	
				//var result = eval("("+result+")");
				var result = JSON.parse(result);
				
				if(result.state==0){
					$.messager.alert("提示",result.msg,"info");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("提示",result.msg,"error");
				}
				//关闭表单
				$("#dd").dialog("close");
			}
		})
	}
	

	//导入方法
	function importFile() {
		$("#searchForm").form("submit",{
			url:url,
			success:function(result){
				$.messager.alert("提示","导入成功","info");
				
				//刷新表格
				$("#dg").datagrid("reload");
			}
		})
	}
	
	//导出方法
	function exportFile() {
		$("#searchForm").form("submit",{
			url:url,
			success:function(result){
				
			}
		})
	}
	
</script>
    
</head>
<body>
<!-- 
	<div style="height: 5%;">
		<form id="searchForm" method="post" style="padding-top: 4px;" enctype="multipart/form-data">
			姓&emsp;名：<input name="qname" class="easyui-textbox" data-options="iconCls:'icon-man'">&emsp;
			帐&emsp;号：<input name="qusername" class="easyui-textbox" data-options="iconCls:'icon-man'">&emsp;
			性&emsp;别：<select name="qsex" class="easyui-combobox">
							<option value="-1">--请选择--</option>
							<option value="1">男</option>
							<option value="0">女</option>
						</select>&emsp;
			开始日期：<input name="qbeginDate" class="easyui-datebox" data-options="editable:false">&emsp;
			结束日期：<input name="qendDate" class="easyui-datebox" data-options="editable:false">
			<a id="search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>&emsp;
			<input id="file" name="file" class="easyui-filebox" style="width:200px" data-options="buttonText: '选择文件',validType:'fileType[\'.xls\']'">
			<a id="import_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">导入</a>
			<a id="export_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-print'">导出</a> 
		</form>
	</div>
 -->
	<div style="height: 95%;">
		<table id="dg" fit="true"></table>
	</div>
	
	<div id="dr" class="easyui-dialog" style="width: 400px;height: 400px;" closed="true">
		<form id="savePublic" fit="true" method="post">
		
		</form>
	</div>
	
	<div id="dd" class="easyui-dialog" style="width: 500px;" closed="true">
		<form id="Form" method="post">
			<table style="margin: 0 auto;">
				<tr>
					<td class="right">帐号：</td>
					<td><input name="username" class="easyui-textbox" data-options="required:true"></td>
				</tr>
				<tr>
					<td class="right">密码：</td>
					<td><input type="password" id="pwd" name="password" class="easyui-textbox" data-options="required:true,validType:'length[6,20]'"></td>
				</tr>
				<!-- 
				<tr>
					<td class="right">确认密码：</td>
					<td><input type="password" id="rpwd" name="rpwd" class="easyui-textbox" data-options="required:true,validType:'equals[\'#pwd\']'"></td>
				</tr>
				 -->
				<tr>
					<td class="right">姓名：</td>
					<td><input name="name" class="easyui-textbox" data-options="required:true"></td>
				</tr>
				<tr>
					<td class="right">性别：</td>
					<td><input type="radio" name="sex" value="1" checked="checked">男&emsp;&emsp;<input type="radio" name="sex" value="0">女</td>
				</tr>
				<tr>
					<td class="right">联系方式：</td>
					<td><input name="phone" class="easyui-numberbox" data-options="required:true,validType:'length[7,16]'"></td>
				</tr>
				<tr>
					<td class="right">联系地址：</td>
					<td><input name="address" class="easyui-textbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<td class="right">邮箱：</td>
					<td><input name="email" class="easyui-textbox" data-options="required:true,validType:'email'"></td>
				</tr>
				<tr>
					<td class="right">头像：</td>
					<td><input id="file" name="photo" class="easyui-filebox" style="width:200px" data-options="buttonText: '选择图片',validType:'photoType[\'.jpg\',\'.png\',\'.jpeg\']'"></td>
					<!-- <td><input name="photo" class="easyui-textbox" data-options="required:true" /></td> -->
				</tr>
				<tr>
					<td class="right">所属角色：</td>
					<td><input type="radio" name="role" value="1" checked="checked">管理员<br/>
						<input type="radio" name="role" value="2">公众号运营<br/>
						<input type="radio" name="role" value="3">营业员</td>
				</tr>
			</table>
		</form>
	</div>
</table> 
</body>
</html>