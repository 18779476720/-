# SrpingMVC #

表单序列化

	第一种
	//定义serializeObject方法，序列化表单
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

	第二种
			var arr = new Array();
			//将数据转化成json
			arr.push({
				"name" : $('#name').val(),
				"password" : $('#password').val(),
				"type" : $('#type').val(),
				"phone" : $('#phone').val(),
				"email" : $('#email').val()
			});
			var data = JSON.stringify($('form').serializeObject());
			$.ajax({
				type : "POST",
				contentType : 'application/json',
				dataType : "json",
				url : "${pageContext.request.contextPath}/user/register",
				data : JSON.stringify(arr),
				success : function(result) {
					cancle();
				}

			});

bootstrap 表单验证

		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" href="assets/bootstrap-validator/css/bootstrapValidator.min.css" />

		<script src="assets/jquery/jquery.min.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/bootstrap-validator/js/bootstrapValidator.min.js"></script>

	表单
	<form class="form-horizontal" id="login" autocomplete="off">
							<div class="form-group">
								<label for="username" class="col-md-3 control-label">用户名</label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-md-3 control-label">密    码</label>
								<div class="col-md-9">
									<input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-3 col-md-6">
									<button type="reset" class="btn btn-default pull-left">重置</button>
									<button type="submit" class="btn btn-primary pull-right">登录</button>
								</div>
							</div>
						</form>


	验证
		$("#login").bootstrapValidator({
	//		提示的图标
			feedbackIcons: {
				valid: 'glyphicon glyphicon-ok',			// 有效的
	            invalid: 'glyphicon glyphicon-remove',		// 无效的
	            validating: 'glyphicon glyphicon-refresh'	// 刷新的
			},
	//		属性对应的是表单元素的名字
			fields: {
	//			匹配校验规则
				username: {
					// 规则
					validators: {
						message: '用户名无效',	// 默认提示信息 
						notEmpty: {
	                        message: '用户名不能为空'
	                    },
	                    regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
	                        regexp: /^[a-zA-Z0-9_\.]+$/,
	                        message: '只能是数字字母_.'
	                    },
	                    /*设置错误信息 和规则无关 和后台校验有关系*/
	                    callback: {
	                        message: '用户名错误'
	                    },
	                    fun: {
	                    	message: 'fun函数无效的示例'
	                    }
					}
				},
				password: {
	                validators: {
	                	message: '密码无效',
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
	                    stringLength: {
	                        min: 6,
	                        max: 18,
	                        message: '密码在6-18个字符内'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z0-9_\.]+$/,
	                        message: '含有非法字符'
	                	},
	                    callback: {
	                        message: '密码不正确' 
	                    }
	                }
	            }
			}
		}).on('success.form.bv', function (e) { // 表单校验成功
			/*禁用默认提交的事件 因为要使用ajax提交而不是默认的提交方式*/
			e.preventDefault();
			/*获取当前的表单*/
			var form = $(e.target);	// 可以通过选择器直接选择
			console.log(form.serialize());	// username=root&password=123456
			$.ajax({
				type: "post",
				url: "/employee/employeeLogin",
				data: form.serialize(),
				dataType: 'json',
				success: function (response) {
					if (response.success) {
	                    /*登录成功之后的跳转*/
	                    location.href = 'index.html';
	                } else {
	                	// 登录失败
	//              	登录按钮点击后,默认不允许再次点击;登录失败要恢复登录按钮的点击
	//					form.data('bootstrapValidator').disableSubmitButtons(false);
						form.bootstrapValidator('disableSubmitButtons', false);
	//					指定触发某一个表单元素的的错误提示函数
						if (response.error == 1000) { // 后台接口如果返回error=1000表示name错误
	//						form.data('bootstrapValidator').updateStatus('username', 'INVALID', 'fun'); // 不能触发
	// 						可以触发
							form.data('bootstrapValidator').updateStatus('username', 'INVALID', 'callback'); 
	//						form.data('bootstrapValidator').updateStatus('username', 'INVALID').validateField('username');
	//						form.data('bootstrapValidator').updateStatus('username', 'INVALID', 'notEmpty');
						} else if (response.error == 1001) { // 后台接口如果返回error=1001表示密码错误
							form.data('bootstrapValidator').updateStatus('password', 'INVALID', 'callback');
						}
	                }
				}
			});
		});
	//	重置功能
		$(".pull-left[type='reset']").on('click', function () {
			$('#login').data('bootstrapValidator').resetForm();
		});







# 五、常用事件 #
	1、重置某一单一验证字段验证规则
	
	$(formName).data(“bootstrapValidator”).updateStatus("fieldName",  "NOT_VALIDATED",  null );
	1
	2、重置表单所有验证规则
	
	$(formName).data("bootstrapValidator").resetForm();
	1
	3、手动触发表单验证
	
	//触发全部验证
	$(formName).data(“bootstrapValidator”).validate();
	//触发指定字段的验证
	$(formName).data(“bootstrapValidator”).validateField('fieldName');
	
	4、获取当前表单验证状态
	
	// flag = true/false 
	var flag = $(formName).data(“bootstrapValidator”).isValid();
	
	5、根据指定字段名称获取验证对象
	
	// element = jq对象 / null
	var element = $(formName).data(“bootstrapValidator”).getFieldElements('fieldName');
	1
	2
	六、表单提交
	1、当提交按钮是普通按钮 
	手动触发表单验证 
	示例：
	
	 $("buttonName").on("click", function(){
	     //获取表单对象
	    var bootstrapValidator = form.data('bootstrapValidator');
	        //手动触发验证
	        bootstrapValidator.validate();
	        if(bootstrapValidator.isValid()){
	            //表单提交的方法、比如ajax提交
	        }
	});
	
	2、当提交按钮的[type=”submit”]时 
	会在success之前自动触发表单验证
	
	var bootstrapValidator = form.data('bootstrapValidator');
	bootstrapValidator.on('success.form.bv', function (e) {
	    e.preventDefault();
	    //提交逻辑
	});


	/*获取到Url里面的参数*/
	(function ($) {
	  $.getUrlParam = function (name) {
	   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	   var r = window.location.search.substr(1).match(reg);
	   if (r != null) return unescape(r[2]); return null;
	  }
	 })(jQuery);
	
	
