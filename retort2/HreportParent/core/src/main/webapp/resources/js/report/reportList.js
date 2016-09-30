$(function() {

})

function getSelected()
{
	var grid = $("#reportListGrid").data("kendoGrid");
	var dataRows = grid.items();
	// 获取行号
	var rowIndex = dataRows.index(grid.select());
	// 获取行对象
	var data = grid.dataItem(grid.select());
	return data;
}


//查询header的lines
function showLines(data) {
	var headerId=data.repHeaderId;
	$.post(
		"/core/rep/reportLine/getLinesByHeaderId",
		{
			"headerId":headerId
		},
		function(data)
		{
			$('#reportLinesGrid').data('kendoGrid').dataSource.data([]);
			$('#reportLinesGrid').data('kendoGrid').dataSource.data(data);
		}
	)
}
//解析列
function analysisLines(data)
{
	var headerId=data.repHeaderId;
	var sql = data.sqlText;
	var dsId = data.dsId;

	var lines=[];
	$.ajax({
        url:  "/core/rep/reportLine/getLines",	
        type: 'POST',
        data: {
        	"repHeaderId":headerId,
			"sqlText":sql,
			"dsId":dsId,
			"__status":"add"
        },
        async: false,
        success: function (data) {
        	if(data.success==true)
        	{
            	lines=data.rows;
            	alert("列解析成功！")
        	}
        	else
    		{
        		alert(error)
    		}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    return lines;
}
//重新解析lines
function reAnalysisLines(data)
{
	var lines=analysisLines(data);
	$('#reportLinesGrid').data('kendoGrid').dataSource.data([]);
	$('#reportLinesGrid').data('kendoGrid').dataSource.data(lines);
}
//显示params
function showParams(data)
{
	var headerId=data.repHeaderId;
	var sql=data.sqlText;
	$.post(
		"/core/rep/queryParams/getParamsByHeaderId",
		{
			"headerId":headerId
		},
		function(data)
		{	
			var dataSource=data.rows;
			$('#paramsList').data('kendoGrid').dataSource.data([]);
			$('#paramsList').data('kendoGrid').dataSource.data(dataSource);
		}
	);
}



//解析参数
function analysisParams(data)
{
	var headerId=data.repHeaderId;
	var sql = data.sqlText;
	var params=[];
	var pattern =new RegExp("\\{{(.| )+?\\}}","igm");
    var strs=[];
    strs=sql.match(pattern);
    if(strs!=null)
    {
        for(var i=0;i<strs.length;i++)
        {
            strs[i]=strs[i].replace("{{","").replace("}}","")
            var param={};
            param.paramsName=strs[i];
            param.name=strs[i];
            param.headerId=headerId;
            params.push(param);
        }
    }
    params=removeSame(params);
    params=saveParams(params);
    return params;
}

//去重
function removeSame(params)
{
	var newParams=[];

	if(params!="" && params!=null)
	{
		newParams.push(params[0]);
		for(var i=1;i<params.length;i++)
		{
			var b="N";
			for(var j=0;j<newParams.length;j++)
			{
				if(newParams[j].paramsName==params[i].paramsName)
				{
					b="Y";
				}
			}
			if(b=="N")
			{
				newParams.push(params[i]);
			}
		}
	}
	return newParams
}

//重新解析params
function reAnalysisParams(data)
{
	var params=analysisParams(data);
	$('#paramsList').data('kendoGrid').dataSource.data([]);
	$('#paramsList').data('kendoGrid').dataSource.data(params);
}
//保存params
function saveParams(params)
{
	var header=getSelected();
	if(params.length==undefined || params.length==0)
	{
		var param={"headerId":header.repHeaderId};
		params.push(param);
	}
	var newParams={};
	$.ajax({
        url: "/core/rep/queryParams/saveParams",
        type: 'POST',
        data: JSON.stringify(params),
        contentType: 'application/json',
        async: false,
        success: function (data) {
        	if(data.success==true)
        	{
            	newParams=data.rows;
            	alert("参数解析成功！");
        	}
        	else
    		{
        		alert(error)
    		}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    return newParams;
}
