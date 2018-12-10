var _fnd_flex_dynamic_grid_expanded = new Object();

var tool = _fnd_flex_dynamic_tools;

_fnd_flex_dynamic_grid_expanded.prefix = '_dy_grid_expanded_';

_fnd_flex_dynamic_grid_expanded.onReady = function(){
	this.header = "\nAurora.onReady(function() {\n";
	this.text = "";
	this.end = "\n});";
	
	this.addText = function(text){
		this.text += "\n "+text+"\n";
	}
	
	this.getScriptText = function(){
		return this.header + this.text + this.end;
	}
	
};


_fnd_flex_dynamic_grid_expanded.expanded_grid = function(){
	this.name = "";
	this.initBm = new ModelService('flex.fnd_flex_segment_insc_attrs');
	this.onReady = new _fnd_flex_dynamic_grid_expanded.onReady();
	//this.gridTag = {};
	//this.dataSetTag = {};
	this.scriptTag = {};
	this.scriptText = "";
	
	//this.gridTag = newMap('grid');
	this.gridDBs = [];
	//this.datasetTag = newMap('dataSet');
	this.fieldsTag = {};
	this.columnsTag = {};
	this.gridColumns = [];
	this.editorsTag = newMap('editors');
	//this.toolBarTag = newMap('toolBar');
	this.eventsTag = newMap('events');
	this.updateEvent = new _dynamicPage.event();
	this.pageType = 'edit';
	
	this.updateEvent = new _dynamicPage.event();
	
	this.analyzeGridField = function(gridColumn) {
		
		if(this.pageType == 'edit' && gridColumn.forUpdate == 'N'){
			return;
		}
		
		if(this.pageType == 'query' && gridColumn.forQuery == 'N'){
			return;
		}
		
		
		this.fieldsTag.addChild(gridColumn.getFieldTag());
		
		var columnTag = newMap('column');
		columnTag.name = lower(String(gridColumn.displayName));
		
		var component = gridColumn.getComponent();
		component.id = String(component.name)
				+ 'editor';
		if(this.pageType == 'edit' && gridColumn.readonly == 'N'){
			columnTag.editor = String(component.id);
			this.updateEvent.addFunctionScript(gridColumn.getUpdatScript());
			if(component.renderer){
				columnTag.renderer = component.renderer;
				component.renderer = null;
			}
			this.editorsTag.addChild(component);
		}
		this.columnsTag.addChild(columnTag);
		
		// hBox.addChild(formField.getComponent());
		if (gridColumn.getRendererScrip()) {
			this.scriptText += ' ' + gridColumn.getRendererScrip() + ' ';
		}
	};
	
	this.init = function(dataSetTag,gridTag,scriptTag,temp_instance_id,pageType){
		this.dataSetTag = dataSetTag;
		this.scriptTag = scriptTag;
		this.scriptText = scriptTag.getData().getText();
		
		tool.logger.log('\n dataSetTag:'+dataSetTag.getData());
		tool.logger.log('\n gridTag:'+gridTag);
		tool.logger.log('\n dataSetTag:'+dataSetTag.toXML());
		tool.logger.log('\n gridTag:'+gridTag.toXML());
		
		this.fieldsTag = tool.findCreateChild(dataSetTag.getData(),'fields');
		this.columnsTag = tool.findCreateChild(gridTag.getData(),'columns');
		this.editorsTag = tool.findCreateChild(gridTag.getData(),'editors');
		
		this.tempBDs = [];
		if(pageType){
			this.pageType = pageType;
		}
		
		this.name = _fnd_flex_dynamic_grid_expanded.prefix + this.dataSetTag.id;
		
		this.updateEvent.init('update',this.name+'_update',
				' function ' + this.name + '_update'
				+ '(ds, record, name, value, oldvalue)',this.dataSetTag.id);

		var param = {};
		param.temp_instance_id = temp_instance_id;
		this.gridDBs = this.initBm.queryAsMap(param).getChildren();
		
		 
		for ( var i = 0; i < this.gridDBs.length; i++) {
			
			//if (this.gridDBs[i].DATA_SOURCE == 'FLEX_VALUE_SET') {//
			var parentFlexValueSet;
			if(this.gridDBs[i].FLEX_VALUE_SET_ID) {//值集
				parentFlexValueSet = null;
				if (this.gridDBs[i].PARENT_FLEX_VALUE_SET_ID) {
					for ( var j = 0; j < this.gridDBs.length; j++) {
						if (this.gridDBs[j].FLEX_VALUE_SET_ID == this.gridDBs[i].PARENT_FLEX_VALUE_SET_ID) {
							parentFlexValueSet = this.gridDBs[j];
						}
					}
				}
				gridColumn = new _dynamicPage.flexValueSet();

				gridColumn
						.init(
								null,
								this.gridDBs[i].APPL_ATTRIBUTE,
								this.gridDBs[i].ATTRIBUTE_DESC,
								this.gridDBs[i].FLEX_VALUE_SET_ID,
								this.gridDBs[i].NULLABLE_FLAG,
								parentFlexValueSet ? parentFlexValueSet.APPL_ATTRIBUTE
										: null,
								parentFlexValueSet ? parentFlexValueSet.ATTRIBUTE_DESC
										: null,
								this.pageType,
								this.gridDBs[i].FOR_QUERY_FLAG,
								this.gridDBs[i].FOR_UPDATE_FLAG,
								this.gridDBs[i].READONLY_FLAG
								);

			} else if (this.gridDBs[i].DATA_SOURCE == 'MANUAL') {
				gridColumn = new _dynamicPage.field();
				gridColumn.init(null, this.gridDBs[i],
						this.gridDBs[i].APPL_ATTRIBUTE,
						this.gridDBs[i].ATTRIBUTE_DESC,
						this.pageType,
						this.gridDBs[i].FOR_QUERY_FLAG,
						this.gridDBs[i].FOR_UPDATE_FLAG,
						this.gridDBs[i].READONLY_FLAG);
			}
			
			
			this.gridColumns.push(gridColumn);
		}

		for ( var i = 0; i < this.gridColumns.length; i++) {

			this.analyzeGridField(this.gridColumns[i]);
		} 
		

		//this.datasetTag.addChild(this.fieldsTag);

		if(this.pageType == 'edit'){
			tool.logger.log('\n  this.updateEvent.getFunctionScriptText():'+ this.updateEvent.getFunctionScriptText());
			this.scriptText += '\n ' + this.updateEvent.getFunctionScriptText() + ' \n';
			//this.eventsTag.addChild(this.updateEvent.getEventTag());
			
			this.onReady.addText(" $('"+String(this.dataSetTag.id)+"').addListener('update',"+ this.updateEvent.getEventHandler() +" );"); 
			
			//this.datasetTag.addChild(this.eventsTag);
		}
		tool.logger.log('\n this.onReady.getScriptText():'+this.onReady.getScriptText());
		this.scriptText += this.onReady.getScriptText();

		this.scriptTag.getData().setText(this.scriptText);
		
		//this.gridTag.addChild(this.columnsTag);
		//this.gridTag.addChild(this.editorsTag);
		
		tool.logger.log('\n config():'+$config().toXML());
	}
	
	
	
};


