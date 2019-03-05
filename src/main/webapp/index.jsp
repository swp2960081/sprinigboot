<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script type="text/javascript">
	
	$(function(){
		
		$("#nav a").click(function(){
			var title = $(this).text();
			var url = $(this).attr("url");
			if($('#tt').tabs('exists',title)){//选项页存在
				$('#tt').tabs('select',title);//选中
			}else{
				$('#tt').tabs('add',{
				    title:title,    
				    content:"<iframe src='"+url+"' style='width: 100%;height: 100%' frameborder='0'></iframe>",
				    closable:true 
				});
			}
		});
		
		$('#tt').tabs({
			onSelect:function(title,index){
				var tab = $('#tt').tabs('getSelected');
				var url = $(this).attr("url");
				$("#tt").tabs('update',{
					tab: tab,
					options:{
						href: url
					}
				});
				tab.panel('refresh');
			}
		});
		 
		/* 
		$("#nav").tree({
			url:"menu/queryAll",
			onClick: function(node){// 在用户点击的时候提示
			 	var title = node.text;
				var url = node.attributes.url;
				if(title&&url!=''){
					if($('#tt').tabs('exists',title)){//选项页存在
						$('#tt').tabs('select',title);//选中
					}else{
						$('#tt').tabs('add',{    
						    title:title,    
						    content:"<iframe src='"+url+"' style='width: 100%;height: 100%' frameborder='0'></iframe>",
						    closable:true 
						});
					}
				}
			 }
		})
		

		$('#tt').tabs({
			onSelect:function(title,index){
				var tab = $('#tt').tabs('getSelected');
				var url = $(this).attr("url");
				$("#tt").tabs('update',{
					tab: tab,
					options:{
						href: url
					}
				});
				tab.panel('refresh');
			}
		});
		 */
	});
	 
</script>

</head>
<body>
	<div id="cc" class="easyui-layout" fit="true">   
	    <div data-options="region:'north',split:false,border:false" style="height:100px;">
	    	
	    </div>   
	    <div data-options="region:'south',border:false,split:false" style="height:100px;">
	    	<div style="padding-left: 600px;width: 750px;float: left;padding-top: 30px;font-size: 20px;">
	    		<span style="font-family:cursive;margin: 0 auto;">Copyright &copy;2019 www.entor.com</span>
	    	</div>
	    </div>   
	    <div data-options="region:'west',title:'导航菜单',iconCls:'icon-more',split:false" style="width:150px;">
	    	<ul id="nav">
	    		<p><a href="#" url="user.jsp">用户列表</a></p>
	    		<p><a href="#" url="publicNumber.jsp">公众号列表</a></p>
	    		<p><a href="#" url="userPublicNumber.jsp">公众号与用户绑定表</a></p>
	    		<p><a href="#" url="publicNumberCheck.jsp">公众号审批表</a></p>
	    		<p><a href="#" url="template.jsp">内容模版表</a></p>
	    		<p><a href="#" url="publicNumberTemplate.jsp">公众号模版绑定表</a></p>
	    		<p><a href="#" url="infoContent.jsp">信息内容表</a></p>
	    		<p><a href="#" url="infoContentCheck.jsp">信息内容审核表</a></p>
	    		<p><a href="#" url="publicNumberFans.jsp">公众号粉丝表</a></p>
			</ul>
	    </div>
	    <div data-options="region:'center'">
	    	<div id="tt" class="easyui-tabs" fit="true" border="false">   
			    <div title="欢迎" style="text-align:center;font-size: 20px;">   
			         	欢迎使用XXX系统后台管理界面！ 
			    </div>
			</div>
	    </div>   
	</div>
</body>
</html>