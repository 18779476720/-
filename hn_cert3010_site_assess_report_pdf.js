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
