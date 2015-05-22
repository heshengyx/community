<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>社区网-权限管理</title>
    <link href="${ctx}/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${ctx}/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <script src="${ctx}/js/jquery.dataTables.min.js"></script>
    <script src="${ctx}/js/dataTables.bootstrap.js"></script>
    <script src="${ctx}/js/format.js"></script>
    <script src="${ctx}/js/jquery.ztree.core-3.5.min.js"></script>
    <script src="${ctx}/js/ztree.js"></script>
    <script type="text/javascript">
    var table;
    var zNodes =[];
    /* var zNodes =[
 		{id:"7ac66e14d40d87f978000", pId:"0", name:"[core] 基本功能 演示", open:true},
 		{id:"e78fc614ce459cc168002", pId:"7ac66e14d40d87f978000", name:"最简单的树 --  标准 JSON 数据"},
 		{id:"e78fc614ce459cc168003", pId:"7ac66e14d40d87f978000", name:"最简单的树 --  简单 JSON 数据"}
 	]; */
    $(document).ready(function() {
    	
    	var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
    	table = $('#table-list').DataTable({
    		"language": {
                "lengthMenu": "每页 _MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "search": "搜索",
                "paginate": {
			         "first":    "第一页",
			         "previous": "上一页 ",
			         "next":     "下一页 ",
			         "last":     "最后一页 "
			     }
            },
            "dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
    		"pagingType":  "full_numbers",
    		"processing": true,
            "serverSide": true,
			"ajax": {
				"url": "${ctx}/manage/permission/list",
				"type": "POST"
			},
			"order": [[ 4, "desc" ]],
			"columnDefs": [
			    {
			    	"searchable": false,
			    	"orderable": false,
		            "render": function(data, type, row) {
		            	var content = "<input type='checkbox' name='checkList' value='" + data.id + "'>";
				        return content;
		            },
		            "targets": [0]
	            },
	            {
	            	"render": function(data, type, row) {
		                var content = "";
		            	if (data == "1") {
		            		content += "<span class=\"label label-success\">Active</span>";
		            	} else {
		            		content += "<span class=\"label label-important\">Banned</span>";
		            	}
		            	return content;
		            },
		            "targets": [3]
	            },
	            {
	            	"render": function(data, type, row) {
		            	return to_date_hms(data.createTime);
		            },
		            "targets": [4]
	            },
	            {
	            	"searchable": false,
			    	"orderable": false,
	            	"render": function(data, type, row) {
		                var content = "";
		                content += "<a href=\"javascript:void(0);\" onclick=\"editData('" + data.id + "')\">编辑</a>&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"deleteData('" + data.id + "')\">删除</a>";
		            	return content;
		            },
		            "targets": [5]
	            }
			],
			"columns": [
	            { "data": null},
	            /* { "data": "id"}, */
	            { "data": "name" },
	            { "data": "url" },
	            { "data": "status" },
	            { "data": null },
	            { "data": null }
	        ],
	        initComplete: function () {
                $("#mytool").append('<button type="button" id="add-btn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">新增</button>');
                $("#add-btn").on("click", clear);
            }
    	});
    	$("#save-btn").click(saveData);
    	/* $("#add-btn").click(function() {
    		$("#myModalLabel").text("新增楼盘");
    		clear();
    	}); */
     	/* t.on('order.dt search.dt',
    		    function() {
    		        t.column(1, {
    		            search: 'applied',
    		            order: 'applied'
    		        }).nodes().each(function(cell, i) {
    		            cell.innerHTML = i + 1;
    		        });
    	}).draw(); */
    });
    function saveData() {
    	var jsonData = {
    		"dataId": $("#dataId").val(),
            "name": $("#inputName").val(),
            "url": $("#inputUrl").val(),
            "status": $("input[name='status']:checked").val()
        };
    	saveJsonData(jsonData);
    }
    function saveJsonData(obj) {
    	var url = "${ctx}/manage/permission/save";
    	if (obj.dataId) {
    		url = "${ctx}/manage/permission/update";
    	}
        $.ajax({
            url: url,
            data: {
            	"id": obj.dataId,
                "name": obj.name,
                "url": obj.url,
                "status": obj.status
            }, success: function (data) {
                table.ajax.reload();
                $("#myModal").modal("hide");
                clear();
            }
        });
    }
    /**
     * 编辑数据
     */
    function editData(id) {
        $.ajax({
            url: "${ctx}/manage/province/getData",
            dataType : "json",
            data: {
                "id": id
            }, success: function (data) { //dataId
            	$("#inputDataId").val(data.data.id);
            	$("#inputBuildingName").val(data.data.buildingName);
            	$("#inputBuildingYear").val(data.data.buildingYear);
            	$("#inputBuildingFloor").val(data.data.buildingFloor);
            	$("#myModalLabel").text("修改权限");
            	$("#myModal").modal("show");
            }
        });
    }
    /**
     * 删除数据
     */
    function deleteData(id) {
        $.ajax({
            url: "${ctx}/manage/province/delete",
            data: {
                "id": id
            }, success: function (data) {
                table.ajax.reload();
            }
        });
    }
    /**
     * 清除
     */
    function clear() {
    	$("#myModalLabel").text("新增权限");
    	$("#inputDataId").val("");
        $("#inputName").val("");
        $("#inputCode").val("");
        //$("#inputStatus1").val("");
    }
    </script>
  </head>
  <body>
	<div class="box-content">
		<table class="table table-striped table-bordered" id="table-list">
		  <thead>
			  <tr>
			  	  <th style="width:10px"><input type="checkbox" id='checkAll'></th>
				  <th>权限名称</th>
				  <th>URL</th>
				  <th>状态</th>
				  <th>创建时间</th>
				  <th>操作</th>
			  </tr>
		  </thead>
		  <tbody></tbody>
	   </table>
	   
	   <!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
		                        aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title" id="myModalLabel">新增权限</h4>
		                <input type="hidden" id="inputDataId">
		            </div>
		            <div class="modal-body">
		            	<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
		            	<form class="form-horizontal" role="form">
		                <div class="form-group">
		                	<label for="inputName" class="col-sm-2 control-label">权限名称</label>
		                	<div class="col-sm-10">
		                	<input type="text" class="form-control" id="inputName">
		                	</div>
		                </div>
		                <div class="form-group">
		                	<label for="inputUrl" class="col-sm-2 control-label">权限URL</label>
		                	<div class="col-sm-10">
		                	<input type="text" class="form-control" id="inputUrl">
		                	</div>
		                </div>
		                <div class="form-group">
		                	<label for="inputStatus" class="col-sm-2 control-label">状态</label>
		                	<div class="col-sm-10">
		                	<div class="btn-group" data-toggle="buttons">
							   <label class="btn btn-primary">
							      <input type="radio" name="status" value="1"> 有效
							   </label>
							   <label class="btn btn-primary">
							      <input type="radio" name="status" value="0"> 禁用
							   </label>
							</div>
		                	</div>
		                </div>
		                </form>		                
		            </div>
		            <div class="modal-footer">
		            	<button type="button" class="btn btn-primary" id="save-btn">保存</button>
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		    </div>
		</div><!-- Modal -->         
	</div>
  </body>
</html>