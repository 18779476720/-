/**创建一个div并固定在底部，将center中的所有a标签放在改div中**/
$("body").append($("<div>").css({"width":"100%","height":"30px","position":"fixed","top":"0","left":"0"
    ,"background-color":"rgba(53, 53, 53, 1)","line-height":"30px","font-size":"13px"}).attr("id","excel-header-nav"));
$("center").css("display", "none");
var centerChildrenA = $("center").children("a");
if (centerChildrenA.length === 0) {
    $("#excel-header-nav").hide();
    // $("#excel-header-nav").enable();
}
$(centerChildrenA).each(function (a, b) {
    // 获取a标签对应的target的name值，并设置name对应标签的样式以避免锚点标签标题被覆盖
    var href = $(b).attr("href");
    var name = href.substr(1);
    console.log(href + ":" + name);
    $("[name=" + name + "]").css({"display":"block","padding-top":"14.01px"});
    $(b).css({"padding":"5px","border-right":"1px solid white","color":"#f9f9f9"});
    $("#excel-header-nav").append(b);
});

/**给所有的table添加class=table table-striped样式**/

$("table td,table th").css("text-align","center");
$("table td,table th").css("padding","2px");
$("table").addClass("table table-striped");
$("table").addClass("table table-bordered");
// $("table").addClass("table table-hover");
$("table");


/**计算表头宽度----start**/
$("table").each(function (a, b) {
    var tableChildrenColgroup = $(b).children("colgroup");
    if(0==tableChildrenColgroup.length){
    }else if(1==tableChildrenColgroup.length){
        //openoffice，只有一个 colgroup，用col子标签来描述列
        var twidth = 0;
        var cols = tableChildrenColgroup.children("col");
        $(cols).each(function (i, g) {
            var w = $(g).attr("width");
            twidth +=1*w;
        });
        $(b).css({"width":twidth});
    }else{
        //liboffice 每一列都是一个colgroup
        var twidth = 0;
        $(tableChildrenColgroup).each(function (i, g) {
            var w = $(g).attr("width");
            var s = $(g).attr("span");
            if(null==s || undefined==s){
                s=1;
            }
            twidth +=1*w*s;
        });
        $(b).css({"width":twidth});
    }
});
/**计算表头宽度----end**/
