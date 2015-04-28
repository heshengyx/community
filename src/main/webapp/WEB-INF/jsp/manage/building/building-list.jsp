<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>社区网-楼盘管理</title>
    <script type="text/javascript">
    $(document).ready(function() {
    	initModal();
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
			"bProcessing": true,
			"bServerSide": true,
			"sServerMethod" : "POST",
			"sDom": "<'row-fluid'<'span6 myBtnBox'><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
			"sPaginationType": "bootstrap",
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
			"sAjaxSource": "${ctx}/manage/building/list",
			"aoColumnDefs": [
				{
			 		sDefaultContent: '',
			 		aTargets: [ '_all' ]
			  	}
			],
			//"bJQueryUI": true,
			"aoColumns": [
				{
				    "mDataProp": "id",
				    "fnRender": function(data) {
				    	var content = "<input type='checkbox' name='checkList' value='" + data.aData.id + "'>";
				        return content;
				    }
				},
				{ "mDataProp": "buildingName"},
	            { "mDataProp": "buildingYear"},
	            { "mDataProp": "buildingFloor"},
	            { "mDataProp": "status", "fnRender": function(data) {
	            	var content = "";
	            	if (data.aData.status == "1") {
	            		content += "<span class=\"label label-success\">Active</span>";
	            	} else {
	            		content += "<span class=\"label label-important\">Banned</span>";
	            	}
	            	return content;
	            }},
	            { "asSorting": [], "fnRender": function(data) {
	            	var content = "";
	            	content += "<a class=\"btn btn-success\" href=\"#\">";
	            	content += "<i class=\"halflings-icon white zoom-in\"></i>";
	            	content += "</a>";
	            	content += "<a class=\"btn btn-info\" href=\"#\">";
	            	content += "<i class=\"halflings-icon white edit\"></i>";
	            	content += "</a>";
	            	content += "<a class=\"btn btn-danger\" href=\"#\">";
	            	content += "<i class=\"halflings-icon white trash\"></i>";
	            	content += "</a>";
		            return content;
		        }}
	        ],
	        "fnInitComplete": function (oSettings, json) {
	            $('<a href="#myModal" id="addFun" class="btn btn-primary" data-toggle="modal">新增</a>' + '&nbsp;' +
	            '<a href="#" class="btn btn-primary" id="editFun">修改</a> ' + '&nbsp;' +
	            '<a href="#" class="btn btn-danger" id="deleteFun">删除</a>' + '&nbsp;').appendTo($('.myBtnBox'));
	            $("#addFun").click(_init);
	        }
    	});
    });
    /**
	 * 初始化弹出层
	 */
	function initModal() {
	    $('#myModal').on('show', function () {
	        $('body', document).addClass('modal-open');
	        $('<div class="modal-backdrop fade in"></div>').appendTo($('body', document));
	    });
	    $('#myModal').on('hide', function () {
	        $('body', document).removeClass('modal-open');
	        $('div.modal-backdrop').remove();
	    });
	}
	/**
	 * 初始化
	 * @private
	 */
	function _init() {
	    resetFrom();
	    $("#btnEdit").hide();
	    $("#btnSave").show();
	}
	/**
	 * 重置表单
	 */
	function resetFrom() {
	    $('form').each(function (index) {
	        $('form')[index].reset();
	    });
	}
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
						  <thead>
							  <tr>
							  	  <th style="width:15px"><input type="checkbox" id='checkAll'></th>
								  <th>楼盘名称</th>
								  <th>建筑年代</th>
								  <th>楼层</th>
								  <th>状态</th>
								  <th>操作</th>
							  </tr>
						  </thead> 
					   </table>           
					</div>
				</div><!--/span-->
				<!-- modal -->
				<div id="myModal" class="modal hide fade" data-backdrop="false">
			        <div class="modal-header">
			            <button type="button" class="close" data-dismiss="modal"
			                    aria-hidden="true">×
			            </button>
			            <h3 id="myModalLabel">用户信息</h3>
			        </div>
			        <div class="modal-body">
			            <form class="form-horizontal" id="resForm">
			                <input type="hidden" id="objectId"/>
			                <div class="control-group">
			                    <label class="control-label" for="inputName">昵称：</label> <input
			                        type="text" id="inputName" name="name"/>
			                </div>
			                <div class="control-group">
			                    <label class="control-label" for="inputJob">技能：</label> <input
			                        type="text" id="inputJob" name="job"/>
			                </div>
			                <div class="control-group">
			                    <label class="control-label" for="inputNote">备注：</label>
			                    <textarea name="note" id="inputNote" cols="30" rows="4"></textarea>
			                </div>
			            </form>
			        </div>
			        <div class="modal-footer">
			            <button class="btn btn-primary" id="btnSave">确定</button>
			            <button class="btn btn-primary" id="btnEdit">保存</button>
			            <button class="btn btn-danger" data-dismiss="modal"
			                    aria-hidden="true">取消
			            </button>
			        </div>
			    </div><!-- modal -->
			</div><!--/row-->
	</div><!--/.fluid-container-->
	</body>
</html>