_fnd_flex_dynamic_grid_expanded.getTemplateId = function(appl_table_name,source_record_id,template_field_name){
	var param = {};
	param.appl_table_name = appl_table_name;
	param.source_record_id = source_record_id;
	param.template_field_name = template_field_name;
	param.user_id = $session.user_id;
	
	if(!source_record_id){
		return null;
	}
	
	var initBm = new ModelService('flex.PUBLIC.fnd_flex_get_template_id_by_table');
	var initRecord = initBm.queryAsMap(param).getChildren();
	if(!initRecord||!initRecord.length||initRecord.length<1){
		tool.logger.log('获取【template_id】错误，请检查！');
		return null; 	
	}
	if(!initRecord[0].TEMPLATE_ID||String(initRecord[0].TEMPLATE_ID)==''){
		tool.logger.log('获取【template_id】错误，请检查！');
		return null; 
	}
	
	return String(initRecord[0].TEMPLATE_ID);
};

_fnd_flex_dynamic_grid_expanded.getInstanceId = function(appl_table_name,source_record_id,template_id){
	var param = {};
	param.appl_table_name = appl_table_name;
	param.source_record_id = source_record_id;
	param.template_id = template_id;
	param.framework_type = 'SEGMENT';
	param.user_id = $session.user_id;
	
	var instanceIDBm = new ModelService('flex.PUBLIC.fnd_flex_get_instance_id');
	var instanceIDDBs = instanceIDBm.queryAsMap(param).getChildren();
	if(!instanceIDDBs||!instanceIDDBs.length||instanceIDDBs.length<1){
		tool.logger.log('获取【instance_id】错误，请检查！');
		return null; 	
	}
	if(!instanceIDDBs[0].TEMP_INSTANCE_ID||String(instanceIDDBs[0].TEMP_INSTANCE_ID)==''){
		tool.logger.log('获取【instance_id】错误，请检查！');
		return null; 
	}
	
	return String(instanceIDDBs[0].TEMP_INSTANCE_ID);
};


_fnd_flex_dynamic_grid_expanded.main = function(){
	
	tool.logger.log('ctx.toXML():'+$ctx.toXML());
	
	var gridExpandedLabels = tool.findChilds('flex-segment');
	tool.logger.log('gridExpandedLabels:'+gridExpandedLabels);
	
	
	if(!gridExpandedLabels||gridExpandedLabels.length==0){
		return;
	}
	
	for(var i=0;i<gridExpandedLabels.length;i++){
		var gridExpandedLabel = gridExpandedLabels[i];
	
		var scriptTag = tool.find('script');
		var pageType = gridExpandedLabel.pagetype;
		if(pageType){
			pageType=String(pageType).toLowerCase();
		}else{
			pageType='edit';
		}
		
		var header_table_name = String(gridExpandedLabel.headertablename);
		var header_id_path = String(gridExpandedLabel.headeridpath);
		var header_id = tool.getAttributeByPath(header_id_path);
		
		if(!header_id){
			tool.logger.log('【header_id】为空！');
			return;
		}
		
		var template_field_name = String(gridExpandedLabel.templatefieldname);
		
		var appl_pk_var_name = String(gridExpandedLabel.applpkvarname);
		
		var dataSetTag = tool.find('dataSet', 'id',gridExpandedLabel.dataset);
	
		
		var gridTag = tool.find('grid','id',gridExpandedLabel.grid);
		
		var expanded_grid = new _fnd_flex_dynamic_grid_expanded.expanded_grid();
		
		var template_id = _fnd_flex_dynamic_grid_expanded.getTemplateId(header_table_name,header_id,template_field_name);
		
		if(!template_id){
			tool.logger.log('【template_id】为空！');
			return;
		}
		
		
		
		var temp_instance_id = _fnd_flex_dynamic_grid_expanded.getInstanceId(header_table_name,header_id,template_id);
		
		if(!temp_instance_id){
			tool.logger.log('【temp_instance_id】 为空！')
			return;
		}
		
		expanded_grid.init(dataSetTag,gridTag,scriptTag,temp_instance_id,pageType);
	}
}

_fnd_flex_dynamic_grid_expanded.main();
