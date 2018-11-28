# aurora开发 #

----------
## 快速开发脚本 ##

###1、根据表生成增删改查plsql ###

    /*************************************************
    
      -- Author: ZP  
      -- Created   : 2017/11/13 16:57:47  
      -- Ver   : 1.1   
      -- Purpose   : 根据表名快速生成表插入和修改过程脚本   
      -- Parameters: 表名  
    **************************************************/
    DECLARE   
      l_table_name   VARCHAR2(2000) := '&table_name';   
      v_package_name VARCHAR2(100) := '&package_name';
      v_pk   VARCHAR2(60);
    BEGIN  
      dbms_output.enable(300000);    
      l_table_name := UPPER(l_table_name);    
      IF v_package_name IS NULL THEN
    v_package_name := 'c_package_name,';
      ELSE
    v_package_name := '''' || v_package_name || ''',';
      END IF;
      SELECT lower(cu.COLUMN_NAME)
    INTO v_pk
    FROM user_cons_columns cu, user_constraints au
       WHERE cu.constraint_name = au.constraint_name
     AND au.constraint_type = 'P'
     AND au.table_name = l_table_name;
      --查询过程
      dbms_output.put_line('/*select t.* from (select ');
      FOR rec IN (SELECT lower(column_name) column_name
    FROM user_tab_columns
       WHERE table_name = l_table_name) LOOP
    IF rec.column_name <> v_pk THEN
      dbms_output.put_line(rec.column_name || ',');
    END IF;
      END LOOP;
      dbms_output.put_line(v_pk);
      dbms_output.put_line('from ' || l_table_name || ')t where t.' || v_pk ||
       '=${@' || v_pk || '};*/');
      dbms_output.put_line('');
      dbms_output.put_line('');
      --插入过程
      dbms_output.put_line('--==========================================================
    --procedure name  : insert_' || lower(l_table_name) || '
    --discription : 
    --note:
    --parameter   :
    --==========================================================');
      dbms_output.put_line(' procedure insert_' || lower(l_table_name) || '(');
      FOR rec IN (SELECT lower(column_name) column_name, data_type
    FROM user_tab_columns
       WHERE table_name = l_table_name) LOOP
    IF rec.column_name NOT IN ('creation_date',
       'last_update_date',
       'created_by',
       'last_updated_by') THEN
      dbms_output.put_line('p_' || rec.column_name || '  ' ||
       rec.data_type || ',');
    END IF;
      
      END LOOP;
      dbms_output.put_line('p_user_id NUMBER');
      dbms_output.put_line(') is  v_data ' || lower(l_table_name) ||
       '%ROWTYPE;   begin');
    
      FOR rec IN (SELECT lower(column_name) column_name
    FROM user_tab_columns
       WHERE table_name = l_table_name) LOOP
    IF rec.column_name IN ('creation_date', 'last_update_date') THEN
      dbms_output.put_line('v_data.' || rec.column_name || ' := sysdate;');
    ELSIF rec.column_name IN ('created_by', 'last_updated_by') THEN
      dbms_output.put_line('v_data.' || rec.column_name ||
       ' := p_user_id;');
    ELSE
      dbms_output.put_line('v_data.' || rec.column_name || ' :=  ' || 'p_' ||
       rec.column_name || ';');
    END IF;
      END LOOP;
    
      dbms_output.put_line('insert into ' || lower(l_table_name) ||
       ' values  v_data ;');
      dbms_output.put_line('EXCEPTION
      WHEN OTHERS THEN
    sys_raise_app_error_pkg.raise_sys_others_error(p_message => dbms_utility.format_error_backtrace || '' '' ||
    SQLERRM,
       p_created_by  => p_user_id,
       p_package_name=> ' ||
       v_package_name || '
       p_procedure_function_name => ''insert_' ||
       lower(l_table_name) ||
       ''');
    raise_application_error(sys_raise_app_error_pkg.c_error_number,
    sys_raise_app_error_pkg.g_err_line_id);');
      dbms_output.put_line('end  insert_' || lower(l_table_name) || ';');
      dbms_output.put_line('');
      dbms_output.put_line('');
      --修改过程
      dbms_output.put_line('--==========================================================
    --procedure name  : update_' || lower(l_table_name) || '
    --discription : 
    --note:
    --parameter   :
    --==========================================================');
      dbms_output.put_line(' procedure update_' || lower(l_table_name) || '(');
      FOR rec IN (SELECT lower(column_name) column_name, data_type
    FROM user_tab_columns
       WHERE table_name = l_table_name) LOOP
    IF rec.column_name NOT IN ('creation_date',
       'last_update_date',
       'created_by',
       'last_updated_by') THEN
      dbms_output.put_line('p_' || rec.column_name || '  ' ||
       rec.data_type || ',');
    END IF;
      END LOOP;
    
      dbms_output.put_line('p_user_id NUMBER');
      dbms_output.put_line(') is  v_data ' || lower(l_table_name) ||
       '%ROWTYPE;   begin');
      dbms_output.put_line('update ' || lower(l_table_name) || ' t  set ');
      FOR rec IN (SELECT lower(column_name) column_name
    FROM user_tab_columns
       WHERE table_name = l_table_name) LOOP
    IF rec.column_name IN ('creation_date',
       'last_update_date',
       'created_by',
       'last_updated_by') THEN
      NULL;
    ELSE
      dbms_output.put_line('t.' || rec.column_name || ' =  ' || 'p_' ||
       rec.column_name || ',');
    END IF;
      END LOOP;
      dbms_output.put_line('t.last_update_date = sysdate,');
      dbms_output.put_line('t.last_updated_by = p_user_id');
      dbms_output.put_line('where t.' || v_pk || '=p_' || v_pk || ';');
      dbms_output.put_line('EXCEPTION
      WHEN OTHERS THEN
    sys_raise_app_error_pkg.raise_sys_others_error(p_message => dbms_utility.format_error_backtrace || '' '' ||
    SQLERRM,
       p_created_by  => p_user_id,
       p_package_name=> ' ||
       v_package_name || '
       p_procedure_function_name => ''update_' ||
       lower(l_table_name) ||
       ''');
    raise_application_error(sys_raise_app_error_pkg.c_error_number,
    sys_raise_app_error_pkg.g_err_line_id);');
      dbms_output.put_line('end  update_' || lower(l_table_name) || ';');
      dbms_output.put_line('');
      dbms_output.put_line('');
      --删除过程
      dbms_output.put_line('--==========================================================
    --procedure name  : delete_' || lower(l_table_name) || '
    --discription : 
    --note:
    --parameter   :
    --==========================================================');
      dbms_output.put_line(' procedure delete_' || lower(l_table_name) || '(');
      dbms_output.put_line('p_' || v_pk || ' NUMBER,');
      dbms_output.put_line('p_user_id NUMBER)IS');
      dbms_output.put_line('begin DELETE FROM ' || lower(l_table_name) || ' t');
      dbms_output.put_line('where t.' || v_pk || '=p_' || v_pk || ';');
      dbms_output.put_line('EXCEPTION
      WHEN OTHERS THEN
    sys_raise_app_error_pkg.raise_sys_others_error(p_message => dbms_utility.format_error_backtrace || '' '' ||
    SQLERRM,
       p_created_by  => p_user_id,
       p_package_name=> ' ||
       v_package_name || '
       p_procedure_function_name => ''delete_' ||
       lower(l_table_name) ||
       ''');
    raise_application_error(sys_raise_app_error_pkg.c_error_number,
    sys_raise_app_error_pkg.g_err_line_id);');
      dbms_output.put_line('end  delete_' || lower(l_table_name) || ';');
    EXCEPTION
      WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20001, '表不存在');
    END;
   
###2、根据表内注释生成双语提示###

       /*************************************************
      -- author: zhangdada
      -- created   : 2017/11/13 16:57:47
      -- ver   : 1.1
      -- purpose   : 根据表名快速生成prompt脚本
      -- parameters: 表名
    **************************************************/
    DECLARE
      v_table_name VARCHAR2(100) := 'LJ_PROJECT_BUDGET_HEAD';
      v_titel  VARCHAR2(100) := 'LJ_PRJ';
      v_start  VARCHAR2(1000);
      v_endVARCHAR2(1000);
      v_str1   VARCHAR2(100) := 'sys_prompt_pkg.sys_prompts_load(''';
      v_str2   VARCHAR2(100) := ''');';
      v_zhsVARCHAR2(100) := ''',''ZHS'',''';
      v_us VARCHAR2(100) := ''',''US'',''';
    BEGIN
      v_start := 'WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
    WHENEVER OSERROR  EXIT FAILURE ROLLBACK;
    spool INITIALIZE_PROMPT.log
    set feedback off
    set define off
    begin';
      v_end   := 'end; 
    /
    commit;
    set feedback on
    set define on
    spool off
    exit';
      dbms_output.put_line(v_start);
      FOR rec IN (SELECT *
    FROM user_col_comments u
       WHERE upper(u.table_name) = upper(v_table_name)
     AND u.comments IS NOT NULL)
      LOOP
    dbms_output.put_line(v_str1 || v_titel || '.' || rec.column_name || v_zhs || rec.comments || v_str2);
    dbms_output.put_line(v_str1 || v_titel || '.' || rec.column_name || v_us || lower(rec.column_name) || v_str2);
      END LOOP;
      dbms_output.put_line(v_end);
    END;
    

----------


## 培训资料 ##

    --常用目录
    webRoot\images --图片资源目录
    webRoot\modules --screen、svc目录
    webRoot\WEB-INF --配置文件、bm目录
    webRoot\WEB-INF\aurora.database\datasource.config --数据库连接配置
    webRoot\WEB-INF\aurora.plugin.quartz\job.config --页面job计划任务 ，本机环境需注释、不启用
    webRoot\WEB-INF\aurora.plugin.sap\sap.config --SAP环境信息
    webRoot\WEB-INF\aurora.ui --UI组件目录（不允许修改）
    webRoot\WEB-INF\classes --bm目录
    webRoot\WEB-INF\uncertain.local.xml --日志配置、UI目录配置（路径不正确，应用起不来）
    
    --配置本地环境
    1.在tomcat\conf\server.xml 的Host标签下添加<Context path="/应用访问路径" docBase="本机应用目录" />
    2.检查 tomcat\bin\startup.bat 文件中的环境变量是否正确
    set "CATALINA_HOME=本机tomcat路径"
    set "JAVA_HOME=本机jdk安装路径"
    set "JRE_HOME=本机jdk安装路径下jre目录路径"
    3.检查应用 webRoot\WEB-INF\uncertain.local.xml中路径是否正确
    4.检查应用 webRoot\WEB-INF\aurora.database\datasource.config中数据库连接是否正确
    
    --JSON
    {"parameter":[
       {"is_login_required":0,"is_entry_page":0,"service_name":"aboutUs.screen","service_id":1323851,"is_access_checked":0,"title":"ABOUTUS.SCREEN.TITLE","language_title":"关于我们","is_system_access":0,"_id":1003,"_status":"update"},
       {"is_login_required":0,"is_entry_page":0,"service_name":"appt_product_demo_book.screen","service_id":1329680,"is_access_checked":0,"title":"APPT_PRODUCT_DEMO_BOOK.SCREEN.TITLE","language_title":"预约产品演示1","is_system_access":1,"_id":1005,"_status":"update"}
    ]}
    
    {} --一行数据
    [{},{}] --多行数据
    "参数":值 --数据
    
    
    --工号命名
    模块号+4位流水 步长10
    流水号
    1xxx --基础数据类能功能
    5xxx --业务数据类功能
    7xxx --查询类报表功能
    
    
    --功能定义
    1.页面注册
    云平台管理=》开发维护=》页面注册
    2.功能定义
    云平台管理=》系统管理-云级=》功能定义
    
    --参数
    --功能代码
    --功能名称
    --功能描述
    --上级节点
    --功能级别  G 目录 F 功能
    --功能阵营 纯备注字段
    --功能类型 纯备注字段
    --页面
    --序列
    BEGIN
    sys_data_load_pkg.load_sys_function('TEST0829','测试功能0829','','MANAGER','F','SYSTEM','STANDARD','modules/test/TEST0829/cux_employee.screen','0829','','');
    END;
    
    --分配页面 分配当前功能可访问页面
    --分配bm 分配当前功能可访bm
    
    3.为角色分配功能
    云平台管理=》系统管理-云级=》系统角色管理
  
    4.更新缓存
    云平台管理=》开发维护=》缓存数据重载
    
    
    
    --值集表
    #改变当前SESSION语言环境
    ALTER SESSION SET NLS_LANGUAGE='SIMPLIFIED CHINESE';
    
    SELECT code_value,
       code_value_name
      FROM sys_code_values_v
     WHERE code = 'SEX';
    
    select * from sys_codes ;
    select * from sys_code_values where code_id = 382;
    
    --创建值集
    BEGIN
      sys_code_pkg.insert_sys_code('SEX', 'SEX', 'SEX', 'SEX', 'US');
      sys_code_pkg.update_sys_code('SEX', '性别', '性别', '性别', 'ZHS');
    
      sys_code_pkg.insert_sys_code_value('SEX', 'FEMALE', 'Female', 'US');
      sys_code_pkg.update_sys_code_value('SEX', 'FEMALE', '女', 'ZHS');
    
      sys_code_pkg.insert_sys_code_value('SEX', 'MALE', 'Male', 'US');
      sys_code_pkg.update_sys_code_value('SEX', 'MALE', '男', 'ZHS');
    
      sys_code_pkg.insert_sys_code_value('SEX', 'INDETERMINATE', 'Indeterminate', 'US');
      sys_code_pkg.update_sys_code_value('SEX', 'INDETERMINATE', '不确定', 'ZHS');
    END;
    
    --页面多语言
    select * from sys_prompts WHERE PROMPT_CODE LIKE 'DEPT%';
    
    BEGIN
      sys_prompt_pkg.sys_prompts_load('CUX_EMPLOYEE.EMPLOYEE_NAME','ZHS' ,'员工姓名');
      sys_prompt_pkg.sys_prompts_load('CUX_EMPLOYEE.EMPLOYEE_NAME','US' ,'Employee Name');
    END;
      
    --系统异常处理
    select * from sys_raise_app_errors order by 1 desc;--系统日志表
    
    begin
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code=> 'TEST0829_EMPLOYEE_NAME_IS_NULL_ERROR',
      p_created_by  => p_user_id,
      p_package_name=> 'cux_employee_pkg',
      p_procedure_function_name => 'insert_cux_employee');
      --raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    end;
    
    --错误消息多语言
    select * from sys_messages where message_name like '%用户不能为空%';
    
    begin
      sys_message_pkg.insert_message('TEST0829_EMPLOYEE_NAME_IS_NULL_ERROR','Error','Employee Name Is Null.','US');
      sys_message_pkg.insert_message('TEST0829_EMPLOYEE_NAME_IS_NULL_ERROR','错误','员工姓名不能为空！','ZHS');
    end;


----------


# 开发脚本 #


----------

###功能、目录 脚本###


    --目录注册
      sys_data_load_pkg.load_sys_function('HN_CSI','供应商认证','供应商认证','','G','GROUP','','','1010','','ZHS');
      sys_data_load_pkg.load_sys_function('HN_CERT','现场考察','现场考察','HN_CSI','G','GROUP','HN_CSI','','1010','','ZHS');
       
    --功能注册
      sys_data_load_pkg.load_sys_function('HN_CERT1010','现场考察计划','现场考察计划','HN_CERT','F','GROUP','STANDARD','modules/cux/HN/cert/CERT1010/hn_cert_scene_inspection_main.screen','1010','','ZHS');


###双语言提示：###

    sys_prompt_pkg.sys_prompts_load('HN_CERT.HEAD_ID', 'ZHS', '头ID');
    sys_prompt_pkg.sys_prompts_load('HN_CERT.HEAD_ID', 'US', 'head_id');

###值集：###

      sys_code_pkg.delete_sys_code('HN_SCHEME_STATUS_SYSCODE'); 
      sys_code_pkg.insert_sys_code('HN_SCHEME_STATUS_SYSCODE', '寻源方案状态', '寻源方案状态', '寻源方案状态', 'ZHS', ''); 
      sys_code_pkg.update_sys_code('HN_SCHEME_STATUS_SYSCODE', 'SCHEME_STATUS', 'SCHEME_STATUS', 'SCHEME_STATUS', 'US', ''); 
      sys_code_pkg.insert_sys_code_value('HN_SCHEME_STATUS_SYSCODE','NEW','新建','ZHS','');
      sys_code_pkg.update_sys_code_value('HN_SCHEME_STATUS_SYSCODE','NEW','NEW','US','');
      sys_code_pkg.insert_sys_code_value('HN_SCHEME_STATUS_SYSCODE','APPROVING','审批中','ZHS','');
      sys_code_pkg.update_sys_code_value('HN_SCHEME_STATUS_SYSCODE','APPROVING','APPROVING','US','');
      sys_code_pkg.insert_sys_code_value('HN_SCHEME_STATUS_SYSCODE','CANCELLED','已取消','ZHS','');
      sys_code_pkg.update_sys_code_value('HN_SCHEME_STATUS_SYSCODE','CANCELLED','CANCELLED','US','');
      sys_code_pkg.insert_sys_code_value('HN_SCHEME_STATUS_SYSCODE','APPROVED','审批通过','ZHS','');
      sys_code_pkg.update_sys_code_value('HN_SCHEME_STATUS_SYSCODE','APPROVED','APPROVED','US','');
      sys_code_pkg.insert_sys_code_value('HN_SCHEME_STATUS_SYSCODE','REJECTED','审批拒绝','ZHS','');
      sys_code_pkg.update_sys_code_value('HN_SCHEME_STATUS_SYSCODE','REJECTED','REJECTED','US','');
    
###系统消息：###

    sys_message_pkg.delete_message('HN_FND_VENDOR_SOURCE_METHOD_ERROR');
    sys_message_pkg.insert_message('HN_FND_VENDOR_SOURCE_METHOD_ERROR', '错误','请至少选择一种<潜在供应商寻找方式>','ZHS');
    sys_message_pkg.insert_message('HN_FND_VENDOR_SOURCE_METHOD_ERROR', 'Error','请至少选择一种<潜在供应商寻找方式>','US');
    
## 锁表查询 ##


----------

    SELECT l.session_id sid,
       s.serial#,
       l.locked_mode,
       l.oracle_username,
       l.os_user_name,
       s.machine,
       s.terminal,
       o.object_name,
       s.logon_time
      FROM v$locked_object l, all_objects o, v$session s
     WHERE l.object_id = o.object_id
       AND l.session_id = s.sid
     ORDER BY sid, s.serial#;


----------

# pdf打印 #


----------

###1、screen文件###

    增加svc链接
    <a:link id="hn_fnd_source_result_export_pdf" url="${/request/@context_path}/modules/cux/HN/fnd/FND2010/hn_fnd_source_result_export_pdf.svc"/>

    //保存pdf
    function hn_fnd_source_result_export(){
    Aurora.request({
    url: $('hn_fnd_source_result_export_pdf').getUrl()+ '?head_id=${/parameter/@head_id}',//传参数
    success: function(res) {
    window.open("${/request/@context_path}" + res.result.fileName);
    }
    });
    }

###1、svc文件###

    <?xml version="1.0" encoding="UTF-8"?>
    <!--
    $Author: chenglu 
    $Date: 2018-11-7 09:22
    $Revision: 1.0  
    $Purpose: 
    -->
    <a:service xmlns:p="uncertain.proc" xmlns:a="http://www.aurora-framework.org/application" xmlns:s="aurora.plugin.script" trace="true">
    <a:init-procedure>
    <a:model-query model="cux.HN.fnd.FND2010.hn_fnd_source_result_head_query" rootPath="header"/> //rootPath:是js里面判断取值的一个参数
    <a:model-query model="cux.HN.fnd.FND2010.hn_fnd_source_result_line_query" rootPath="fndline"/> //
    <p:echo/>
    <s:server-script import="hnfndsourcepdf.js"><![CDATA[
    //调用，生成指定的pdf文件
    exportToPdf();
    ]]></s:server-script>
    </a:init-procedure>
    <a:service-output output="/parameter"/>
    </a:service>


###1、js文件###

	    importClass(java.io.FileOutputStream);
	importClass(java.io.File);
	importClass(java.io.FileInputStream);
	importClass(java.nio.charset.Charset);
	importClass(java.awt.Color);
	importClass(com.itextpdf.text.Document);
	importClass(com.itextpdf.text.pdf.PdfWriter);
	importClass(com.itextpdf.text.Paragraph);
	importClass(com.itextpdf.text.pdf.BaseFont);
	importClass(com.itextpdf.text.Font);
	importClass(com.itextpdf.text.pdf.PdfPCell);
	importClass(com.itextpdf.text.pdf.PdfPTable);
	importClass(com.itextpdf.text.BaseColor);
	importClass(com.itextpdf.text.Element);
	importClass(com.itextpdf.text.Image);
	importClass(com.itextpdf.text.PageSize);
	importClass(com.itextpdf.text.pdf.PdfContentByte);
	importClass(com.itextpdf.text.pdf.PdfReader);
	importClass(com.itextpdf.text.pdf.PdfStamper);
	importClass(com.itextpdf.text.pdf.draw.LineSeparator);
	importClass(javax.servlet.http.HttpServlet);
	importClass(javax.servlet.http.HttpServletRequest);
	importClass(Packages.aurora.service.ServiceInstance);
	importPackage(com.itextpdf.text.pdf.fonts);
	importPackage(java.lang);
	
	var dsf = $instance("aurora.database.service.IDatabaseServiceFactory");
	// 输出日志
	var logger = $logger('server-script');
	function log(msg) {
		logger.info(msg);
	
	}
	
	// 获取 context 中的 parameter 节点，后续写入文档路径，供前台 JS 调用
	var parameter = $ctx.parameter;
	
	// 设置字体，中文显示需要引入 itext-asian.jar
	var baseFont = BaseFont.createFont('STSong-Light', 'UniGB-UCS2-H',
			BaseFont.NOT_EMBEDDED);
	
	var survey_type_code;
	
	// 设置字号
	var fontChinese = new Font(baseFont, 10, Font.NORMAL);
	var fontSubTitle = new Font(baseFont, 10, Font.BOLD);
	var fontChineseBold = new Font(baseFont, 12, Font.BOLD);
	var fontChineseBig = new Font(baseFont, 20, Font.BOLD);
	// 字号和颜色
	var fontChineseRed = new Font(baseFont, 10, Font.NORMAL, BaseColor.RED);
	
	function isEmpty(obj) {
		for ( var name in obj) {
			return false;
		}
		return true;
	}
	
	function setPdfTableCell(content, width, datatable, font) {
		var cell = new PdfPCell(new Paragraph(content, font));
		cell.setColspan(width);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		datatable.addCell(cell);
	}
	
	function getValue(value, back) {
		if (typeof (value) == 'undefined') {
			if (typeof (back) == 'undefined') {
				return '';
			} else {
				return String(back);
			}
		}
	
		if (value == 'Y') {
			return '是';
		}
	
		if (value == 'N') {
			return '否';
		}
		if (value == '') {
			return '否';
		}
	
		return String(value);
	}
	
	function addTitle(surveyDocument, title) {
		var p = new Paragraph(title, fontChineseBold);
		p.setSpacingBefore(10);
		p.setSpacingAfter(10);
		surveyDocument.add(p);
	
	}
	
	function addSubTitle(surveyDocument, title) {
		var p = new Paragraph(title, fontSubTitle);
		p.setSpacingAfter(10);
		p.setSpacingBefore(10);
		p.setFirstLineIndent(30);
		surveyDocument.add(p);
	
	}
	
	function addUnderLine(surveyDocument) {
		var underline = new LineSeparator();
		underline.setOffset(1);
		surveyDocument.add(underline);
	}
	
	function addSubUnderLine(surveyDocument) {
		var underline = new LineSeparator();
		underline.setOffset(1);
		underline.setPercentage(90);
		surveyDocument.add(underline);
	}
	
	function addTableRow(table, content, column, cell, font) {
		var colSpanCount = 1;
	
		// 行中有合并单元格的字段
		if (column != cell) {
	
			// 一行只显示一个字段信息
			if (column == 2) {
				colSpanCount = cell - 1;
			} else {
				colSpanCount = cell / column + 1;
			}
		}
	
		for (var i = 0; i < column; i++) {
			var cell = new PdfPCell(new Paragraph(content[i], font));
			cell.setBorderWidth(0);
			if (i % 2 == 1) {
				cell.setColspan(colSpanCount);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			} else {
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			}
			table.addCell(cell);
		}
	}
	
	function addHeaderRow(surveyDocument, content, columns, cells, widthPercentage) {
	
		// 设置无边框的表格，并填充元素，字体没有颜色
		var headerTable = new PdfPTable(cells);
		headerTable.setWidthPercentage(widthPercentage);
		headerTable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
	
		for (var i = 0; i < columns; i++) {
			var cell = new PdfPCell(new Paragraph(content[i], fontChinese));
			cell.setBorderWidth(0);
			if (i % 2 == 1) {
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			} else {
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			}
	
			if (columns == 2) {
				if (i == 1) {
					cell.setColspan(cells - 1);
				}
			}
	
			if (columns == 4) {
				if (i == 3) {
					cell.setColspan(cells - 3);
				}
			}
	
			headerTable.addCell(cell);
		}
		surveyDocument.add(headerTable);
	}
	
	// 增加行元素，字体为红色
	function addHeaderRowRed(surveyDocument, content, columns, cells,
			widthPercentage) {
	
		// 设置无边框的表格，并填充元素
		var headerTable = new PdfPTable(cells);
		headerTable.setWidthPercentage(widthPercentage);
		headerTable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
	
		for (var i = 0; i < columns; i++) {
			var cell = new PdfPCell(new Paragraph(content[i], fontChineseRed));
			cell.setBorderWidth(0);
			if (i % 2 == 1) {
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			} else {
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			}
	
			if (columns == 2) {
				if (i == 1) {
					cell.setColspan(cells - 1);
				}
			}
	
			if (columns == 4) {
				if (i == 3) {
					cell.setColspan(cells - 3);
				}
			}
	
			headerTable.addCell(cell);
		}
		surveyDocument.add(headerTable);
	}
	
	// 创建明细表格通用方法
	function addDetailTable(surveyDocument, datas, title, title_code, width, font) {
		// 获取表格宽度的cell总数
		var sum = 0;
		for (var i = 0; i < width.length; i++) {
			sum += parseInt(width[i]);
		}
	
		// 设置核心表格，并循环添加数据
		var datatable = new PdfPTable(sum);
		datatable.setWidthPercentage(100);
		datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
		datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		// datatable.setSpacingAfter(40);
	
		// 添加标题
		for (var i = 0; i < title.length; i++) {
			var cell = new PdfPCell(new Paragraph(title[i], font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setColspan(width[i]);
			datatable.addCell(cell);
		}
	
		// 添加明细
		for (var i = 0; i < datas.length; i++) {
			for (var j = 0; j < title_code.length; j++) {
				eval('setPdfTableCell(getValue(datas[i].' + title_code[j]
						+ '), width[j], datatable, font)');
			}
		}
		surveyDocument.add(datatable);
	}
	
	// 3级联动表格输出
	function addDetailTable3(surveyDocument, datas, title, title_code, width, font,
			line, flag) {
		// 获取表格宽度的cell总数
		var sum = 0;
		for (var i = 0; i < width.length; i++) {
			sum += parseInt(width[i]);
		}
	
		// 设置核心表格，并循环添加数据
		var datatable = new PdfPTable(sum);
		datatable.setWidthPercentage(100);
		datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
		datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		// datatable.setSpacingAfter(40);
	
		// 添加标题
		if (flag == 1) {
			for (var i = 0; i < title.length; i++) {
				var cell = new PdfPCell(new Paragraph(title[i], font));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setColspan(width[i]);
				datatable.addCell(cell);
			}
		}
	
		// 添加明细
		for (var j = 0; j < title_code.length; j++) {
			eval('setPdfTableCell(getValue(datas[' + line + '].' + title_code[j]
					+ '), width[j], datatable, font)');
		}
		surveyDocument.add(datatable);
	}
	
	function addHnCertReportScheme(surveyDocument) {
		var datas = $ctx.model.getChild("header").getChildren();
		if (!isEmpty(datas)) {
			// 设置格式
			var vendor1 = [ '报告单号:', getValue(datas[0].assess_report_number),
					'供应商:', getValue(datas[0].vendor_name) ];
			var vendor2 = [ '供应商类型:', getValue(datas[0].vendor_type_desc), '考察日期:',
					getValue(datas[0].investigate_date) ];
	
			var vendor3 = [ '考察目的:', getValue(datas[0].investigate_purpose_desc),
					'考察计划号:', getValue(datas[0].cert_plan_no) ];
			var vendor4 = [ '考察模板编号:', getValue(datas[0].template_number), '联系人:',
					getValue(datas[0].contact_name) ];
			var vendor5 = [ '联系电话:', getValue(datas[0].contact_phone), '传真:',
					getValue(datas[0].contact_fax) ];
			var vendor6 = [ '联系地址:', getValue(datas[0].contact_address) ];
	
			// 设置标题和分割线
			addSubTitle(surveyDocument, '考察报告明细');
			addUnderLine(surveyDocument);
	
			// 按行添加数据
			addHeaderRow(surveyDocument, vendor1, 4, 4, 100);
			addHeaderRow(surveyDocument, vendor2, 4, 4, 100);
			addHeaderRow(surveyDocument, vendor3, 4, 4, 100);
			addHeaderRow(surveyDocument, vendor4, 4, 4, 100);
			addHeaderRow(surveyDocument, vendor5, 4, 4, 100);
			addHeaderRow(surveyDocument, vendor6, 2, 4, 100);
	
		}
	}
	
	// 考察评估人员及部门
	function addfndsourceInspLineInfo(surveyDocument) {
		// 获取数据
		var datas = $ctx.model.getChild("insp").getChildren();
	
		if (!isEmpty(datas)) {
			var subcontractTableTitle = [ '行号', '人员名称', '部门名称', '职务', '是否为负责人' ];
			var subcontractTableTitleCode = [ 'line_num', 'person_desc',
					'unit_desc', 'position_desc', 'principal_flag' ];
			var subcontractTableWidth = [ 1, 1, 1, 1, 1 ];
	
			// 标题
			addSubTitle(surveyDocument, '考察评估人员及部门');
	
			// 输出表格
			addDetailTable(surveyDocument, datas, subcontractTableTitle,
					subcontractTableTitleCode, subcontractTableWidth, fontChinese);
		}
	}
	// 供应商人员及部门
	function addfndsourceVendorLineInfo(surveyDocument) {
		// 获取数据
		var datas = $ctx.model.getChild("vendor").getChildren();
	
		if (!isEmpty(datas)) {
			var subcontractTableTitle = [ '行号', '人员名称', '部门名称', '职务', '是否为负责人' ];
			var subcontractTableTitleCode = [ 'line_num', 'person_desc',
					'unit_desc', 'position_desc', 'principal_flag' ];
			var subcontractTableWidth = [ 1, 1, 1, 1, 1 ];
	
			// 标题
			addSubTitle(surveyDocument, '供应商人员及部门');
	
			// 输出表格
			addDetailTable(surveyDocument, datas, subcontractTableTitle,
					subcontractTableTitleCode, subcontractTableWidth, fontChinese);
		}
	}
	
	function addHnCertReportJundage(surveyDocument) {
	
		// 设置格式
		var vendor1 = [ '优秀供应商:', '得分≥85分以上', '', '' ];
		var vendor2 = [ '良好供应商:', '70≤得分＜85分', '', '' ];
		var vendor3 = [ '待改进供应商:', '60≤得分＜70分', '', '' ];
		var vendor4 = [ '不合格供应商:',
				'得分＜60分以下，作为原则,不予考虑，但如因公司业务需要以及拥有核心技术优势独家生产需继续合作使用，采购负责人需进行特批申请。',
				'', '' ];
		var vendor5 = [
				'备注:',
				'各评分条块（采购，技术，质量）都需满足60分，否则供应商判定为不合格；若有一个条块得分小于70分，则为待改进供应商，需改进后再次评价。',
				'', '' ];
	
		// 设置标题和分割线
		addSubTitle(surveyDocument, '判定依据');
	
		// 按行添加数据
		addHeaderRow(surveyDocument, vendor1, 2, 4, 100);
		addHeaderRow(surveyDocument, vendor2, 2, 4, 100);
		addHeaderRow(surveyDocument, vendor3, 2, 4, 100);
		addHeaderRow(surveyDocument, vendor4, 2, 4, 100);
		addHeaderRow(surveyDocument, vendor5, 2, 4, 100);
	}
	
	// 评审结果及意见
	function addHnCertReportResult(surveyDocument) {
		var datas = $ctx.model.getChild("header").getChildren();
		if (!isEmpty(datas)) {
			// 设置格式
			var vendor1 = [ '最终得分:', getValue(datas[0].final_score), '评审结果:',
					getValue(datas[0].assess_result_desc) ];
			var vendor2 = [ '综合意见:', getValue(datas[0].general_opinion) ];
	
			// 设置标题和分割线
			addSubTitle(surveyDocument, '评审结果及意见');
	
			// 按行添加数据
			addHeaderRow(surveyDocument, vendor1, 4, 4, 100);
			addHeaderRow(surveyDocument, vendor2, 2, 4, 100);
	
		}
	}
	
	function addHnCertLine3(surveyDocument) {
		var score = $ctx.model.getChild("score").getChildren();
		var module = $ctx.model.getChild("module").getChildren();
		var prj_detail = $ctx.model.getChild("prj_detail").getChildren();
		if (!isEmpty(score)) {
			var ScoreTableTitle = [ '评估类型', '评分人员', '得分', '权重(%)', '折算得分',
					'是否一票否决', '情况说明' ];
			var ScoreTableTitleCode = [ 'visit_direction',
					'source_user_name', 'score', 'occupation_weight',
					'conversion_score', 'one_vote', 'description_info' ];
			var ScoreTableWidth = [ 1, 1, 1, 1, 1, 1, 2 ];
	
			// 标题
			// addTitle(surveyDocument, '评分人员');
	
			// 输出表格
			// addDetailTable(surveyDocument, score, ScoreTableTitle,
			// ScoreTableTitleCode, ScoreTableWidth, fontChinese);
	
			var ModuleTableTitle = [ '考察模块', '得分' ];
			var ModuleTableTitleCode = [ 'visit_module', 'score' ];
			var ModuleTableWidth = [ 2, 1 ];
	
			// 标题
			// addTitle(surveyDocument, '考察模块');
	
			// 输出表格
			// addDetailTable(surveyDocument, module, ModuleTableTitle,
			// ModuleTableTitleCode, ModuleTableWidth, fontChinese);
	
			var PrjdetailTableTitle = [ '行号', '考察评估项目', '评分标准', '满分', '得分', '权重分',
					'最终得分', '询问对象及场所', '备注' ];
			var PrjdetailTableTitleCode = [ 'line_num', 'visit_project',
					'score_standard', 'full_score', 'score', 'weight_score',
					'final_score', 'inquiries_and_places', 'approve_result' ];
			var PrjdetailTableWidth = [ 1, 2, 7, 1, 1, 1, 1, 2, 2 ];
			// 测试
			// var vendor1 = [ 'SCORE_ID', getValue(score[0].score_id),
			// 'MODULE:', getValue(module[5].score_id) ];
			// if(score[1].score_id==1121){
			// var vendor2 = [ '分数id', getValue(score[0].score_id),
			// '分数id:', getValue(score[1].score_id) ];
			// addHeaderRow(surveyDocument, vendor2, 4, 4, 100);
			// }
			// addHeaderRow(surveyDocument, vendor1, 4, 4, 100);
	
			// 标题
			// addTitle(surveyDocument, '考察项目明细');
	
			// 输出表格
			// addDetailTable(surveyDocument, prj_detail, PrjdetailTableTitle,
			// PrjdetailTableTitleCode, PrjdetailTableWidth, fontChinese);
			a: for (var i = 0; i < score.length; i++) {
				addTitle(surveyDocument, '评分人员');
				addDetailTable3(surveyDocument, score, ScoreTableTitle,
						ScoreTableTitleCode, ScoreTableWidth, fontChinese, i, 1);
				b: for (var j = 0; j < module.length; j++) {
					if (module[j].score_id == score[i].score_id) {
						addTitle(surveyDocument, '');
						addDetailTable3(surveyDocument, module, ModuleTableTitle,
								ModuleTableTitleCode, ModuleTableWidth,
								fontChinese, j, 1);
						c: for (var k = 0, flag = 1; k < prj_detail.length; k++) {
							if (module[j].module_id == prj_detail[k].module_id) {
								addDetailTable3(surveyDocument, prj_detail,
										PrjdetailTableTitle,
										PrjdetailTableTitleCode,
										PrjdetailTableWidth, fontChinese, k, flag);
								flag++;
							}
						}
	
					}
				}
	
			}
	
			// for (var i = 0; i < score.length; i++) {
			//			
			// addTitle(surveyDocument, '评分人员');
			// addDetailTable3(surveyDocument, score, ScoreTableTitle,
			// ScoreTableTitleCode, ScoreTableWidth, fontChinese, i);
			//			
			// for (var j = 0; j < module.length; j++) {
			// if(score[0].score_id == module[j].score_id){
			// addDetailTable3(surveyDocument, module, ModuleTableTitle,
			// ModuleTableTitleCode, ModuleTableWidth,
			// fontChinese, j);
			// }
			// for (var k = 0; k < prj_detail.length; k++) {
			// }
			//				
			// }
			// }
	
		}
		}
	
	    // 主函数
	    function exportToPdf() {
	
		var datas = $ctx.model.getChild("header").getChildren();
	
		// 新建文件对象
		var surveyDocument = new Document();
	
		// 获取 context 的数据
		var context = $ctx.getData();
	
		// 初始化实例
		var serviceInstance = ServiceInstance.getInstance(context);
		var request = serviceInstance.getRequest();
	
		// 获取当前工程路径
		var file = request.getSession().getServletContext().getRealPath(
				File.separator);
	
		// pdf文档保存路径
		var fileRoute = file + '/attached/'
				+ getValue(datas[0].assess_report_number) + ".pdf";
		parameter.fileName = '/attached/' + getValue(datas[0].assess_report_number)
				+ ".pdf";
	
		var writer = PdfWriter.getInstance(surveyDocument, new FileOutputStream(
				fileRoute));
	
		// 打开文件，开始写入
		surveyDocument.open();
	
		// 设置 logo
		// var img = Image.getInstance(file + 'images/suguang.png');
		// img.scalePercent(70);
		// img.setAlignment(Element.ALIGN_LEFT);
		// //img.setAbsolutePosition(20, 770);
		// surveyDocument.add(img);
	
		// 设置pdf标题
		var pf = new Paragraph(getValue(datas[0].company_name), fontChineseBig);
		pf.setAlignment(Element.ALIGN_CENTER);
		pf.setSpacingAfter(10);
		surveyDocument.add(pf);
		pf = new Paragraph("现场考察评估报告", fontChineseBold);
		pf.setAlignment(Element.ALIGN_CENTER);
		pf.setSpacingAfter(20);
		surveyDocument.add(pf);
	
		// 寻源方案
		addHnCertReportScheme(surveyDocument);
		addfndsourceInspLineInfo(surveyDocument);
		addfndsourceVendorLineInfo(surveyDocument);
		addHnCertReportJundage(surveyDocument);
		addHnCertReportResult(surveyDocument);
		addHnCertLine3(surveyDocument);
	
		surveyDocument.close();
	}

    


----------

# js校验 #


----------

前台时间大小判断


    //时间格式化
    function timeStamp2String(time) {
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date;
    }
    
    
    //比较时间大小
    function compareDate(checkStartDate, checkEndDate) {
    var arys1 = new Array();
    var arys2 = new Array();
    if (checkStartDate != null && checkEndDate != null) {
    arys1 = checkStartDate.split('-');
    var sdate = new Date(arys1[0], parseInt(arys1[1] - 1), arys1[2]);
    arys2 = checkEndDate.split('-');
    var edate = new Date(arys2[0], parseInt(arys2[1] - 1), arys2[2]);
    if (sdate > edate) {
    return true;
    } else {
    return false;
    }
    }
    }

身份证校验：

    function hn_fnd9100_legal_identity_num_check(record, name, value) {
    var hn_re = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
    var data = $('fnd_enterprise_ds').getCurrentRecord().data;
    if (data['legal_rep_identity_type'] == 'ID_CARD' && typeof(data['legal_rep_identity_num']) != 'undefined') {
    if (hn_re.test(data['legal_rep_identity_num'])) {
    return true;
    } else {
    return '${l:HN_REGISER.LEGAL_REP_IDENTITY_NUM}';
    }
    }
    return true;
    
    }

名字只能是中文和英文：


    function hn_fnd9100_legal_name_check(record, name, value) {
    var name = /^[\u4E00-\u9FA5A-Za-z]+$/;
    var data = $('fnd_enterprise_ds').getCurrentRecord().data;
    if (name.test(data['legal_rep_name'])) {
    return true;
    } else {
    return '${l:HN_REGISER.ALL_NAME!}';
    }
    return true;
    
    }


# 正则表达式 #


----------



    一、校验数字的表达式
    
    1 数字：^[0-9]*$ 
    
    2 n位的数字：^\d{n}$
    
    3 至少n位的数字：^\d{n,}$ 
    
    4 m-n位的数字：^\d{m,n}$ 
    
    5 零和非零开头的数字：^(0|[1-9][0-9]*)$ 
    
    6 非零开头的最多带两位小数的数字：^([1-9][0-9]*)+(.[0-9]{1,2})?$ 
    
    7 带1-2位小数的正数或负数：^(\-)?\d+(\.\d{1,2})?$ 
    
    8 正数、负数、和小数：^(\-|\+)?\d+(\.\d+)?$ 
    
    9 有两位小数的正实数：^[0-9]+(.[0-9]{2})?$
    
    10 有1~3位小数的正实数：^[0-9]+(.[0-9]{1,3})?$
    
    11 非零的正整数：^[1-9]\d*$ 或 ^([1-9][0-9]*){1,3}$ 或 ^\+?[1-9][0-9]*$
    
    12 非零的负整数：^\-[1-9][]0-9"*$ 或 ^-[1-9]\d*$
    
    13 非负整数：^\d+$ 或 ^[1-9]\d*|0$
    
    14 非正整数：^-[1-9]\d*|0$ 或 ^((-\d+)|(0+))$
    
    15 非负浮点数：^\d+(\.\d+)?$ 或 ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$
    
    16 非正浮点数：^((-\d+(\.\d+)?)|(0+(\.0+)?))$ 或 ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$
    
    17 正浮点数：^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$ 或 ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
    
    18 负浮点数：^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$ 或 ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
    
    19 浮点数：^(-?\d+)(\.\d+)?$ 或 ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$
    
    二、校验字符的表达式
    
    1 汉字：^[\u4e00-\u9fa5]{0,}$ 
    
    2 英文和数字：^[A-Za-z0-9]+$ 或 ^[A-Za-z0-9]{4,40}$ 
    
    3 长度为3-20的所有字符：^.{3,20}$ 
    
    4 由26个英文字母组成的字符串：^[A-Za-z]+$ 
    
    5 由26个大写英文字母组成的字符串：^[A-Z]+$ 
    
    6 由26个小写英文字母组成的字符串：^[a-z]+$ 
    
    7 由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$ 
    
    8 由数字、26个英文字母或者下划线组成的字符串：^\w+$ 或 ^\w{3,20}$ 
    
    9 中文、英文、数字包括下划线：^[\u4E00-\u9FA5A-Za-z0-9_]+$
    
    10 中文、英文、数字但不包括下划线等符号：^[\u4E00-\u9FA5A-Za-z0-9]+$ 或 ^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$
    
    11 可以输入含有^%&',;=?$\"等字符：[^%&',;=?$\x22]+
    
    12 禁止输入含有~的字符：[^~\x22]+
    
    三、特殊需求表达式
    
    1 Email地址：^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$ 
    
    2 域名：[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.? 
    
    3 InternetURL：[a-zA-z]+://[^\s]* 或 ^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$ 
    
    4 手机号码：^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$ 
    
    5 电话号码("XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX)：^(\(\d{3,4}-)|\d{3.4}-)?\d{7,8}$  
    
    6 国内电话号码(0511-4405222、021-87888822)：\d{3}-\d{8}|\d{4}-\d{7} 
    
    7 身份证号(15位、18位数字)：^\d{15}|\d{18}$ 
    
    8 短身份证号码(数字、字母x结尾)：^([0-9]){7,18}(x|X)?$ 或 ^\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18}?$ 
    
    9 帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
    
    10 密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：^[a-zA-Z]\w{5,17}$
    
    11 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$
    
    12 日期格式：^\d{4}-\d{1,2}-\d{1,2}
    
    13 一年的12个月(01～09和1～12)：^(0?[1-9]|1[0-2])$
    
    14 一个月的31天(01～09和1～31)：^((0?[1-9])|((1|2)[0-9])|30|31)$
    
    15 钱的输入格式：
    
    16 1.有四种钱的表示形式我们可以接受:"10000.00" 和 "10,000.00", 和没有 "分" 的 "10000" 和 "10,000"：^[1-9][0-9]*$
    
    17 2.这表示任意一个不以0开头的数字,但是,这也意味着一个字符"0"不通过,所以我们采用下面的形式：^(0|[1-9][0-9]*)$
    
    18 3.一个0或者一个不以0开头的数字.我们还可以允许开头有一个负号：^(0|-?[1-9][0-9]*)$
    
    19 4.这表示一个0或者一个可能为负的开头不为0的数字.让用户以0开头好了.把负号的也去掉,因为钱总不能是负的吧.下面我们要加的是说明可能的小数部分：^[0-9]+(.[0-9]+)?$
    
    20 5.必须说明的是,小数点后面至少应该有1位数,所以"10."是不通过的,但是 "10" 和 "10.2" 是通过的：^[0-9]+(.[0-9]{2})?$
    
    21 6.这样我们规定小数点后面必须有两位,如果你认为太苛刻了,可以这样：^[0-9]+(.[0-9]{1,2})?$
    
    22 7.这样就允许用户只写一位小数.下面我们该考虑数字中的逗号了,我们可以这样：^[0-9]{1,3}(,[0-9]{3})*(.[0-9]{1,2})?$
    
    23 8.1到3个数字,后面跟着任意个 逗号+3个数字,逗号成为可选,而不是必须：^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$
    
    24 备注：这就是最终结果了,别忘了"+"可以用"*"替代如果你觉得空字符串也可以接受的话(奇怪,为什么?)最后,别忘了在用函数时去掉去掉那个反斜杠,一般的错误都在这里
    
    25 xml文件：^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$
    
    26 中文字符的正则表达式：[\u4e00-\u9fa5]
    
    27 双字节字符：[^\x00-\xff] (包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))
    
    28 空白行的正则表达式：\n\s*\r (可以用来删除空白行)
    
    29 HTML标记的正则表达式：<(\S*?)[^>]*>.*?</\1>|<.*? /> (网上流传的版本太糟糕，上面这个也仅仅能部分，对于复杂的嵌套标记依旧无能为力)
    
    30 首尾空白字符的正则表达式：^\s*|\s*$或(^\s*)|(\s*$) (可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)
    
    31 腾讯QQ号：[1-9][0-9]{4,} (腾讯QQ号从10000开始)
    
    32 中国邮政编码：[1-9]\d{5}(?!\d) (中国邮政编码为6位数字) 33 IP地址：\d+\.\d+\.\d+\.\d+ (提取IP地址时有用) 34 IP地址：((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)) 
    

## 游标向表中插入多条数据 ##


----------

    decale
    
    
     CURSOR hn_site_cursor IS
      SELECT hl.unit_desc,
     hl.cert_team_employee_name person_desc,
     'INSP' person_type_code,
     hl.employee_position position_desc,
     nvl(hl.team_leader_flag, 'N') principal_flag
    FROM hn_cert_plan_team_line hl
       WHERE hl.head_id = (SELECT DISTINCT hd.head_id
     FROM hn_cert_plan_head hd
    WHERE hd.cert_plan_no = p_cert_plan_no);
    
    
    begin
     --默认将现场考察计划的人员插入
    OPEN hn_site_cursor;
    LOOP
      FETCH hn_site_cursor
    INTO v_unit_desc,
     v_person_desc,
     v_person_type_code,
     v_position_desc,
     v_principal_flag;
      EXIT WHEN hn_site_cursor%NOTFOUND;
      hn_cert_site_assess_report_pkg.site_report_line_person_insert(p_head_id  => o_head_id,
    p_line_num => 1,
    p_person_desc  => v_person_desc,
    p_unit_desc=> v_unit_desc,
    p_position_desc=> v_position_desc,
    p_principal_flag   => v_principal_flag,
    p_person_type_code => v_person_type_code,
    p_user_id  => p_user_id);
    
    END LOOP;
    CLOSE hn_site_cursor;
    
    end；


# 权限控制 #

bm文件：

    头部：
    <bm:model xmlns:s="aurora.plugin.script" xmlns:bm="http://www.aurora-framework.org/schema/bm">
    
    select 语句后面：
    #AUTHORIY_FROM# #WHERE_CLAUSE# #AUTHORIY_WHERE# #ORDER_BY_CLAUSE#
    
    <bm:data-filters>
    <bm:data-filter expression="1=1"/>
    </bm:data-filters>


    <authority foundation_code="HN_CERT_PLAN">
    <authority-segment source_alias="v" source_name="useless_id" type="CREATER"/>
    <authority-segment source_alias="v" source_name="owner_company_id" type="COMPANY"/>
    <authority-segment source_alias="v" source_name="useless_id" type="RECEIVER"/>
    <authority-segment source_alias="v" source_name="business_unit_id" type="BUSINESS_UNIT"/>
    <authority-segment source_alias="v" source_name="useless_id" type="PUR_ORGANIZATION"/>
    <authority-segment source_alias="v" source_name="useless_id" type="PUR_BUYER"/>
    <authority-segment source_alias="v" source_name="inv_organization_id" type="INV_ORGANIZATION"/>
    <authority-segment source_alias="v" source_name="useless_id" type="SD_ORGANIZATION"/>
    <authority-segment source_alias="v" source_name="coop_company_id" type="VENDOR"/>
    <authority-segment source_alias="v" source_name="useless_id" type="CLIENT"/>
    <authority-segment source_alias="v" source_name="useless_id" type="PURHASE_MATERIAL"/>
    <authority-segment source_alias="v" source_name="useless_id" type="SALES_PRODUCTION"/>
    <authority-segment source_alias="v" source_name="useless_id" type="CLIENT_SITE"/>
    <authority-segment source_alias="v" source_name="useless_id" type="VENDOR_SITE"/>
    <authority-segment source_alias="v" source_name="unit_id" type="UNIT"/>
    </authority>
    <bm:features>
    <s:bm-script><![CDATA[
    var cx = Packages.aurora.javascript.Context.getCurrentContext();
    Packages.aurora.plugin.script.engine.ScriptImportor.defineExternScript(cx, this, $ctx.getData(), "fnd_flex_dynamic_tools.js");
    Packages.aurora.plugin.script.engine.ScriptImportor.defineExternScript(cx, this, $ctx.getData(), "fnd_dynamic_authority.js");
    ]]></s:bm-script>
    </bm:features>


# 页面开发 #


----------


附件上传

    var head_id = '${/parameter/@head_id}';
    
    
    function hn_cert1010_scene_inspection_edit_atta() {
    var url = '${/request/@context_path}/attachment_file_upload.screen?pkvalue=' + head_id + '&table_name=HN_CERT_PLAN_HEAD';
    new Aurora.Window({
    id: 'hn_cert1010_scene_inspection_edit_atta_win',
    title: '${l:HN.UPLOAD_ATTM}',
    url: url,
    width: 500,
    height: 400
    });
    }

附件下载

    function hn_fnd1010_vendor_source_detail_atta_download() {
    var url = '${/request/@context_path}/attachment_file_download.screen?pkvalue=' + head_id + '&table_name=HN_SOURCE_SCHEME_HEAD';
    new Aurora.Window({
    id: 'hn_fnd1010_vendor_source_detail_atta_win',
    title: '${l:HN.DOWNLOAD_ATTM}',
    url: url,
    width: 500,
    height: 400
    });
    }

操作记录:

    function hn_cert1010_option_record() {
    new Aurora.Window({
    id: 'operation_record_win',
    url: $('hn_cert1010_detail_option_record_query').getUrl() + '?operation_table_id=' + ${/parameter/@head_id} + '&operation_table=hn_cert_plan_head',
    title: '${l:HN.OPTION_RECORD}',
    height: 450,
    width: 600
    });
    }

操作记录页面：

    <?xml version="1.0" encoding="UTF-8"?>
    <a:screen xmlns:a="http://www.aurora-framework.org/application">
    <a:init-procedure><![CDATA[
    ]]></a:init-procedure>
    <a:view>
    <script><![CDATA[
    function operation_record_back() {
    $('operation_record_win').close();
    }
    ]]></script>
    <a:dataSets>
    <a:dataSet id="operation_record_ds" autoQuery="true" model="cux.HN.public.hn_operation_record_query" queryUrl="${/request/@context_path}/autocrud/cux.HN.public.hn_operation_record_query/query?operation_table=${/parameter/@operation_table}&amp;operation_table_id=${/parameter/@operation_table_id}"/>
    </a:dataSets>
    <a:screenTopToolbar>
    <a:toolbarButton click="operation_record_back" text="返回" width="100"/>
    </a:screenTopToolbar>
    <a:grid autoAppend="false" bindTarget="operation_record_ds" height="350" navBar="true" width="570">
    <a:columns>
    <a:column name="user_name" align="center" prompt="操作人" width="200"/>
    <a:column name="creation_date" align="center" prompt="操作日期" width="150"/>
    <a:column name="status_desc" align="center" prompt="状态" width="200"/>
    </a:columns>
    </a:grid>
    </a:view>
    </a:screen>


操作记录查询bm：

    <?xml version="1.0" encoding="UTF-8"?>
    <bm:model xmlns:bm="http://www.aurora-framework.org/schema/bm" needAccessControl="false">
    <bm:operations>
    <bm:operation name="query">
    <bm:query-sql><![CDATA[
    SELECT
    h.user_name,
    h.status_desc,
    h.operation_desc,
    TO_CHAR(h.creation_date, 'yyyy-mm-dd hh24:mi:ss') AS creation_date
    FROM
    hn_operation_records h
    WHERE
    h.operation_table   =${@operation_table} AND
    h.operation_table_id=${@operation_table_id}
    ORDER BY
    creation_date DESC
    ]]></bm:query-sql>
    </bm:operation>
    </bm:operations>
    </bm:model>

操作记录表：

    
    -- create table
    create table hn_operation_records
    (
      record_id  number not null,
      user_idnumber,
      user_name  varchar2(240),
      status varchar2(30),
      status_descvarchar2(100),
      operation_desc varchar2(2000),
      operation_tablevarchar2(30),
      operation_table_id number,
      created_by number,
      creation_date  date,
      last_updated_bynumber,
      last_update_date   date
    );
    -- add comments to the table 
    comment on table hn_operation_records
      is '操作记录';
    -- create/recreate indexes 
    create index hn_operation_records_n1 on hn_operation_records (operation_table, operation_table_id);
    -- create/recreate primary, unique and foreign key constraints 
    alter table hn_operation_records
      add primary key (record_id);
    --sequence
    create sequence hn_operation_records_s;
创建表

		-- create table
		create table hn_cert_plan_head
		(
		  head_id                   number not null,
		  cert_plan_no              varchar2(100),
		  unit_id                   varchar2(100),
		  vendor_code               varchar2(100),
		  cert_start_date           date,
		  cert_end_date             date,
		  cert_target               varchar2(3000),
		  cert_status               varchar2(100),
		  delete_falg               varchar2(1),        
		  business_group            varchar2(100),
		  attribute1                varchar2(100),
		  attribute2                varchar2(100),
		  attribute3                varchar2(100),
		  attribute4                varchar2(100),
		  attribute5                varchar2(100),
		  attribute6                varchar2(100),
		  attribute7                varchar2(100),
		  attribute8                varchar2(100),
		  attribute9                varchar2(100),
		  attribute10               varchar2(100),
		  attribute11               varchar2(100),
		  attribute12               varchar2(100),
		  attribute13               varchar2(100),
		  attribute14               varchar2(100),
		  attribute15               varchar2(100),
		  attribute16               varchar2(100),
		  attribute17               varchar2(100),
		  attribute18               varchar2(100),
		  attribute19               varchar2(100),
		  attribute20               varchar2(100),
		  created_by                number,
		  creation_date             date,
		  last_updated_by           number,
		  last_update_date          date
		);
		-- add comments to the table 
		comment on table hn_cert_plan_head
		  is '现场考察头表';
		-- add comments to the columns 
		comment on column hn_cert_plan_head.head_id
		  is '头ID';
		comment on column hn_cert_plan_head.cert_plan_no
		  is '计划单号';
		comment on column hn_cert_plan_head.unit_id
		  is '部门ID';
		comment on column hn_cert_plan_head.vendor_code
		  is '供应商编码';
		comment on column hn_cert_plan_head.cert_start_date
		  is '考察开始从';
		comment on column hn_cert_plan_head.cert_end_date
		  is '考察日期至';
		comment on column hn_cert_plan_head.cert_target
		  is '考察目标';
		comment on column hn_cert_plan_head.cert_status
		  is '考察状态';
		comment on column hn_cert_plan_head.delete_falg
		  is '删除标志';
		-- create/recreate primary, unique and foreign key constraints 
		alter table hn_cert_plan_head
		  add constraint hn_cert_plan_head_pk primary key (head_id);
		
		--sequence
		create sequence hn_cert_plan_head_s;

创建视图

	 CREATE OR REPLACE view hn_cert_plan_head_vl AS
	        SELECT h.head_id,
	               h.cert_plan_no,
	               h.unit_id,
	               un.unit_desc,
	               su.user_name,
	               h.vendor_code,
	               fcv.company_full_name,
	               to_char(h.cert_start_date,'yyyy-mm-dd') cert_start_date,
	               to_char(h.cert_end_date,'yyyy-mm-dd') cert_end_date,
	               h.cert_target,
	               h.cert_status,
	               (SELECT s.code_value_name
	                  FROM sys_code_values_v s
	                 WHERE s.code = 'HN_CERT_STATUS_SYSCODE'
	                   AND s.code_value = h.cert_status
	                   AND s.code_enabled_flag = 'Y'
	                   AND s.code_value_enabled_flag = 'Y') cert_status_desc,
	               h.delete_falg,
	               h.business_group,
	               h.attribute1,
	               h.attribute2,
	               h.attribute3,
	               h.attribute4,
	               h.attribute5,
	               h.attribute6,
	               h.attribute7,
	               h.attribute8,
	               h.attribute9,
	               h.attribute10,
	               h.attribute11,
	               h.attribute12,
	               h.attribute13,
	               h.attribute14,
	               h.attribute15,
	               h.attribute16,
	               h.attribute17,
	               h.attribute18,
	               h.attribute19,
	               h.attribute20,
	               h.created_by,
	               to_char(h.creation_date,'yyyy-mm-dd') create_date_desc,
	               h.last_updated_by,
	               h.last_update_date
	          FROM hn_cert_plan_head h ,
	          (SELECT distinct hu.unit_desc,hu.unit_id
	  FROM hrm_positions         hp,
	       hrm_units_vl          hu,
	       hrm_employee_user     heu,
	       hrm_employee_position hep
	 WHERE hu.unit_id = hp.unit_id
	   AND hp.position_id = hep.position_id
	   AND hep.employee_id = heu.employee_id
	   AND heu.primary_user_flag = 'Y'
	   AND hep.primary_position_flag = 'Y') un,
	   (select fc.company_code,fc.company_full_name from fnd_companies_vl fc where fc.enabled_flag='Y' and fc.supply_flag='Y') fcv,
	   (SELECT
	                        u.user_id,
	                        u.user_name user_code,
	                        u.user_desc user_name
	                    FROM
	                        sys_user_v u) su
	          where h.unit_id=un.unit_id
	          and h.vendor_code = fcv.company_code
	          and h.created_by=su.user_id
	    

表增加字段

    -- add/modify columns 
    alter table bid_clarifications add technology_comments varchar2(3000);
    -- add comments to the columns 
    comment on column bid_clarifications.technology_comments
    is 'xxx';

表修改：

    alter table 表名 modify （字段名1 类型,字段名2 类型,字段名3 类型.....）  
    alter table student modify(id number(4));---将student表中id字段改为number，长度4   
    alter table student modify(id number(4),studentName varchar2(100));
 

值集：

    <a:dataSet id="hn_fnd1010_scheme_type_ds" lookupCode="HN_SCHEME_TYPE_SYSCODE"/>
    
    <a:field name="scheme_type_desc" displayField="code_value_name" options="hn_fnd1010_scheme_type_ds" returnField="scheme_type_code" valueField="code_value"/>

勾选框：


    <a:field name="method_dept_recommend_flag" checkedValue="Y" defaultValue="N" uncheckedValue="N"/>

lov：

    <a:field name="unit_name" lovHeight="510" lovService="cux.HN.public.hn_hrm_unit_lov" lovWidth="600" readOnly="true" title="HN.UNIT_NAME">
    	<a:mapping>
    		<a:map from="unit_id" to="unit_id"/>
    		<a:map from="unit_code" to="unit_code"/>
    		<a:map from="unit_name" to="unit_name"/>
    		</a:mapping>
    </a:field>

lov bm文件：

    <?xml version="1.0" encoding="UTF-8"?>
    <bm:model xmlns:bm="http://www.aurora-framework.org/schema/bm" needAccessControl="false">
    <bm:operations>
        <bm:operation name="query">
            <bm:query-sql><![CDATA[
                SELECT
                    *
                FROM
                    (SELECT
                        u.unit_id,
                        u.unit_code,
                        u.unit_desc unit_name
                    FROM
                        hrm_units_vl u
                    WHERE
                        u.business_group=${/session/@business_group} AND
                        u.enabled_flag  ='Y'
                    ORDER BY
                        u.unit_code
                    ) v #WHERE_CLAUSE#
            ]]></bm:query-sql>
        </bm:operation>
    </bm:operations>
    <bm:fields>
        <bm:field name="unit_id"/>
        <bm:field name="unit_code" displayWidth="150" forDisplay="true" forQuery="true" prompt="HN.UNIT_CODE"/>
        <bm:field name="unit_name" displayWidth="200" forDisplay="true" forQuery="true" prompt="HN.UNIT_NAME"/>
    </bm:fields>
    <bm:query-fields>
        <bm:query-field name="unit_code" queryExpression="v.unit_code like &apos;%&apos;||${@unit_code}||&apos;%&apos;"/>
        <bm:query-field name="unit_name" queryExpression="v.unit_name like &apos;%&apos;||${@unit_name}||&apos;%&apos;"/>
    </bm:query-fields>
    </bm:model>


# aurora js 函数 #


----------


更新事件：

	function hn_fnd1010_vendor_source_create_head_update(ds, record, name, value, oldvalue) {
            
                if (name == 'scheme_type_code') {
                    if (value == 'EQUIPMENT') {
                        record.getField('item_type_desc').setRequired(true); /*combobox选中装备供应商寻源方案 则控制div打开*/
                        document.getElementById('hn_fnd1010_Lmaterial_certification_requirements_div').style.display = "block";
                    } else {
                        record.getField('item_type_desc').setRequired(false);
                        document.getElementById('hn_fnd1010_Lmaterial_certification_requirements_div').style.display = "none";
                    }
                } else if (name == 'category_id') {
                    record.set('item_id', '');
                    record.set('item_code', '');
                    record.set('item_name', '');
                    if (value) {
                        record.getField('item_code').setRequired(false);
                        record.getField('item_code').setReadOnly(false);
                        record.getField('item_code').setLovPara('category_id', value);
                    } else {
                        record.getField('item_code').setRequired(false);
                        record.getField('item_code').setReadOnly(true);
                        record.getField('item_code').setLovPara('category_id', '');//设置lov参数
                    }
                } else if (name == 'reason_others_flag') {
                    if (value == 'Y') {
                        record.getField('vendor_reason_remark').setRequired(true);
                        document.getElementById('hn_fnd1010_vendor_reason_remark_div').style.display = "block";
                    } else {
                        record.set('vendor_reason_remark', '');
                        record.getField('vendor_reason_remark').setRequired(false);
                        document.getElementById('hn_fnd1010_vendor_reason_remark_div').style.display = "none";
                    }
                } else if (name == 'vendor_type_code') {
                    if (value == 'OTHERS') {
                        record.getField('vendor_type_remark').setRequired(true);
                        document.getElementById('hn_fnd1010_vendor_type_remark_div').style.display = "block";
                    } else {
                        record.set('vendor_type_remark', '');
                        record.getField('vendor_type_remark').setRequired(false);
                        document.getElementById('hn_fnd1010_vendor_type_remark_div').style.display = "none";
                    }
                } else if (name == 'method_others_flag') {
                    if (value == 'Y') {
                        record.getField('vendor_method_remark').setRequired(true);
                        document.getElementById('hn_fnd1010_vendor_method_remark_div').style.display = "block";
                    } else {
                        record.set('vendor_method_remark', '');
                        record.getField('vendor_method_remark').setRequired(false);
                        document.getElementById('hn_fnd1010_vendor_method_remark_div').style.display = "none";
                    }
                } else if (name == 'need_others_flag') {
                    if (value == 'Y') {
                        record.getField('need_meterial_certification').setRequired(true);
                        document.getElementById('hn_fnd1010_vendor_need_remark_div').style.display = "block";
                    } else {
                        record.set('need_meterial_certification', '');
                        record.getField('need_meterial_certification').setRequired(false);
                        document.getElementById('hn_fnd1010_vendor_need_remark_div').style.display = "none";
                    }
                } else if (name == 'need_not_suitable_flag') {
                    if (value == 'Y') {
                        record.getField('need_not_suitable').setRequired(true);
                        document.getElementById('hn_fnd1010_vendor_need_not_suitable_div').style.display = "block";
                    } else {
                        record.set('need_not_suitable', '');
                        record.getField('need_not_suitable').setRequired(false);
                        document.getElementById('hn_fnd1010_vendor_need_not_suitable_div').style.display = "none";
                    }
                }
                if (name == 'item_type_code') {
                    if (value == 'COATER_MADE') {
                        document.getElementById('hn_fnd1010_need_sublots_test_div').style.display = "block";
                        document.getElementById('hn_fnd1010_need_proto_test_div').style.display = "none";
                    }
                    if (value == 'EQUIPMENT') {
                        document.getElementById('hn_fnd1010_need_proto_test_div').style.display = "block";
                        document.getElementById('hn_fnd1010_need_sublots_test_div').style.display = "none";
                    }
                }
            
            
            }


主页面行里面 链接函数 

	function hn_fnd1010_renderer(value, record, name) {
                var head_id = record.get('head_id');
                var scheme_number = record.get('scheme_number');
                var scheme_status = record.get('scheme_status');
                if (name == 'scheme_number') {
                    return '<a href="javascript:hn_fnd1010_vendor_source_edit(' + head_id + ',' + '\'' + scheme_status + '\'' + ')">' + value + '</a>';
                } else if (name == 'option_record') {
                    return '<a href="javascript:hn_fnd1010_option_record(' + head_id + ')">${l:HN.OPTION_RECORD}</a>';
                }
            }

	function hn_fnd1010_vendor_source_edit(head_id, scheme_status) {
                var url = $('hn_fnd1010_vendor_source_query_link').getUrl();
                var titel = '${l:HN_FND.VENDOR_SOURCE_DETAIL}';
                if (scheme_status == 'NEW' || scheme_status == 'REJECTED') {
                    url = $('hn_fnd1010_vendor_source_edit_link').getUrl();
                    titel = '${l:HN_FND.VENDOR_SOURCE_EDIT}';
                }
                new Aurora.Window({
                    id: 'hn_vendor_source_detail_win',
                    url: url + '?head_id=' + head_id + '&scheme_status=' + scheme_status + '&show_back_flag=Y',
                    title: titel,
                    fullScreen: true
                });
            }

行号自动增加

			function create_line_num_add(dataSet, record, index) {
                // 生成行号
                records = dataSet.getAll();
                var line_num = 0;
                if (records.length > 1) {
                    for (var t = 0;t < records.length;t++) {
                        if (line_num < records[t].get('line_num')) {
                            line_num = records[t].get('line_num');
                        }
                    }
                }
                record.set('line_num', line_num * 1 + 1);
            }

	dataset 事件加入：
				<a:events>
                    <a:event name="add" handler="create_line_num_add"/>
                </a:events>


## 部门权限管理 ##

				//部门
                var pur_unit = $('sys8220_fnd_user_authority_unit_result_ds').getAll();
                if ($('sys8220_fnd_user_authority_unit_result_ds').validate()) {
	                for (var p = 0;p < pur_unit.length;p++) {
	                    if (pur_unit[p].get('checked') == 'Y') {
	                        pur_unit[p].set('user_id', '${/parameter/@user_id}');
	                        pur_unit[p].set('authority_type', 'UNIT');
	                        pur_unit[p].set('assign_id', pur_unit[p].get('authority_id'));
		                    authority.push(pur_unit[p].data);
	                    }
	                }
                } else {
                    return false;
                }





			/**************************************************************
             * 定位查询开始，部门
             **************************************************************/
            
            /**************************************************************
             * 静态全局参数说明：
             * 	每组数据查询所需多个全局变量(多个数据多组变量，分别以_01,_02...表示)
             *	参数1：显示位置（初始为0）
             *	参数2：匹配结果数组
             *	参数3：是否初始化匹配结果数组标识
             **************************************************************/
            var show_index_09 = 0; //显示位置
            var row_list_09 = []; //匹配结果数组
            var init_flag_09 = false; //初始化标识
            /**************************************************************
             * 动态全局参数说明：
             * 	每组数据查询所需多个全局变量(多个数据多组变量，分别以_01,_02...表示)
             *	参数1：grid绑定的DS对象
             *	参数2：查询条件绑定的DS对象
             *	参数3：grid对象
             *	参数4：查询条件的参数名称
             *	参数5：查询匹配的参数名称（可以有多个，用_1,_2表示）
             **************************************************************/
            var grid_ds_09 = 'sys8220_fnd_user_authority_unit_result_ds'; //grid绑定的DS
            var query_ds_09 = 'sys8220_fnd_user_authority_unit_query_ds'; //查询条件绑定的DS
            var grid_09 = 'sys8220_fnd_user_authority_unit_result_ds_grid'; //grid对象
            var query_name_09 = 'data_code_name'; //查询条件的参数名称
            var indexof_09_1 = 'data_name'; //匹配参数1
            var indexof_09_2 = 'data_code'; //匹配参数2
            //初始全局变量
            
            function initGlobalPara_09() {
                show_index_09 = 0;
                row_list_09 = [];
                init_flag_09 = false;
            }
            
            //初始化定位数组
            
            function initRowList_09(para) {
            
                //获取树形结果数据
                var records = $(grid_ds_09).getAll();
            
                //对数据进行遍历
                for (var i = 0;i < records.length;i++) {
            
                    //判断是否包含当前查询字符，包含则将其位置放入匹配结果数组
                    if (!Aurora.isEmpty(records[i].get(indexof_09_1))) {
                        if (records[i].get(indexof_09_1).indexOf(para) != -1 || records[i].get(indexof_09_1).indexOf(para.toUpperCase()) != -1) {
                            row_list_09.push($(grid_ds_09).indexOf(records[i]));
                        }
                    }
            
                    if (!Aurora.isEmpty(records[i].get(indexof_09_2))) {
                        if (records[i].get(indexof_09_2).indexOf(para) != -1 || records[i].get(indexof_09_2).indexOf(para.toUpperCase()) != -1) {
                            row_list_01.push($(grid_ds_09).indexOf(records[i]));
                        }
                    }
                }
            
                //改变初始化标识
                init_flag_09 = true;
            }
            
            //查询按钮执行方法
            
            function sys8220_fndUserAuthorityUnitQuery() {
            
                //获取查询条件字符串
                var record = $(query_ds_09).getCurrentRecord();
            
                //判断查询条件的值是否为空，为空不做查询操作
                if (!Ext.isEmpty(record.get(query_name_09))) {
            
                    //判断是否初始化定位数组
                    if (!init_flag_09) {
                        initRowList_09(record.get(query_name_09));
                    }
            
                    //结果匹配数组有值时
                    if (row_list_09.length > 0) {
            
                        //显示匹配数组里的位置
                        $(grid_09).selectRow(row_list_09[show_index_09]);
            
                        //判断显示位置是否越界,没有则++，有责回到初始0
                        if (show_index_09 < row_list_09.length - 1) {
                            show_index_09++;
                        } else {
                            show_index_09 = 0;
                        }
                    }
                }
            }
            
            //查询dataset更新事件
            
            function sys8220_fndUserAuthorityUnitQueryDsUpdate(ds, record, name, value, oldvalue) {
                $(query_ds_09).getCurrentRecord().dirty = false;
                if (name == query_name_09) {
                    //查询条件改变，重置全局定位变量
                    initGlobalPara_09();
                }
            }
            /**************************************************************
             * 定位查询结束,部门
             **************************************************************/
 部门bm文件：

	<?xml version="1.0" encoding="UTF-8"?>
	!--
	    $Author: chenglu
	    $Date: 
	    $Revision: 
	    $Purpose: 子账户管理，权限管理页面，部门查询BM
	-->
	<bm:model xmlns:bm="http://www.aurora-framework.org/schema/bm">
    <bm:operations>
        <bm:operation name="query">
            <bm:query-sql><![CDATA[
	            select * from (
		SELECT t.unit_id AS data_id,
	       t.unit_code AS data_code,
	       t.unit_desc AS data_name,
	       t.company_id,
	       t.unit_id AS authority_id,
	       t.parent_unit_id AS parent_data_id,
	       (SELECT pu.unit_code || '-' || pu.unit_desc
	          FROM hrm_units_vl pu
	         WHERE pu.unit_id = t.parent_unit_id) AS parent_unit_display,
	       t.operate_unit_id,
	       t.chief_position_id,
	       t.org_unit_level_id,
	       t.enabled_flag,
	       t.assign_types_id,
	       NULL AS sequence,
	       NULL AS expand,
	       decode((SELECT fua.authority_id
	                FROM fnd_user_authority fua
	               WHERE fua.user_id = ${@user_id}
	                 AND fua.authority_type = 'UNIT'
	                 AND fua.assign_id = t.unit_id),
	              NULL,
	              'N',
	              'Y') AS checked,
	       'UNIT' AS authority_type
	  FROM hrm_units_vl t
	  where t.enabled_flag='Y'
	  AND t.business_group = ${/session/@business_group}) v
			]]></bm:query-sql>
        	</bm:operation>
	    </bm:operations>
	</bm:model>
 

# 邮件发送 


	1、在前台 事件维护中过程名配置：sys_notify_template_pkg.create_notify_common_evt（统一配置）
	   接收者类型维护 过程名自己写的（hn_emial_send_pkg.hn_admi_score_send）
	   代码：
	PROCEDURE hn_admi_score_send(p_message_id        NUMBER,
                               p_event_param       NUMBER,
                               p_recipient_id      NUMBER,
                               p_recipient_type_id NUMBER,
                               p_user_id           NUMBER) IS
  		BEGIN
    	--发送给准入评估人员
    FOR push_user_rec IN (SELECT DISTINCT su.user_id,
                                          su.email,
                                          su.description user_desc,
                                          su.mobile_phone
                            FROM hn_vendor_admi_report_head vah,
                                 hn_vendor_admi_report_line val,
                                 sys_user                   su
                           WHERE val.head_id = vah.head_id
                             AND val.score_user_id = su.user_id
                             AND nvl(su.frozen_flag, 'N') = 'N'
                             AND su.start_date <= SYSDATE
                             AND (su.end_date IS NULL OR su.end_date >= SYSDATE)
                             AND vah.head_id = p_event_param)
    LOOP
    
      sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                     p_recipient_type_id => p_recipient_type_id,
                                                     p_recipient_user_id => push_user_rec.user_id,
                                                     p_recipient_name    => push_user_rec.user_desc,
                                                     p_recipient_mobile  => push_user_rec.mobile_phone,
                                                     p_recipient_mail    => push_user_rec.email,
                                                     p_created_by        => p_user_id);
    END LOOP;
  	EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'HN_EMIAL_SEND_PKG',
                                                     p_procedure_function_name => 'hn_admi_score_send');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
 	 END hn_admi_score_send;


	事件消息模板：（【大写】）

	SELECT DISTINCT vah.admi_report_number  
	FROM hn_vendor_admi_report_head vah 
	WHERE
	vah.head_id=:pk_value 

	2、在需要触发事件的过程中维护触发事件：

	--发送邮件事件
    evt_event_core_pkg.fire_event(p_event_name => 'HN_ADMI_REPORT_ISSUE', p_event_param => p_head_id, p_created_by => p_user_id);

# bm文件 #

### 查询所有下级 ###

	SELECT  category_udf_id
	FROM mtl_categories_user_defined
	START   WITH category_udf_id= 895731
	CONNECT BY PRIOR category_udf_id = parent_category_udf_id;

# 包pkg抛出异常处理 #

	WHEN e_error THEN
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'HN_FND_SOURCE_RESULT_UNIQUE_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_token_1                 => '#VENDOR_NAME',
                                                      p_token_value_1           => v_vendor_name,
                                                      p_package_name            => c_hn_source_result_pkg,
                                                      p_procedure_function_name => 'source_result_line_insert');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => c_hn_source_result_pkg,
                                                     p_procedure_function_name => 'source_result_line_insert');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);

	消息代码维护：
			sys_message_pkg.delete_message('HN_FND_SOURCE_RESULT_UNIQUE_ERROR');
 			sys_message_pkg.insert_message('HN_FND_SOURCE_RESULT_UNIQUE_ERROR', '错误','<#VENDOR_NAME>供应商维护重复！','ZHS');
  			sys_message_pkg.insert_message('HN_FND_SOURCE_RESULT_UNIQUE_ERROR', 'Error','<#VENDOR_NAME>供应商维护重复！','US');

      
             


#eclipse 导出脚本设置 #

    aurora  -> editor ->
    
    WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
    WHENEVER OSERROR  EXIT FAILURE ROLLBACK;
    
    spool INSTALL_SERVICE_REGISTER.log
    
    set feedback off
    set define off
    begin
    
    	--页面注册
    <#if (pages)??>
       <#list pages as s>
    	sys_data_load_pkg.load_sys_service('${s.page_path}', '${s.page_name}', 1, 1, 0);
       </#list>
    </#if>
    
    	--功能定义
    <#if (function)??>
    	sys_data_load_pkg.load_sys_function('${function.function_code}', '${function.function_name}', '${function.function_name}', '${module.module_code}', 'F', 'SYSTEM', 'STANDARD', '${function.host_path}', '${function.function_order}', '', '');
    </#if>
    
    	--分配页面
    <#if (pages)??>
    	<#list pages as p>
    	sys_data_load_pkg.load_function_service('${function.host_path}', '${p.page_path}');
    	</#list>
    </#if>
    
    	--分配BM
    <#if (models)??>
    	<#list models as m>
    	sys_data_load_pkg.load_function_bm('${function.host_path}', '${m.bm_path}');
    	</#list>
    </#if>
    
    end;
    /
    
    commit;
    set feedback on
    set define on
    
    spool off
    
    exit


# Oracle定时任务 #

    1、创建job定时任务  实现自动调用存储过程

	declare
	  job number;
	BEGIN
	  DBMS_JOB.SUBMIT(  
	        JOB => job,  /*自动生成JOB_ID*/  
	        WHAT => 'proc_add_test;',  /*需要执行的存储过程名称或SQL语句*/  
	        NEXT_DATE => sysdate+3/(24*60),  /*初次执行时间-下一个3分钟*/  
	        INTERVAL => 'trunc(sysdate,''mi'')+1/(24*60)' /*每隔1分钟执行一次*/
	      );  
	  commit;
	end;

	2、可以通过查询系统表查看该job信息
	select * from user_jobs;

	3、手动sql调用job
		begin
	   		DBMS_JOB.RUN(40); /*40 job的id*/
	 	end;

	4、删除任务
		begin
	  		/*删除自动执行的job*/
	  		dbms_job.remove(40);
		end;

	5、停止job
	dbms.broken(job，broken，nextdate);   
	dbms_job.broken(v_job,true,next_date);        /*停止一个job,里面参数true也可是false，next_date（某一时刻停止）也可是sysdate（立刻停止）。 */

	6、修改间隔时间
	dbms_job.interval(job，interval);

	7、修改下次执行时间
	dbms_job.next_date(job，next_date);

	8、修改要执行的操作 
	dbms_job.what（jobno，'sp_fact_charge_code;'）；  --修改某个job名 

9、存job信息的表user_jobs主要字段说明

| 列名        | 数据类型           | 解释  |
| ------------- |:-------------:|:-----:|
|JOB	|NUMBER	|任务的唯一标示号
|LOG_USER	|VARCHAR2(30)	|提交任务的用户
|PRIV_USER	|VARCHAR2(30)	|赋予任务权限的用户
|SCHEMA_USER	|VARCHAR2(30)	|对任务作语法分析的用户模式
|LAST_DATE	|DATE	|最后一次成功运行任务的时间
|LAST_SEC	 |VARCHAR2(8)	|如HH24:MM:SS格式的last_date日期的小时，分钟和秒
|THIS_DATE	|DATE 	|正在运行任务的开始时间，如果没有运行任务则为null
|THIS_SEC	|VARCHAR2(8) 	|如HH24:MM:SS格式的this_date日期的小时，分钟和秒
|NEXT_DATE	|DATE	|下一次定时运行任务的时间
|NEXT_SEC	|VARCHAR2(8)	|如HH24:MM:SS格式的next_date日期的小时，分钟和秒
|TOTAL_TIME	|NUMBER	|该任务运行所需要的总时间，单位为秒
|BROKEN	|VARCHAR2(1)	|标志参数，Y标示任务中断，以后不会运行
|INTERVAL	|VARCHAR2(200)	|用于计算下一运行时间的表达式
|FAILURES	|NUMBER	|任务运行连续没有成功的次数
|WHAT	 |VARCHAR2(2000)	|执行任务的PL/SQL块

10.INTERVAL参数常用值示例

		1. 每天午夜12点            ''TRUNC(SYSDATE + 1)''     
		2. 每天早上8点30分         ''TRUNC(SYSDATE + 1) + （8*60+30）/(24*60)''     
		3. 每星期二中午12点         ''NEXT_DAY(TRUNC(SYSDATE ), ''''TUESDAY'''' ) + 12/24''     
		4. 每个月第一天的午夜12点    ''TRUNC(LAST_DAY(SYSDATE ) + 1)''     
		5. 每个季度最后一天的晚上11点 ''TRUNC(ADD_MONTHS(SYSDATE + 2/24, 3 ), ''Q'' ) -1/24''     
		6. 每星期六和日早上6点10分    ''TRUNC(LEAST(NEXT_DAY(SYSDATE, ''''SATURDAY"), NEXT_DAY(SYSDATE, "SUNDAY"))) + （6×60+10）/（24×60）''    
		7. 每3秒钟执行一次             'sysdate+3/(24*60*60)'   
		8. 每2分钟执行一次           'sysdate+2/(24*60)'    
		9. 1:每分钟执行  
		10. Interval => TRUNC(sysdate,'mi') + 1/ (24*60) --每分钟执行  
		11. interval => 'sysdate+1/（24*60）'  --每分钟执行  
		12. interval => 'sysdate+1'    --每天  
		13. interval => 'sysdate+1/24'   --每小时  
		14. interval => 'sysdate+2/24*60' --每2分钟  
		15. interval => 'sysdate+30/24*60*60'  --每30秒  
		16. 2:每天定时执行  
		17. Interval => TRUNC(sysdate+1)  --每天凌晨0点执行  
		18. Interval => TRUNC(sysdate+1)+1/24  --每天凌晨1点执行  
		19. Interval => TRUNC(SYSDATE+1)+(8*60+30)/(24*60)  --每天早上8点30分执行  
		20. 3:每周定时执行  
		21. Interval => TRUNC(next_day(sysdate,'星期一'))+1/24  --每周一凌晨1点执行  
		22. Interval => TRUNC(next_day(sysdate,1))+2/24  --每周一凌晨2点执行  
		23. 4:每月定时执行  
		24. Interval =>TTRUNC(LAST_DAY(SYSDATE)+1)  --每月1日凌晨0点执行  
		25. Interval =>TRUNC(LAST_DAY(SYSDATE))+1+1/24  --每月1日凌晨1点执行  
		26. 5:每季度定时执行  
		27. Interval => TRUNC(ADD_MONTHS(SYSDATE,3),'q')  --每季度的第一天凌晨0点执行  
		28. Interval => TRUNC(ADD_MONTHS(SYSDATE,3),'q') + 1/24  --每季度的第一天凌晨1点执行  
		29. Interval => TRUNC(ADD_MONTHS(SYSDATE+ 2/24,3),'q')-1/24  --每季度的最后一天的晚上11点执行  
		30. 6:每半年定时执行  
		31. Interval => ADD_MONTHS(trunc(sysdate,'yyyy'),6)+1/24  --每年7月1日和1月1日凌晨1点  
		32. 7:每年定时执行  
		33. Interval =>ADD_MONTHS(trunc(sysdate,'yyyy'),12)+1/24  --每年1月1日凌晨1点执行  


# Oracle预定义异常 #

| 错误号        | 异常错误信息名称    | 说明  |
| ------------- |:-------------:|:-----:|
|ORA-00001 |DUP_VAL_ON_INDEX|试图破坏一个唯一性限制 
|ORA-00051|TIMEOUT_ON_RESOURCE|在等待资源时发生超时
|ORA-01001|INVALID_CURSOR |试图使用一个无效的游标
|ORA-01012|NOT_LOGGED_ON|没有连接到ORACLE
|ORA-01017|LOGIN_DENIED|无效的用户名及口令
|ORA-01403|NO_DATA_FOUND|SELECT INTO没有找到数据
|ORA-01422|TWO_MANY_ROWS|SELECT INTO 返回多行
|ORA-01410|SYS_INVALID_ROWID|从字符串向ROWID转换发生错误
|ORA-01476|ZERO_DIVIDE|数字值除零时触发的异常
|ORA-01722|INVALID_NUMBER|转换一个数字失败
|ORA-06500|STORAGE_ERROR|内存不够引发的内部错误
|ORA-06501|PROGRAM_ERROR|存在PL/SQL内部问题
|ORA-06502|VALUE_ERROR|转换或截断错误
|ORA-06504|ROWTYPE_MISMATCH|宿主游标变量与 PL/SQL 游标变量的返回类型不兼容 
|ORA-06511|CURSOR_ALREADY_OPEN|游标已经打开
|ORA-06530|ACCESS_INTO_NULL|未定义对象
|ORA-06531|COLLECTION_IS_NULL|集合元素未初始化 
|ORA-06532|SUBSCRIPT_OUTSIDE_LIMIT|使用嵌套表或 VARRAY 时，将下标指定为负数 
|ORA-06533|SUBSCRIPT_BEYOND_COUNT|元素下标超过嵌套表或 VARRAY 的最大值 
|ORA-06592|CASE_NOT_FOUND|CASE 中若未包含相应的 WHEN ，并且没有设置 
|ORA-30625|SELF_IS_NULL|使用对象类型时，在 null 对象上调用对象方法 


## 搭建环境缓存网址： ##


	https://pms.going-link.com/w/aurora/no-cache-config

# hap网址 #

	https://rdc.hand-china.com/gitlab/wh-training-2018/
		
	https://rdc.hand-china.com/gitlab/users/sign_in
		
	图标地址：http://localhost:8080/sys_icon.html
		
	hosts:   https://raw.githubusercontent.com/vokins/yhosts/master/hosts	
	
	aurora标签：http://aurora.hand-china.com/doc/tagdoc/index.html
	

	
	kendo UI:
	
	kendoUI:https://www.evget.com/demo-sample/8616
	
	https://blog.csdn.net/a1786223749/article/details/78330908#1kendolov带出的值出现-null和undefined
	
	http://freemarker.foofun.cn/dgui_quickstart_template.html
	
	http://eco.hand-china.com/doc/hap/latest/dev_guide/03.frontend/04_kendo_lov.html
	
	http://eco.hand-china.com/doc/hap/latest/dev_guide/02.backend/13_mybatis2.html
	
	http://eco.hand-china.com/doc/hap/latest/dev_guide/02.backend/11_multi_language.html

# git操作 #

	在此之前需要切换到自己所需要提交的分支路径
	
	
	1.git add .
	
	2 git commit -m "....."
	
	3 git push -u origin ...(分支名，master主分支)
	
		
	git :
	
	git log:查看日志
	
	git status: 查看状态
	
	touch “文件名”： 创建文件夹
	
	git branch -a： 查看所有分支
	
	git branch -d  dev（分支名称） :  清除分支
	
	git checkout 分支名： 切换分支
	
	
	git merge dev（分支名称）：合并分支，需要先切换到主分支上
	
	vim 文件名： 修改文件
	
	git checkout -b 分支名 ： 创建分支
	
	
	eclipse  git  提交： 备注写错了     reset - soft  再次commit 来解决