create or replace package itf_tool_pkg is

  -- Author  : ISAACF
  -- Created : 2014/5/6 15:33:01
  -- Purpose : 接口工具包

  function special_replace(str varchar2) return varchar2;

  procedure xml_tag_start(p_tag in out varchar2);

  procedure xml_tag_end(p_tag in out varchar2);

  function get_xml_tag_start(p_tag varchar2) return varchar2;

  function get_xml_tag_end(p_tag varchar2) return varchar2;

  function get_tag_xml_varchar(p_tag_name       varchar2,
                               p_value          varchar2 default null,
                               p_namespace_code varchar2 default null)
    return varchar2;

  function get_child_domnode_value(p_domnode         dbms_xmldom.DOMNode,
                                   p_child_node_name varchar2,
                                   p_name_space      varchar2 default null)
    return varchar2;

  function get_child_domnode(p_domnode         dbms_xmldom.DOMNode,
                             p_child_node_name varchar2,
                             p_name_space      varchar2 default null)
    return dbms_xmldom.DOMNode;

  function get_xml_extractvalue(p_xml        sys.xmltype,
                                p_path       varchar2,
                                p_name_space varchar2 default null)
    return varchar2;

  function get_dysql_varchar(p_value varchar2) return varchar2;

  function get_tag_xml(p_tag_name       varchar2,
                       p_value          varchar2 default null,
                       p_namespace_code varchar2 default null)
    return sys.xmltype;

end itf_tool_pkg;

 
 
 

 
/