bootstrap table  

	文档网址 http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
			http://bootstrap-table.wenzhixin.net.cn/zh-cn/getting-started/
	bootstrap 图标网址 https://getbootstrap.com/docs/3.3/components/

	页面

	@{
	    Layout = null;
	}
	<!DOCTYPE html>
	<html>
	<head>
	    <meta name="viewport" content="width=device-width" />
	    <title>BootStrap Table使用</title>
	    @*1、Jquery组件引用*@
	    <script src="~/Scripts/jquery-1.10.2.js"></script>
	
	    @*2、bootstrap组件引用*@
	    <script src="~/Content/bootstrap/bootstrap.js"></script>
	    <link href="~/Content/bootstrap/bootstrap.css" rel="stylesheet" />
	    
	    @*3、bootstrap table组件以及中文包的引用*@
	    <script src="~/Content/bootstrap-table/bootstrap-table.js"></script>
	    <link href="~/Content/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
	    <script src="~/Content/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
	    
	    @*4、页面Js文件的引用*@
	    <script src="~/Scripts/Home/Index.js"></script>
	</head>
	<body>
	    <div class="panel-body" style="padding-bottom:0px;">
	        <div class="panel panel-default">
	            <div class="panel-heading">查询条件</div>
	            <div class="panel-body">
	                <form id="formSearch" class="form-horizontal">
	                    <div class="form-group" style="margin-top:15px">
	                        <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
	                        <div class="col-sm-3">
	                            <input type="text" class="form-control" id="txt_search_departmentname">
	                        </div>
	                        <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
	                        <div class="col-sm-3">
	                            <input type="text" class="form-control" id="txt_search_statu">
	                        </div>
	                        <div class="col-sm-4" style="text-align:left;">
	                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>       
	
	        <div id="toolbar" class="btn-group">
	            <button id="btn_add" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	            </button>
	            <button id="btn_edit" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	            </button>
	            <button id="btn_delete" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
	            </button>
	        </div>
	        <table id="tb_departments"></table>
	<table id="table"
	       data-toolbar="#toolbar"
	       data-search="true"
	       data-show-refresh="true"
	       data-show-toggle="true"
	       data-show-columns="true"
	       data-show-export="true"
	       data-detail-view="true"
	       data-detail-formatter="detailFormatter"
	       data-minimum-count-columns="2"
	       data-show-pagination-switch="true"
	       data-pagination="true"
	       data-id-field="id"
	       data-page-list="[10, 25, 50, 100, ALL]"
	       data-side-pagination="server"
	       data-url="http://issues.wenzhixin.net.cn/examples/bootstrap_table/data"
	       data-response-handler="responseHandler">
	</table>
	    </div>
	</body>
	</html>

	初始化
	$(function () {
	
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
	
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	
	});
	
	
	var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_departments').bootstrapTable({
            url: '/Home/GetDepartment',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                checkbox: true
            }, {
                field: 'Name'，//值
                title: '部门名称'，
				align: 'center'，
				visible: true,//false表示不显示
            	sortable: true,//启用排序
            	width : '5%',
				editable:true,//是否可编辑
				formatter : function (value, row, index) {
                if (row['Name'] === 1) {
                    return '正常';
                }
                if (row['Name'] === 0) {
                    return '禁用';
                }
                return value;
              }
            }, {
                field: 'ParentName',
                title: '上级部门'，
				align: 'center'
            }, {
                field: 'Level',
                title: '部门级别'，
				align: 'center'
            }, {
                field: 'Desc'，
                title: '描述'，
				align: 'center'
            }, 
			{
                field: 'operation',
                title: '操作',
                align: 'center',
                events:operateEvents,//给按钮注册事件
                formatter:addFunctionAlty//表格中增加按钮
            }]
        });
    };

	// 修改按钮、删除按钮
	function addFunctionAlty(value, row, index) {
    return [
        '<button type="button" id="btn_edit" class="btn btn-default" data-toggle="modal" data-target="#ModalInfo">修改</button>  ',
        '<button id="btn_delete" class="btn btn-warning">删除</button>'
    ].join('');
	}

	按钮对应实现的方法：
	window.operateEvents = {
 
	    // 点击修改按钮执行的方法
	    'click #btn_edit': function (e, value, row, index) {
	       // 写自己的方法。。。
	    },
	    // 点击删除按钮执行的方法
	    'click #btn_delete': function (e, value, row, index) {
	        // 写自己的方法。。。
	    }
	};

	在表格中插入数据：
 	 // 插入数据
     $("#tb_departments").bootstrapTable('insertRow', {index:i, row:result.data[i]});

	更新某一行的数据：
 	 $("#tb_departments").bootstrapTable('updateRow', {index: indexT, row: rowT});




    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#txt_search_departmentname").val(),
            statu: $("#txt_search_statu").val()
        };
        return temp;
    };
    return oTableInit;
	};


	var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
	};

