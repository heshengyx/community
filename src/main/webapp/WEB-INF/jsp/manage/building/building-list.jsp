<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>社区网-楼盘管理</title>
    <link href="${ctx}/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${ctx}/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <script src="${ctx}/js/jquery.dataTables.min.js"></script>
    <script src="${ctx}/js/dataTables.bootstrap.js"></script>
    <script src="${ctx}/js/format.js"></script>
    <script src="${ctx}/js/bootstrap-typeahead.js"></script>
    <script src="${ctx}/js/bootstrap-datepicker.min.js"></script>
    <script src="${ctx}/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <script type="text/javascript">
    var table;
    $(document).ready(function() {
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
            //"dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
            "dom": "<'toolbar'>rt<'bottom'<'row'<'col-xs-2'i><'col-xs-2'l><'col-xs-8'p>><'clear'>>",
            //"dom": '<"toolbar">rt<"bottom"ilp<"clear">>',
    		"pagingType":  "full_numbers",
    		//"scrollX": "100%",
    		//"scrollXInner": "100%",
    		"filter": true, 
    		"processing": true,
            "serverSide": true,
            //"serverData": serverData,
			"ajax": {
				"url": "${ctx}/manage/building/list",
				"type": "POST"
			},
			"order": [[ 3, "desc" ]],
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
	            /* {
			    	"searchable": false,
			    	"orderable": false,
		            "targets": [1]
	            }, */
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
		            "targets": [4]
	            },
	            {
	            	"render": function(data, type, row) {
		            	return to_date_hms(data.createTime);
		            },
		            "targets": [5]
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
		            "targets": [6]
	            }
			],
			"columns": [
	            { "data": null},
	            /* { "data": "id"}, */
	            { "data": "buildingName" },
	            { "data": "buildingYear" },
	            { "data": "buildingFloor" },
	            { "data": "status" },
	            { "data": null },
	            { "data": null }
	        ],
	        initComplete: function () {
                //$("#mytool").append('<button type="button" id="add-btn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">新增</button>');
                $("#add-btn").on("click", clear);
            }
    	});
    	//$("div.toolbar").html('<b>Custom tool bar! Text/images etc.');
    	$("#save-btn").click(saveData);
    	$("#search-btn").click(function() {
    		/* $.ajax({
	            url: "${ctx}/manage/building/list",
	            dataType : "json",
	            type: "POST",
	            data: {
	            	"draw": 1,
	            	"length": 10,
	                "buildingName": $("#s-inputBuildingName").val()
	            }, success: function (data) { //dataId
	            	table.draw();
	            	//table.clearTable();
	            	//alert(data);
	            	table.addData(data.data);
	            }
	        }); */
	        var search = "?";
	        search += "buildingName=" + $("#s-inputBuildingName").val();
	        search += "&startDate=" + $("#s-inputStartDate").val();
	        search += "&endDate=" + $("#s-inputEndDate").val();
    		table.ajax.url("${ctx}/manage/building/list" + search).load();
    	});
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
    	//var mySource = [{"id":"5c63dc14d03dec2f97ffc","status":"1","updateTime":null,"createTime":1430289198492,"remarks":null,"buildingName":"??????","buildingYear":"2010","buildingFloor":"36"},{"id":"b492d714d03dec2f97ffd","status":"1","updateTime":null,"createTime":1430289164436,"remarks":null,"buildingName":"??????","buildingYear":"2011","buildingFloor":"26"},{"id":"7f159014d03dec2f97ffe","status":"1","updateTime":null,"createTime":1430289133261,"remarks":null,"buildingName":"??????","buildingYear":"2013","buildingFloor":"12"},{"id":"b5f35014d03dec2f97fff","status":"1","updateTime":null,"createTime":1430289097555,"remarks":null,"buildingName":"??????","buildingYear":"2010","buildingFloor":"31"},{"id":"9ad91214d03dec2f98000","status":"1","updateTime":null,"createTime":1430289040121,"remarks":null,"buildingName":"??????","buildingYear":"2001","buildingFloor":"30"},{"id":"9c7caa14d034886388000","status":"1","updateTime":null,"createTime":1430279194168,"remarks":null,"buildingName":"??????","buildingYear":"2012","buildingFloor":"18"},{"id":"ac601c14d02fcd50d7ffc","status":"1","updateTime":null,"createTime":1430274386529,"remarks":null,"buildingName":"??????","buildingYear":"2011","buildingFloor":"16"},{"id":"6e0c6114d02fcd50d7ffd","status":"1","updateTime":null,"createTime":1430274374547,"remarks":null,"buildingName":"??????","buildingYear":"2014","buildingFloor":"18"},{"id":"be8eba14d02fcd50d7ffe","status":"1","updateTime":null,"createTime":1430274346544,"remarks":null,"buildingName":"??????","buildingYear":"2013","buildingFloor":"23"},{"id":"13c05b14d02fcd50d8000","status":"1","updateTime":null,"createTime":1430274233613,"remarks":null,"buildingName":"??????","buildingYear":"2011","buildingFloor":"30"},{"id":"132f4b14d02e4a5b68000","status":"1","updateTime":null,"createTime":1430272648630,"remarks":null,"buildingName":"??????","buildingYear":"2013","buildingFloor":"20"}];
    	$("#s-inputBuildingName").typeahead({
            ajax: {
                url: "${ctx}/manage/building/search",
                timeout: 300,                   // 延时
                method: 'post',
                triggerLength: 1,               // 输入几个字符之后，开始请求
                loadingClass: null,             // 加载数据时, 元素使用的样式类
                preDispatch: null, // 发出请求之前，调用的预处理方法
                preProcess: function (result) { // Ajax 请求完成之后，调用的后处理方法
                	return result;
                }
            },
            //source: mySource,
            display: "buildingName",     // 默认的对象属性名称为 name 属性
            val: "id",           // 默认的标识属性名称为 id 属性
            items: 8,            // 最多显示项目数量
            itemSelected: function (item, val, text) {      // 当选中一个项目的时候，回调函数
                
            }
        });
    	$('#s-inputStartDate').datepicker({
    		language: 'zh-CN',
    		format: 'yyyy-mm-dd',
    		startDate: '-3d'
    	});
    	$('#s-inputEndDate').datepicker({
    		language: 'zh-CN',
    		format: 'yyyy-mm-dd'
    	});
    });
    function saveData() {
    	var jsonData = {
    		"dataId": $("#dataId").val(),
            "buildingName": $("#inputBuildingName").val(),
            "buildingYear": $("#inputBuildingYear").val(),
            "buildingFloor": $("#inputBuildingFloor").val()
        };
    	saveJsonData(jsonData);
    }
    function saveJsonData(obj) {
    	var url = "${ctx}/manage/building/save";
    	if (obj.dataId) {
    		url = "${ctx}/manage/building/update";
    	}
        $.ajax({
            url: url,
            data: {
            	"id": obj.dataId,
                "buildingName": obj.buildingName,
                "buildingYear": obj.buildingYear,
                "buildingFloor": obj.buildingFloor
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
            url: "${ctx}/manage/building/getData",
            dataType : "json",
            data: {
                "id": id
            }, success: function (data) { //dataId
            	$("#inputDataId").val(data.data.id);
            	$("#inputBuildingName").val(data.data.buildingName);
            	$("#inputBuildingYear").val(data.data.buildingYear);
            	$("#inputBuildingFloor").val(data.data.buildingFloor);
            	$("#myModalLabel").text("修改楼盘");
            	$("#myModal").modal("show");
            }
        });
    }
    /**
     * 删除数据
     */
    function deleteData(id) {
        $.ajax({
            url: "${ctx}/manage/building/delete",
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
    	$("#myModalLabel").text("新增楼盘");
    	$("#inputDataId").val("");
        $("#inputBuildingName").val("");
        $("#inputBuildingYear").val("");
        $("#inputBuildingFloor").val("");
    }
    function serverData() {
    	alert(1);
    }
    </script>
  </head>
  <body>
	<div class="box-content">
		<form class="form-inline" role="form">
		<div class="form-group">
		  <label class="sr-only" for="s-inputBuildingName">楼盘名称</label>
		  <input type="text" class="form-control" id="s-inputBuildingName" placeholder="楼盘名称" autocomplete="off">
		</div>
		<div class="form-group">
		  <label class="sr-only" for="s-inputStartDate">开始日期</label>
		  <div class="input-append date">
		  <input type="text" class="form-control" id="s-inputStartDate" placeholder="开始日期" style="width:120px;">
		  <span class="add-on"><i class="icon-th"></i></span>
		  </div>
		</div>
		<div class="form-group">
		  <label class="sr-only" for="s-inputEndDate">结束日期</label>
		  <input type="text" class="form-control" id="s-inputEndDate" placeholder="结束日期" style="width:120px;">
		</div>
		<button type="button" id="search-btn" class="btn btn-info btn-sm">搜索</button>
		<button type="button" id="add-btn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">新增</button>
		</form>
		<table class="table table-striped table-bordered" id="table-list">
		  <thead>
			  <tr>
			  	  <th style="width:10px"><input type="checkbox" id='checkAll'></th>
				  <th>楼盘名称</th>
				  <th>建筑年代</th>
				  <th>楼层</th>
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
		                <h4 class="modal-title" id="myModalLabel">新增楼盘</h4>
		                <input type="hidden" id="inputDataId">
		            </div>
		            <div class="modal-body">
		            	<form class="form-horizontal" role="form">
		            	<div class="form-group">
		                	<label for="inputDistrictId" class="col-sm-2 control-label">区域</label>
		                	<div class="col-sm-10">
		                	<select class="form-control" id="inputDistrictId">
						         <option>皇岗</option>
						         <option>景田</option>
						         <option>梅林</option>
						    </select>
		                	</div>
		                </div>
		                <div class="form-group">
		                	<label for="inputBuildingName" class="col-sm-2 control-label">楼盘名称</label>
		                	<div class="col-sm-10">
		                	<input type="text" class="form-control" id="inputBuildingName">
		                	</div>
		                </div>
		                <div class="form-group">
		                	<label for="inputBuildingYear" class="col-sm-2 control-label">建筑年代</label>
		                	<div class="col-sm-10">
		                	<input type="text" class="form-control" id="inputBuildingYear">
		                	</div>
		                </div>
		                <div class="form-group">
		                	<label for="inputBuildingFloor" class="col-sm-2 control-label">楼层</label>
		                	<div class="col-sm-10">
		                	<input type="text" class="form-control" id="inputBuildingFloor">
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