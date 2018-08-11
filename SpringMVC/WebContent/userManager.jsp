<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<head>
  <link href="../css/themes/default/easyui.css" rel="stylesheet" type="text/css" />
  <link href="../css/themes/icon.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<script type="text/javascript">
var dataGrid;
$(function(){
	dataGrid = $('#dg').datagrid({
		url : '/SpringMVC/user/getAllUser',
		fit : true,
		fitColumns : false,
		border : false,
		pagination : true,
	    rownumbers:"true",
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		sortName : 'name',
		sortOrder : 'asc',
		checkOnSelect : true,
		selectOnCheck : true,
		loadMsg:'正在加载数据中。。。',
		nowrap : true,
		toolbar:'#toolbar',
		frozenColumns : [ [ {
			field : 'id',
			title : '编号',
			width : 40,
			checkbox : true
		}, {
			field : 'userName',
			title : '用户名称',
			width : 200,
			sortable : true
		} ] ],
		columns : [ [ {
			field : 'pasword',
			title : '用户密码',
			width : 200,
			sortable : true
		} ,{
			field : 'age',
			title : '年龄',
			width : 200,
			sortable : true
			
		},{
			field : 'date',
			title : '出生日期',
			width : 200,
			sortable : true
			
		}] ]
		
	});
});
function newUser(){
	   $('#dlg').dialog('open').dialog('setTitle','增加用户');
	   var fm =  $('#fm');
	   fm.form('clear');
	   url = '/SpringMVC/user/addUser';
	    
}
function editUser(){
	$('#fm').form('clear');
	var row = $('#dg').datagrid('getSelected');
	if (row){
	    $('#dlg').dialog('open').dialog('setTitle','编辑用户');
	    $('#fm').find('input[name="userName"]').val(row.userName);
	    $('#fm').find('input[name="pasword"]').val(row.pasword);
	    $('#fm').find('input[name="age"]').val(row.age);
	    $('#dd').datebox('setValue',row.date);
	    $('#fm').find('input[name="id"]').val(row.id);
	    url = '/SpringMVC/user/updateUser';
	}
}
function destroyUser(){
	 var rows = $('#dg').datagrid('getSelections');
	 var mylist =[];
	    if (rows){
	    	for(var r in rows){
	    		mylist[r]=rows[r].id;
	    	}
	        $.messager.confirm('确认删除','真的要删除所选用户吗？',function(r){
	            if (r){
	                $.post('/SpringMVC/user/delUser',{ids:mylist},function(json){
	                    if (json.result=='success'){
	                    	$.messager.alert('返回信息',json.msg);
	                        $('#dg').datagrid('reload');    // reload the user data
	                        $('#dg').datagrid('clearSelections');
	                       
	                    } else {
	                        $.messager.show({    // show error message
	                            title: 'Error',
	                            msg: json.msg
	                        });
	                    }
	                },'json');
	            }
	        });
	    }
	
}
function saveUser(){
	 $('#fm').form('submit',{
	        url: url,
	        onSubmit: function(){
	            return $(this).form('validate');
	        },
	        success: function(result){
	                $('#dlg').dialog('close');        // close the dialog
	                $('#dg').datagrid('reload');    // reload the user data
	                $('#dg').datagrid('clearSelection');
	        }
	    });
}
function ajaxSaveUser(){
	var user={
	userName:$('#fm').find('input[name="userName"]').val(),
	pasword:$('#fm').find('input[name="pasword"]').val(),
	age:$('#fm').find('input[name="age"]').val(),
	birth:$('#dd').datebox('getValue')
	};
	 $.ajax({
			url: "/SpringMVC/user/ajaxSaveUser",
			type: "POST",
			dataType:'json',
			data:user,
			success: function(json) {
				if(json.result == "ok"){
					$.messager.alert('返回信息',json.msg);
					$('#dlg').dialog('close');        
		            $('#dg').datagrid('reload');    
				} else {
					$.messager.alert('返回信息',json.msg);
				}},
			error: function(er) {
				$.messager.alert('返回信息','服务器错误');} 
		});
}
</script>
</head>
<body>
	
<table id="dg" title="用户信息" class="easyui-datagrid"></table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
</div>
<div id="dlg" class="easyui-dialog" style="width:350px;height:280px;padding:10px"
        closed="true" buttons="#dlg-buttons">
    <div class="ftitle">用户信息</div><br/>
		<form id="fm" method="post">
			<table >
				<tr>
					<td align="right">用户名称：</td>
					<td align="left"><input type="text" name="userName" /></td>
				</tr>
				<tr>
					<td align="right">用户密码：</td>
					<td align="left"><input type="text" name="pasword" /></td>
				</tr>
				<tr>
					<td align="right">用户年龄：</td>
					<td align="left"><input type="text" name="age" /></td>
				</tr>
				<tr>
					<td align="right">出生日期：</td>
					<td align="left"><input type="text" class="easyui-datebox" id="dd" name="birth" /></td>
				</tr>
				
			</table>
			<input type="hidden" name="id"/>
		</form>
	</div>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="ajaxSaveUser()">ajax保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">form保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
</body>
</html>