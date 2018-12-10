_fnd_flex_dynamic_tools = new Object();

Object.extend = function (source,destination) {
	for ( var property in source) {
	    destination[property] = source[property];
	}
	return destination;
};
_fnd_flex_dynamic_tools.Object = function(){
	
};

_fnd_flex_dynamic_tools.isJavaObject = function(obj){           
    return !!obj.getClass             
}               

_fnd_flex_dynamic_tools.config = $config();
_fnd_flex_dynamic_tools.ns_uri = 'http://www.aurora-framework.org/application';
_fnd_flex_dynamic_tools.find = function(tagName, proName, value) {
	var m;
	if(proName&&value){
		m =CompositeUtil.findChild(_fnd_flex_dynamic_tools.config, tagName, proName, value);
	}else if(tagName){
		m =CompositeUtil.findChild(_fnd_flex_dynamic_tools.config, tagName);
	}
	
	if (m){
		return new CompositeMap(m);
	}
};

_fnd_flex_dynamic_tools.findChild = function(root,tagName, proName, value){
	var m;
	if(proName&&value){
		m =CompositeUtil.findChild(root, tagName, proName, value);
	}else if(tagName){
		m =CompositeUtil.findChild(root, tagName);
	}
	
	if (m){
		return new CompositeMap(m);
	}else{
		return null;
	}
};

_fnd_flex_dynamic_tools.newMap = function(name) {
	return new CompositeMap('a', _fnd_flex_dynamic_tools.ns_uri, name);
};

_fnd_flex_dynamic_tools.findChilds = function(tagName) {
	return _fnd_flex_dynamic_tools.findChildsByRoot(_fnd_flex_dynamic_tools.config,tagName);
};

_fnd_flex_dynamic_tools.findChildsByRoot = function(root,tagName) {
	
	if(!root){
		root = _fnd_flex_dynamic_tools.config;
	}else if(!_fnd_flex_dynamic_tools.isJavaObject(root)){
		root = root.getData();
	}
	
	var ms = CompositeUtil.findChilds(root, tagName);

	_fnd_flex_dynamic_tools.logger.log('ms:'+ms);
	
	var maps = [];
	if (ms) {
		ms = ms.toArray();
		for ( var i = 0; i < ms.length; i++) {
			maps.push(new CompositeMap(ms[i]));
		}
	}
	
	return maps;
};

_fnd_flex_dynamic_tools.findCreateChild = function(root,tagName, proName, value){
	var m = _fnd_flex_dynamic_tools.findChild(root,tagName, proName, value);
	if(!m){
		m = new _fnd_flex_dynamic_tools.newMap(tagName);
		if(_fnd_flex_dynamic_tools.isJavaObject(root)){
			var root1 = new CompositeMap(root);
			root1.addChild(m);
		}else{
			root.addChild(m);
		}
	}
	return m;
};

_fnd_flex_dynamic_tools.lower = function(str){
	return String(str).toLowerCase();
}

_fnd_flex_dynamic_tools.upper = function(str){
	return String(str).toUpperCase();
}

_fnd_flex_dynamic_tools.getAttributeByPath = function (path,current_parameter){
	var current_parameter1;
	if(current_parameter){
		if(_fnd_flex_dynamic_tools.isJavaObject(current_parameter)){
			current_parameter1 = new CompositeMap(current_parameter);
		}else{
			current_parameter1 = current_parameter;
		}
	}else if($ctx.current_parameter){
		current_parameter1 = $ctx.current_parameter;
	}else if($ctx.parameter){
		current_parameter1 = $ctx.parameter;
	}
	if(!path){
		return null;
	}
	path = String(path);
	
	if(path.length<1){
		return null;
	}
	
	if(path=='@'){
		return current_parameter1;
	}
	
	if(path.charAt(0)=='/'){
		_fnd_flex_dynamic_tools.logger.log('ctx.get(path):'+$ctx.get(path));
		return $ctx.get(path);
	}else if(current_parameter1){
		_fnd_flex_dynamic_tools.logger.log('current_parameter1:'+current_parameter1);
		_fnd_flex_dynamic_tools.logger.log('current_parameter1.get(path):'+current_parameter1.get(path));
		return current_parameter1.get(path);
		
		
	}
	
	return null;

};

_fnd_flex_dynamic_tools.isJavaObject = function(obj){           
    return !!obj.getClass             
} 

String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {   
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {   
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);   
     } else {   
        return this.replace(reallyDo, replaceWith);   
     }   
}   

_fnd_flex_dynamic_tools.getInstanceID = function(appl_table_name,source_record_id,template_id){
	var param = {};
	param.appl_table_name = appl_table_name;
	param.source_record_id = source_record_id;
	param.template_id = template_id;
	param.framework_type = 'SEGMENT';
	param.user_id = $session.user_id;
	
	var instanceIDBm = new ModelService('flex.PUBLIC.fnd_flex_get_instance_id');
	var instanceIDDBs = instanceIDBm.queryAsMap(param).getChildren();
	if(!instanceIDDBs||!instanceIDDBs.length||instanceIDDBs.length<1){
		logger.log('获取【instance_id】错误，请检查！');
		return null; 	
	}
	if(!instanceIDDBs[0].TEMP_INSTANCE_ID||String(instanceIDDBs[0].TEMP_INSTANCE_ID)==''){
		logger.log('获取【instance_id】错误，请检查！');
		return null; 
	}
	
	return String(instanceIDDBs[0].TEMP_INSTANCE_ID);
};

_fnd_flex_dynamic_tools.logger=Packages.uncertain.logging.LoggingContext.getLogger($ctx.getData(),"aurora.database");