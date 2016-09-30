
//根据vsetId查询vset信息
function getValueSet(vsetId){
	var vset={};
	$.ajax({
		type: "post",
		async: false,
		url:"/core/rep/flexVset/getByVsetId",
		data:{
			"vsetId":vsetId
		},
		success:function(data){
			vset=data;
		},
		errors:function(){
			alert(error)					
		}
	});
	return vset;
}
//将vset信息加载到页面上
function addVsetToHtml(vset)
{
	$("#vsetName").val(vset.flexValueSetName);
	$("#vsetDescription").val(vset.description);
	$("#vsetTableName").val(vset.tableName);
	$("#vsetWhereCondition").text(vset.whereCondition);
	$("#vsetExtentMethod").text(vset.expandMethod);
	$("#vsetTitle").val(vset.title);
	$("#vsetWidth").val(vset.width);
	$("#vsetHeight").val(vset.height);
	if(vset.delayedLoadingFlag=="Y")
	{
		$("#vsetLazyLoad").attr("checked",true);
	}
}
function getVsetFromHtml()
{
	
	var vset=getVset();
	vset.flexValueSetName=$("#vsetName").val();
	vset.description=$("#vsetDescription").val();
	vset.tableName=$("#vsetTableName").val();
	vset.whereCondition=$("#vsetWhereCondition").val();
	vset.expandMethod=$("#vsetExtentMethod").val();
	vset.title=$("#vsetTitle").val();
	vset.width=$("#vsetWidth").val();
	vset.height=$("#vsetHeight").val();
	if($("#vsetLazyLoad").is(':checked'))
	{
		vset.delayedLoadingFlag="Y";
	}
	else
	{
		vset.delayedLoadingFlag="N";
	}
	return vset;
}
//
function saveVsetInfo()
{
	var vset=getVsetFromHtml();
	$.ajax({
		type: "post",
		async: false,
		url:"/core/rep/flexVset/updateVset",
		contentType: "application/json",
		data:JSON.stringify({
			"flexValueSetId":vset.id,
			"flexValueSetName":vset.flexValueSetName,
			"validationType":vset.validationType,
			"description":vset.description,
			"enabledFlag":vset.enabledFlag,
			"flexValueSetName":vset.flexValueSetName,
			"description":vset.description,
			"tableName":vset.tableName,
			"whereCondition":vset.whereCondition,
			"expandMethod":vset.expandMethod,
			"title":vset.title,
			"width":vset.width,
			"height":vset.height,
			"delayedLoadingFlag":vset.delayedLoadingFlag
		}),
		success:function(data){
			alert(updateSuccess);
		},
		errors:function(){
			alert(error)					
		}
	});
}
function getVset()
{
	$("#validateTableList").data('kendoGrid').dataSource.read();
	var grid = $("#flexVsetList").data("kendoGrid");
	var dataRows = grid.items();
	// 获取行号
	var rowIndex = dataRows.index(grid.select());
	// 获取行对象
	var vset = grid.dataItem(grid.select());
	return vset;
}