<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>社区网-楼盘管理</title>
    <script type="text/javascript">
    $(document).ready(function() {
    	//$('#table-list').dataTable();
    	$('#table-list').dataTable({
    		"oLanguage": {
			     "sLengthMenu": "每页显示 _MENU_ 条记录",
			     "sZeroRecords": "对不起，查询不到任何相关数据",
			     "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
			     "sInfoEmtpy": "找不到相关数据",
			     "sInfoFiltered": "数据表中共为 _MAX_ 条记录)",
			     "sProcessing": "正在加载中...",
			     "sSearch": "搜索",
			     "sUrl": "", //多语言配置文件，可将oLanguage的设置放在一个txt文件中，例：Javascript/datatable/dtCH.txt
			     "oPaginate": {
			         "sFirst":    "第一页",
			         "sPrevious": "上一页 ",
			         "sNext":     "下一页 ",
			         "sLast":     "最后一页 "
			     }
			},
			//"bProcessing": true,
			//"bServerSide": true,
			//"sServerMethod" : "POST",
			//"sPaginationType": "full_numbers",
			/* "fnServerData": function ( sSource, aoData, fnCallback ) {
	            $.ajax( {
	                "dataType": 'json',
	                "type": "POST",
	                "url": sSource,
	                "data": aoData,
	                "success": fnCallback
	            } );
	        }, */
			//"sAjaxSource": "${ctx}/manage/building/list",
			"aoColumnDefs": [
				{
			 		sDefaultContent: '',
			 		aTargets: [ '_all' ]
			  	}
			],
			"iTotalRecords": 50,
		    "iTotalDisplayRecords": 10,
		    "sEcho":10,
		    "aaData": [
		        {"name": "Sitepoint", "url": "http://sitepoint.com", "editor" :{ "name" : "John Doe", "phone" : ["9191919", "1212121"], "email":[]}},
		        {"name": "Flippa", "url": "http://flippa.com",  "editor": { "name": "Adam Smith", "email" : ["adam.smith@domain.com"], "phone":[] }}
		    ],
			/* "aoColumns": [
				{ "sTitle": "楼盘名称", "mData": "buildingName" },
	            { "sTitle": "建筑年代" },
	            { "sTitle": "楼层" },
	            { "sTitle": "状态" },
	            { "sTitle": "操作"}
	        ] */
	        "aoColumns": [{
	            "mData":"name",
	            "sTitle": "Site name"
	          },{
	            "mData": "url",
	            "mRender": function ( url, type, full )  {
	              return  '<a href="'+url+'">' + url + '</a>';
	            }
	          },{
	            "mData": "editor.name"
	          },{
	            "mData": "editor.phone"
	          },{
	            "mData":"editor",
	            "mRender": function(data){
	              return data.email.join("<br>");
	            }
	        }]
    	});
    });
    </script>
  </head>
  <body>
	<div id="content" class="span10">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Tables</a></li>
			</ul>

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>楼盘列表</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered" id="table-list">
						  <tbody>
							<tr>
								<td colspan="5">Loading data from server</td>
							</tr>
				          </tbody>   
					   </table>           
					</div>
				</div><!--/span-->
			</div><!--/row-->
	</div><!--/.fluid-container-->
	</body>
</html>