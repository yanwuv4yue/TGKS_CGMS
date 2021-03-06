<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#loveLiveReq{border:0px solid;}
#loveLiveReq td{border:0px solid;}
#loveLiveReq input{width:120px;}
#loveLiveReq select{width:120px;}
</style>
<input type="hidden" id="loveLiveManagerSubmit" name="loveLiveManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="loveLiveReq" action="../cgms/queryLoveLive.action" method="post">
		<table>
			<tr>
				<td><label>编号: </label></td><td><input type="text" name="loveLiveReq.cardId" /></td>
				<td>角色: </td>
				<td>
					<select name="loveLiveReq.girl">
						<option value="">全部</option>
						<option value="Ayase Eli">絢瀬 絵里</option>
						<option value="Hoshizora Rin">星空 凛</option>
						<option value="Koizumi Hanayo">小泉 花陽</option>
						<option value="Kousaka Honoka">高坂 穂乃果</option>
						<option value="Minami Kotori">南 ことり</option>
						<option value="Nishikino Maki">西木野 真姫</option>
						<option value="Sonoda Umi">園田 海未</option>
						<option value="Toujou Nozomi">東條 希</option>
						<option value="Yazawa Nico">矢澤 にこ</option>
					</select>
				</td>
				<td>稀有度: </td>
				<td>
					<select name="loveLiveReq.rarity">
						<option value="">全部</option>
						<option value="UR">UR</option>
						<option value="SR">SR</option>
						<option value="R">R</option>
					</select>
				</td>
				<td>类型: </td>
				<td>
					<select name="loveLiveReq.type">
						<option value="">全部</option>
						<option value="Smile">Smile</option>
						<option value="Pure">Pure</option>
						<option value="Cool">Cool</option>
						<option value="All">All</option>
					</select>
				</td>
				<td>
				<button id="clearLoveLive">重置</button>
				<button id="queryLoveLive">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addLoveLive">新增</button>
<button id="deleteLoveLive">删除</button>

<div id="loveLiveDiv"></div>

<div id="loveLiveEdit" title="LoveLive Edit">
	<form id="loveLiveForm" action="../cgms/editLoveLive.action" method="post"></form>
</div>

<div id="loveLiveConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../cgms/queryLoveLive.action",async:false});
	$("#loveLiveDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../cgms/queryLoveLive.action", data:$("#loveLiveReq").formSerialize(), async:false});
		$("#loveLiveDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#loveLiveEdit" ).dialog({
		modal: true,
		height:800,
		width:800,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				// 页面校验
				if (!loveLiveFormCheck())
				{
					return false;
				}
				var form = $("#loveLiveForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#loveLiveManagerSubmit").val("0");
				$("#loveLiveEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#loveLiveForm").submit(function()
	{
		if ($("#loveLiveManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#loveLiveManagerSubmit").val("0");
		
		var options = { 
			url:"../cgms/editLoveLive.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#loveLiveEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#loveLiveEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#loveLiveForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addLoveLive" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#loveLiveManagerSubmit").val("1");
		$( "#loveLiveEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../cgms/editLoveLivePage.action",async:false});
		$("#loveLiveForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteLoveLive" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#loveLiveManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("loveLiveId");
		for (var i=0; i<array.length; i++)
	   	{
	   		if (array[i].checked)
  			{
	   			if (ids == "")
   				{
	   				ids += array[i].value;
   				}
	   			else
	   			{
	   				ids += "," + array[i].value;
	   			}
  			}
	   	}
		
		// 操作验证
		if (ids == "")
		{
			alert("请选择至少一条记录");
			$("#loveLiveManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../cgms/deleteLoveLive.action?ids=" + ids , // 提交给哪个执行
			type:'POST', 
			success: function(){
				alert("删除成功");
				// 执行成功刷新form
				query();
			},
			error:function(){ 
				alert("删除失败"); 
			}
		};
		
		// 确认操作
		$("#loveLiveConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#loveLiveConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onLoveLive" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#loveLiveManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("loveLiveId");
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#loveLiveManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusLoveLive.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#loveLiveConfirm").ajaxSubmit(options);
			$("#loveLiveManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offLoveLive" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#loveLiveManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("loveLiveId");
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#loveLiveManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../cgms/changeStatusLoveLive.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#loveLiveConfirm").ajaxSubmit(options);
			$("#loveLiveManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryLoveLive" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearLoveLive" ).button().click(function() {
			$("#loveLiveReq").clearForm();
		return false;
	});
	
	// 页面校验
	function loveLiveFormCheck()
	{
		return true;
	}
});
</script>
