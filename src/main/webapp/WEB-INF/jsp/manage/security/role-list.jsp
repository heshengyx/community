<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>社区网-角色管理</title>
    <link href="${ctx}/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${ctx}/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <script src="${ctx}/js/jquery.dataTables.min.js"></script>
    <script src="${ctx}/js/dataTables.bootstrap.js"></script>
    <script src="${ctx}/js/format.js"></script>
    <script src="${ctx}/js/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript">
    var zTree;
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					return true;
				}
			}
		}
	};

	var zNodes =[
		{id:1, pId:0, name:"[core] 基本功能 演示", open:true},
		{id:101, pId:1, name:"最简单的树 --  标准 JSON 数据", file:"core/standardData"},
		{id:102, pId:1, name:"最简单的树 --  简单 JSON 数据", file:"core/simpleData"},
		{id:103, pId:1, name:"不显示 连接线", file:"core/noline"},
		{id:104, pId:1, name:"不显示 节点 图标", file:"core/noicon"},
		{id:105, pId:1, name:"自定义图标 --  icon 属性", file:"core/custom_icon"},
		{id:106, pId:1, name:"自定义图标 --  iconSkin 属性", file:"core/custom_iconSkin"},
		{id:107, pId:1, name:"自定义字体", file:"core/custom_font"},
		{id:115, pId:1, name:"超链接演示", file:"core/url"},
		{id:108, pId:1, name:"异步加载 节点数据", file:"core/async"},
		{id:109, pId:1, name:"用 zTree 方法 异步加载 节点数据", file:"core/async_fun"},
		{id:110, pId:1, name:"用 zTree 方法 更新 节点数据", file:"core/update_fun"},
		{id:111, pId:1, name:"单击 节点 控制", file:"core/click"},
		{id:112, pId:1, name:"展开 / 折叠 父节点 控制", file:"core/expand"},
		{id:113, pId:1, name:"根据 参数 查找 节点", file:"core/searchNodes"},
		{id:114, pId:1, name:"其他 鼠标 事件监听", file:"core/otherMouse"},

		{id:2, pId:0, name:"[excheck] 复/单选框功能 演示", open:false},
		{id:201, pId:2, name:"Checkbox 勾选操作", file:"excheck/checkbox"},
		{id:206, pId:2, name:"Checkbox nocheck 演示", file:"excheck/checkbox_nocheck"},
		{id:207, pId:2, name:"Checkbox chkDisabled 演示", file:"excheck/checkbox_chkDisabled"},
		{id:208, pId:2, name:"Checkbox halfCheck 演示", file:"excheck/checkbox_halfCheck"},
		{id:202, pId:2, name:"Checkbox 勾选统计", file:"excheck/checkbox_count"},
		{id:203, pId:2, name:"用 zTree 方法 勾选 Checkbox", file:"excheck/checkbox_fun"},
		{id:204, pId:2, name:"Radio 勾选操作", file:"excheck/radio"},
		{id:209, pId:2, name:"Radio nocheck 演示", file:"excheck/radio_nocheck"},
		{id:210, pId:2, name:"Radio chkDisabled 演示", file:"excheck/radio_chkDisabled"},
		{id:211, pId:2, name:"Radio halfCheck 演示", file:"excheck/radio_halfCheck"},
		{id:205, pId:2, name:"用 zTree 方法 勾选 Radio", file:"excheck/radio_fun"},

		{id:3, pId:0, name:"[exedit] 编辑功能 演示", open:false},
		{id:301, pId:3, name:"拖拽 节点 基本控制", file:"exedit/drag"},
		{id:302, pId:3, name:"拖拽 节点 高级控制", file:"exedit/drag_super"},
		{id:303, pId:3, name:"用 zTree 方法 移动 / 复制 节点", file:"exedit/drag_fun"},
		{id:304, pId:3, name:"基本 增 / 删 / 改 节点", file:"exedit/edit"},
		{id:305, pId:3, name:"高级 增 / 删 / 改 节点", file:"exedit/edit_super"},
		{id:306, pId:3, name:"用 zTree 方法 增 / 删 / 改 节点", file:"exedit/edit_fun"},
		{id:307, pId:3, name:"异步加载 & 编辑功能 共存", file:"exedit/async_edit"},
		{id:308, pId:3, name:"多棵树之间 的 数据交互", file:"exedit/multiTree"},

		{id:4, pId:0, name:"大数据量 演示", open:false},
		{id:401, pId:4, name:"一次性加载大数据量", file:"bigdata/common"},
		{id:402, pId:4, name:"分批异步加载大数据量", file:"bigdata/diy_async"},
		{id:403, pId:4, name:"分批异步加载大数据量", file:"bigdata/page"},

		{id:5, pId:0, name:"组合功能 演示", open:false},
		{id:501, pId:5, name:"冻结根节点", file:"super/oneroot"},
		{id:502, pId:5, name:"单击展开/折叠节点", file:"super/oneclick"},
		{id:503, pId:5, name:"保持展开单一路径", file:"super/singlepath"},
		{id:504, pId:5, name:"添加 自定义控件", file:"super/diydom"},
		{id:505, pId:5, name:"checkbox / radio 共存", file:"super/checkbox_radio"},
		{id:506, pId:5, name:"左侧菜单", file:"super/left_menu"},
		{id:513, pId:5, name:"OutLook 风格", file:"super/left_menuForOutLook"},
        {id:514, pId:5, name:"Metro 风格", file:"super/metro"},
		{id:507, pId:5, name:"下拉菜单", file:"super/select_menu"},
		{id:509, pId:5, name:"带 checkbox 的多选下拉菜单", file:"super/select_menu_checkbox"},
		{id:510, pId:5, name:"带 radio 的单选下拉菜单", file:"super/select_menu_radio"},
		{id:508, pId:5, name:"右键菜单 的 实现", file:"super/rightClickMenu"},
		{id:511, pId:5, name:"与其他 DOM 拖拽互动", file:"super/dragWithOther"},
		{id:512, pId:5, name:"异步加载模式下全部展开", file:"super/asyncForAll"},

		{id:6, pId:0, name:"其他扩展功能 演示", open:false},
		{id:601, pId:6, name:"隐藏普通节点", file:"exhide/common"},
		{id:602, pId:6, name:"配合 checkbox 的隐藏", file:"exhide/checkbox"},
		{id:603, pId:6, name:"配合 radio 的隐藏", file:"exhide/radio"}
	];
    var table;
    $(document).ready(function() {
    	var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));
		
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
				"url": "${ctx}/manage/role/list",
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
		            "targets": [2]
	            },
	            {
	            	"render": function(data, type, row) {
		            	return to_date_hms(data.createTime);
		            },
		            "targets": [3]
	            },
	            {
	            	"searchable": false,
			    	"orderable": false,
	            	"render": function(data, type, row) {
		                var content = "";
		                content += "<a href=\"javascript:void(0);\" onclick=\"editData('" + data.id + "')\">编辑</a>&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"deleteData('" + data.id + "')\">删除</a>&nbsp;&nbsp;";
		                content += "<a href=\"javascript:void(0);\" onclick=\"allocation('" + data.id + "', '" + data.name + "')\">分配权限</a>";
		            	return content;
		            },
		            "targets": [4]
	            }
			],
			"columns": [
	            { "data": null},
	            /* { "data": "id"}, */
	            { "data": "name" },
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
            "status": $("input[name='status']:checked").val()
        };
    	saveJsonData(jsonData);
    }
    function saveJsonData(obj) {
    	var url = "${ctx}/manage/role/save";
    	if (obj.dataId) {
    		url = "${ctx}/manage/role/update";
    	}
        $.ajax({
            url: url,
            data: {
            	"id": obj.dataId,
                "name": obj.name,
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
            	$("#myModalLabel").text("修改角色");
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
    	$("#myModalLabel").text("新增角色");
    	$("#inputDataId").val("");
        $("#inputName").val("");
        $("#inputCode").val("");
    }
    function allocation(id, name) {
    	$("#tRoleName").text(name);
    	$.ajax({
            url: "${ctx}/manage/permission/delete",
            data: {
                "id": id
            }, success: function (data) {
                table.ajax.reload();
            }
        });
    	$("#dlgModal").modal("show");
    }
    </script>
  </head>
  <body>
	<div class="box-content">
		<table class="table table-striped table-bordered" id="table-list">
		  <thead>
			  <tr>
			  	  <th style="width:10px"><input type="checkbox" id='checkAll'></th>
				  <th>角色名称</th>
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
		                <h4 class="modal-title" id="myModalLabel">新增角色</h4>
		                <input type="hidden" id="inputDataId">
		            </div>
		            <div class="modal-body">
		            	<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
		            	<form class="form-horizontal" role="form">
		                <div class="form-group">
		                	<label for="inputName" class="col-sm-2 control-label">角色名称</label>
		                	<div class="col-sm-10">
		                	<input type="text" class="form-control" id="inputName">
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
		</div>
		<div class="modal fade" id="dlgModal" tabindex="-1" role="dialog" aria-labelledby="dlgModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
		                        aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title" id="myModalLabel">分配权限</h4>
		                <input type="hidden" id="inputDataId">
		            </div>
		            <div class="modal-body">
		            	<form class="form-horizontal" role="form">
		                <div class="form-group">
		                	<div class="col-sm-2 text-right"><b>角色名称</b></div>
		                	<div class="col-sm-10"><span id="tRoleName"></span></div>
		                </div>
		                <div class="form-group">
		                	<div class="col-sm-2 text-right"><b>权限列表</b></div>
		                	<div class="col-sm-10">	                	
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
		</div>
		<!-- Modal -->         
	</div>
  </body>
</html>