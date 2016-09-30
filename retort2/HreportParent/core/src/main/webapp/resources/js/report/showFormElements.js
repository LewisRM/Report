$(function(){
	globalVset={};
	globalValidateTables=[];
	
});
//渲染控件
function showFormElements(data)
{

	var headerId=data.repHeaderId;
	var params=[];
	params=getParams(headerId);
	
	
    $("#formElementsWin").html("");
    
    
    var $div='<div id="formElements"></div>';
    $("#formElementsWin").append($div);
    
	$div='<br/><br/>';
	$("#formElementsWin").append($div);
    
	$div='<div id="report"></div>';
	$("#formElementsWin").append($div);
    

    $.each(params,function(i,n){
    	if(this.display!="N"){
    	    var $beforeStr='<div class="divStyle"><span class="spanName">'+this.name+':</span>';
    	    var $afterStr='</div>';
	    	if(this.formElement=="SINGLE_SELECT")//select
			{
	    		var $str=$beforeStr;
	    		$str+="<span id="+this.paramsName+" style='width:"+this.showWidth+"px'></span>";
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		showDropLists(this);
	    		
			}
	    	else if(this.formElement=="INPUT")//text
			{
	    		var $str=$beforeStr;
	    		$str+='<input type="text" id='+this.paramsName+' class="k-textbox" style="width:'+this.showWidth+'px">';
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		//设置默认值
	    		var dsId=data.dsId;
	    		var defaultValues=[];
	    		var defaultValue="";
	    		var defaultType=this.defaultType;
	    		if(defaultType=="SQL")
	    		{
	    			var defaultValueSql=this.defaultValue;
	    			defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
	    			if(defaultValues.length!=undefined && defaultValues.length>0)
	    			{
    					$("#"+this.paramsName).val(defaultValues[0].id);
	    			}
	    		}
	    		else if(defaultType=="STRING")
	    		{
					$("#"+this.paramsName).val(this.defaultValue);
	    		}
			}
	    	else if(this.formElement=="COMBOBOX")//combobox
			{
	    		var $str=$beforeStr;
	    		$str+="<span id="+this.paramsName+" style='width:"+this.showWidth+"px'></span>";
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		showComboboxs(this,params);
			}
	    	else if(this.formElement=="MULTI_SELECT")//MultiSelect
			{
	    		var $str=$beforeStr;
	    		$str+="<span id="+this.paramsName+" style='width:"+this.showWidth+"px'></span>";
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		showMultiSelects(this,params);
			}
	    	else if(this.formElement=="CHECKBOX")//checkbox
			{
	    		var $strs=[];
	    		$strs=showCheckboxs(this);
	    		var $str=$beforeStr;
	    		for(var i=0;i<$strs.length;i++)
				{
	    			$str+=$strs[i];
				}
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		
	    		//设置默认值
	    		var dsId=data.dsId;
	    		var defaultValues=[];
	    		var defaultValue="";
	    		var defaultType=this.defaultType;
	    		if(defaultType=="SQL")
	    		{
	    			var defaultValueSql=this.defaultValue;
	    			defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
	    			if(defaultValues.length!=undefined && defaultValues.length>0)
	    			{
	    				for(var i=0;i<defaultValues.length;i++)
	    				{
	    					$("#"+this.paramsName+defaultValues[i].id).attr("checked",'true');
	    				}
	    			}
	    		}
	    		else if(defaultType=="STRING")
	    		{
	    			defaultValues=this.defaultValue.split(",");
		    		if(defaultValues.length!=undefined && defaultValues.length>0)
	    			{
	    				for(var i=0;i<defaultValues.length;i++)
	    				{
	    					$("#"+this.paramsName+defaultValues[i]).attr("checked",'true');
	    				}
	    			}
	    		}

			}
	    	else if(this.formElement=="DATE")//Date
			{
	    		var $str=$beforeStr;
	    		$str+="<input id="+this.paramsName+" style='width:"+this.showWidth+"px'/>";
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		showDate(this);
			}
	    	else if(this.formElement=="TIME")//Time
			{
	    		var $str=$beforeStr;
	    		$str+="<input id="+this.paramsName+" style='width:"+this.showWidth+"px'/>";
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		showTime(this);
			}
	    	else if(this.formElement=="LOV")//LOV
			{
	    		var $str=$beforeStr;
	    		$str+='<span class="popup" id="'+this.paramsName+'popup"><input placeholder="请输入" id='+this.paramsName+' class="lovInput"/>'
	    			 +'<span class="k-icon k-i-close popupClear show" id="'+this.paramsName+'popupClear"></span>'
	    			 +'<span class="popupSearch" id="'+this.paramsName+'popupSearch"><span class="k-icon k-i-search popupSearchIcon"></span></span></span>';
	    		$str+=$afterStr;
	    		$("#formElements").append($str);
	    		showLov(this);
	    		//设置默认值
	    		var dsId=data.dsId;
	    		var defaultValues=[];
	    		var defaultValue="";
	    		var defaultType=this.defaultType;
	    		if(defaultType=="SQL")
	    		{
	    			var defaultValueSql=this.defaultValue;
	    			defaultValues=getSqlContentSource(defaultValueSql,dsId);
	    			if(defaultValues.length!=undefined && defaultValues.length>0)
	    			{
	    				$("#"+this.paramsName).data("value",defaultValues[0].id);
	    				$("#"+this.paramsName).val(defaultValues[0].name);
	    			}
	    		}
	    		else if(defaultType=="STRING")
	    		{
	    			defaultValue=this.defaultValue;
	    			$("#"+this.paramsName).data("value",defaultValue);
    				$("#"+this.paramsName).val(defaultValue);
	    		}
			}
    	}
    })

    var $br='<div style="clear:both"></div><br/><br/>';
	$("#formElements").append($br);
    var $br='<input class="btn btn-success" onclick="showReportContent();" type="button"  value="'+query+'" />';
	$("#formElements").append($br);
	$br="<span>&nbsp&nbsp&nbsp</span>";
	$("#formElements").append($br);
	$br='<input class="btn btn-success" onclick="addReport();" type="button"  value="添加报表" />';
	$("#formElements").append($br);
	var $br="<br/><br/>";
	$("#formElements").append($br);
	
	//渲染报表
	var lines=getLines(headerId);
	var columns=getReportColumns(lines);
	showReportTitle(columns);
}

//获取字符串形式的下拉框数据源
function getStrContentSource(str)
{
	var options=[];
	var dataSource=[];
	options=str.split(",");
	for(var i=0;i<options.length;i++)
	{
		var option=[];
		option=options[i].split(":");
		dataSource.push({"id":option[0],"name":option[1]});
	}
	return dataSource;
}
//获取SQL形式的下拉框数据源
function getSqlContentSource(sql,dsId)
{
	var dataSource=[];
	$.ajax({
        url:  "/core/rep/queryParams/getParamsValue",
        type: 'POST',
        data: {
        	"sql":sql,
        	"dsId":dsId
        },
        async: false,
        success: function (data) {
        	dataSource=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    return dataSource;
}
//获取sql类型的默认值
function getSqlDefaultValue(sql,dsId)
{
	var defaultValues=[];
	$.ajax({
        url:  "/core/rep/queryParams/getDefaultValue",
        type: 'POST',
        data: {
        	"sql":sql,
        	"dsId":dsId
        },
        async: false,
        success: function (data) {
        	defaultValues=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    return defaultValues;
}

//下拉单选
function showDropLists(param)
{
	var dataSource=[];
	var header=getSelectedRow("reportListGrid");
	var sql=param.content;
	var dsId=header.dsId;
	var contentSource=param.contentSource;
	
	//设置数据源
	if(contentSource=="SQL")
	{
		dataSource=getSqlContentSource(sql,dsId);
	}
	else if(contentSource=="STRING")
	{
		dataSource=getStrContentSource(param.content);
	}

	//设置默认值
	var defaultValues=[];
	var defaultValue="";
	var defaultType=param.defaultType;
	if(defaultType=="SQL")
	{
		var defaultValueSql=param.defaultValue;
		defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
		if(defaultValues.length!=undefined && defaultValues.length>0)
		{
			defaultValue=defaultValues[0].id;
		}
		alert(defaultValue)
	}
	else if(defaultType=="STRING")
	{
		defaultValue=param.defaultValue;
	}

	$("#"+param.paramsName).kendoDropDownList({
        dataTextField: "name",
        dataValueField: "id",
        dataSource: dataSource,
        value:defaultValue
    });
}

//下拉多选
function showMultiSelects(param)
{
	var dataSource=[];
	var header=getSelectedRow("reportListGrid");
	var sql=param.content;
	var dsId=header.dsId;
	var contentSource=param.contentSource;
	if(contentSource=="SQL")
	{
		dataSource=getSqlContentSource(sql,dsId);
	}
	else if(contentSource=="STRING")
	{
		dataSource=getStrContentSource(param.content);
	}
	
	//设置默认值
	var defaultValues=[];
	var defaultValue="";
	var defaultType=param.defaultType;
	if(defaultType=="SQL")
	{
		var defaultValueSql=param.defaultValue;
		defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
		if(defaultValues.length!=undefined && defaultValues.length>0)
		{
			defaultValue=defaultValues[0].id;
		}
	}
	else if(defaultType=="STRING")
	{
		defaultValue=param.defaultValue;
	}

	$("#"+param.paramsName).kendoMultiSelect({
        dataTextField: "name",
        dataValueField: "id",
        dataSource: dataSource,
        value:defaultValue

    });
}

//combobox
function showComboboxs(param)
{
	var dataSource=[];
	var header=getSelectedRow("reportListGrid");
	var sql=param.content;
	var dsId=header.dsId;
	var contentSource=param.contentSource;
	if(contentSource=="SQL")
	{
		dataSource=getSqlContentSource(sql,dsId);
	}
	else if(contentSource=="STRING")
	{
		dataSource=getStrContentSource(param.content);
	}
	//设置默认值
	var defaultValues=[];
	var defaultValue="";
	var defaultType=param.defaultType;
	if(defaultType=="SQL")
	{
		var defaultValueSql=param.defaultValue;
		defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
		if(defaultValues.length!=undefined && defaultValues.length>0)
		{
			defaultValue=defaultValues[0].id;
		}
	}
	else if(defaultType=="STRING")
	{
		defaultValue=param.defaultValue;
	}
	$("#"+param.paramsName).kendoComboBox({
        dataTextField: "name",
        dataValueField: "id",
        filter: "contains",
        dataSource: dataSource,
        value:defaultValue
    });
}
//checkbox
function showCheckboxs(param)
{
	var $str="";
	var $strs=[];
	var dataSource=[];
	var header=getSelectedRow("reportListGrid");
	var sql=param.content;
	var dsId=header.dsId;
	var contentSource=param.contentSource;
	if(contentSource=="SQL")
	{
		dataSource=getSqlContentSource(sql,dsId);
	}
	else if(contentSource=="STRING")
	{
		dataSource=getStrContentSource(param.content);
	}
	
	
    for(var i=0;i<dataSource.length;i++)
    {
    	$str=dataSource[i].name+':<input type="checkbox" id='+param.paramsName+dataSource[i].id+' name='+param.paramsName+' value="'+dataSource[i].id+'"/>';
    	$strs.push($str);
    }
	 return $strs;
}
//判断是不是日期格式
//function isDate(date){
//	var a = /^(\d{4})-(\d{2})-(\d{2})$/
//	if (!a.test(date)) { 
//		return false;
//	} 
//	else 
//	{
//		return true;
//	}
//
//} 
//日期框
function showDate(param)
{
	//设置默认值
	var header=getSelectedRow("reportListGrid");
	var dsId=header.dsId;
	var defaultValues=[];
	var defaultValue="";
	var defaultType=param.defaultType;
	if(defaultType=="SQL")
	{
		var defaultValueSql=param.defaultValue;
		defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
		if(defaultValues.length!=undefined && defaultValues.length>0)
		{
			defaultValue=defaultValues[0].id;
		}
	}
	else if(defaultType=="STRING")
	{
		defaultValue=param.defaultValue;
	}
//	var date=new Date();
//	if(isDate(defaultValue))
//	{
//		date=defaultValue;
//	}
	$("#"+param.paramsName).kendoDatePicker({
		culture:"zh-CN",
		format:"yyyy-MM-dd",
		value:defaultValue
	});
}
//判断是不是时间格式
//function isDateTime(dateTime){ 
//	var reg=/^(\d+)-(\d{ 1,2})-(\d{ 1,2})(\d{ 1,2}):(\d{1,2}):(\d{1,2})$/; 
//	var r=dateTime.match(reg); 
//	if(r==null) 
//	{
//		return false; 
//	}
//	else{
//		return true; 
//	}
//}
//时间框
function showTime(param)
{
	//设置默认值
	var header=getSelectedRow("reportListGrid");
	var dsId=header.dsId;
	var defaultValues=[];
	var defaultValue="";
	var defaultType=param.defaultType;
	if(defaultType=="SQL")
	{
		var defaultValueSql=param.defaultValue;
		defaultValues=getSqlDefaultValue(defaultValueSql,dsId);
		if(defaultValues.length!=undefined && defaultValues.length>0)
		{
			defaultValue=defaultValues[0].id;
		}
	}
	else if(defaultType=="STRING")
	{
		defaultValue=param.defaultValue;
	}
//	var date=new Date();
//	if(isDateTime(defaultValue))
//	{
//		date=defaultValue;
//	}
    $("#"+param.paramsName).kendoDateTimePicker({
    	culture:"zh-CN",
        parseFormats: ["MM/dd/yyyy"],
    	value:defaultValue
    });
}
/*******************************LOV部分*****************************************/
//渲染LOV输入框和弹出框按钮
function showLov(param)
{
	var id=param.paramsName;
	var content=param.content;
	//lov样式js
	$("#"+id+"popupClear").click(function(){
	    	$("#"+id).val("");
	    	$("#"+id).data("value","");
	    });
	    
	    $("#"+id+"popupSearch").click(function(){
	    	showLovWin(param);
	    });
	    
	    $("#"+id).bind({ 
		focus:function(e){	
			$("#"+id+"popup").addClass("box-shadow-popup");
			e.stopPropagation();
		}, 
		
		blur:function(){
			$("#"+id+"popup").removeClass("box-shadow-popup");
		} 
	}); 
	
	$("#"+id+"popup").hover(
		function(){
			$("#"+id+"popupClear").removeClass("show");
			$("#"+id+"popupSearch").addClass("bGColor");
		},
		function(){
			if($("#"+id+"lovInput").is(":focus")){
			}else{
				$("#"+id+"popupClear").addClass("show");
			    $("#"+id+"popupSearch").removeClass("bGColor");
			}
			
		}
		
	);
}
//渲染Lov弹出框
function showLovWin(param)
{
	var vsetId=param.content;
	globalVset=getVset(vsetId);
	globalValidateTables=getValidateTables(vsetId);
	
	//打开lov弹窗
	$("#lovWin").data("kendoWindow").center().open();
	//获取vset
	var vset=globalVset;
	//获取validateTables
	var validateTables=globalValidateTables;
    //渲染参数
    showLovValidateTables(vset,validateTables,param);
    //渲染结果表格
    showLovTable(validateTables);
    
    if(vset.delayedLoadingFlag=="N")
	{
    	showLovResult(vsetId);
	}
}
function getVset(vsetId)
{
	var vset={};
	$.ajax({
        url:  "/core/rep/flexVset/getByVsetId",
        type: 'POST',
        data: {
        	"vsetId":vsetId
        },
        async: false,
        success: function (data) {
        	vset=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    });
	return vset;
}
//获取validateTables
function getValidateTables(vsetId)
{
	var validateTables=[];
	$.ajax({
        url:  "/core/rep/validateTable/getByVsetId",
        type: 'POST',
        data: {
        	"vsetId":vsetId
        },
        async: false,
        success: function (data) {
        	validateTables=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    });
	return validateTables;
}
//渲染LOV弹出框中validateTables参数
function showLovValidateTables(vset,validateTables,param)
{
	$("#lovWin").html("");

	var $str='<div id="validateTables"></div>';
	$("#lovWin").append($str);
	$str='<br/><br/>'
	$("#lovWin").append($str);
	$str='<div id="vsetResult"></div>'; 
	$("#lovWin").append($str);


	if(validateTables.length!=undefined)
	{
		for(var i=0;i<validateTables.length;i++)
		{
			if(validateTables[i].enabledFlag=='Y' && validateTables[i].conditionFlag=='Y'){
				var $beforeStr='<div class="divStyle"><span class="spanName">'+validateTables[i].description+':</span>';
	    	    var $afterStr='</div>';
		        var $str=$beforeStr;
	    		$str+='<input type="text" id="lov'+validateTables[i].validateTableId+'" class="k-textbox" style="width:'+validateTables[i].width+'px;height:25px">';
	    		$str+=$afterStr;
		        $("#validateTables").append($str);

			}	
		}
	}
	var $str='<div style="clear:both"></div><br/><br/>';
	$("#validateTables").append($str);
	$str='<input class="btn btn-success" onclick="showLovResult('+vset.flexValueSetId+');" type="button"  value="'+query+'" />';
	$("#validateTables").append($str);
	$str="<br/><br/>";
	$("#lovWin").append($str);
	var paramsName=param.paramsName;
	$str="<input class='btn btn-success' onclick='addValueToLov(\""+paramsName+"\");' type='button'  value='"+confirm+"' />";
	$("#lovWin").append($str);
}
//渲染LOV结果表格
function showLovTable(validateTables)
{
	var columns=[];
	columns=getvalidateTableColumns(validateTables);
	var dataSource=[];
	$("#vsetResult").kendoGrid({
    	dataSource: dataSource,
        resizable: true,
        scrollable: false,
        selectable: "multiple",
        columns: columns,
        editable: false,
        sortable:true,
        reorderable:true
    });

}
//将validateTables转换成grid列规范数组
function getvalidateTableColumns(validateTables)
{
	var columns=[];
	for(var i=0;i<validateTables.length;i++)
	{
		if(validateTables[i].enabledFlag=='Y'){
			var column={};
			column.field=validateTables[i].columnAlias;
			column.title=validateTables[i].description;
			column.width=validateTables[i].width;
			if(validateTables[i].hiddenFlag=='Y')
			{
				column.hidden=true;
			}
			columns.push(column);
		}
	}
	return columns;
}
//查询Lov结果
function showLovResult(vsetId)
{
	var vset=globalVset;
	var validateTables=globalValidateTables;
	
	var sql="select ";
	var lines="";
	var params=vset.whereCondition+" ";
	if(validateTables.length!=undefined)
	{
		for(var i=0;i<validateTables.length;i++)
		{
			if(validateTables[i].enabledFlag=='Y')
			{
				lines+=validateTables[i].columnName+" ";
				if(validateTables[i].columnAlias!=null && validateTables[i].columnAlias!="")
				{
					lines+="as "+validateTables[i].columnAlias
				}
				if(i!=(validateTables.length-1))
				{
					lines+=" , ";
				}
			}
			
			if(validateTables[i].enabledFlag=='Y' && validateTables[i].conditionFlag=='Y')
			{
				var value=$("#lov"+validateTables[i].validateTableId).val();
				if(value!="")
				{
					params+=" and "+validateTables[i].columnName+' like "%'+value+'%" ';
				}
			}
		}
		sql+=lines+" from "+vset.tableName+" "+params;
		
	}
	
	var otherParams=[];
	otherParams=analysisSql(vset.whereCondition);
	if(otherParams.length!=0)
	{
		for(var i=0;i<otherParams.length;i++)
		{
			var value=("#"+otherParams[i].value).val();
			sql=sql.replace(otherParams[i].name,value);
		}
	}
	var header=getSelectedRow("reportListGrid");
	var dsId=header.dsId;
	var dataSource=[];
	$.ajax({
        url:  "/core/rep/flexVset/getLovDataSource",
        type: 'POST',
        data: {
        	"vsetId":vsetId,
        	"dsId":dsId,
        	"sql":sql
        },
        async: false,
        success: function (data) {
        	dataSource=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    });
	dataSource=analysisDataSource(dataSource);
	var vsetDataSource = new kendo.data.DataSource({
		  data: dataSource
		});
	
	var grid=$("#vsetResult").data('kendoGrid');
	grid.setDataSource(vsetDataSource);

}

function addValueToLov(paramsName)
{
	var vsetValues=getSelectedRow("vsetResult");
	if(vsetValues==null)
	{
		alert(selectOne);
		return false;
	}
	var value="";
	var text="";
	var validateTables=globalValidateTables;
	
	//循环查找lov的value值和text值
	for(var i=0;i<validateTables.length;i++)
	{
		if(validateTables[i].columnFlag=="Y")
		{
			//判断是value还是text
			if(validateTables[i].valueField=="Y")
			{
				var field=validateTables[i].columnAlias;
				value=vsetValues[field];
			}
			else if(validateTables[i].textField=="Y")
			{
				var field=validateTables[i].columnAlias;
				text=vsetValues[field];
			}
		}
		else if(validateTables[i].columnFlag=="O" && validateTables[i].textField!="")
		{
			//如果是其他控件，控件如果存在，则赋值
			if($("#"+paramsName).is("input"))
			{
				var field=validateTables[i].columnAlias;
				value=vsetValues[field];
				$("#"+paramsName).val(value);
			}
		}
	}
	//判断lov的value和text是不是为空
	if(value!="" && text!="")
	{
		$("#"+paramsName).val(text);
		$("#"+paramsName).data("value",value);
	}
	else
	{
		alert(informationNotEnough);
	}
	$("#lovWin").data("kendoWindow").close();
	//执行扩展代码
	var vset=globalVset;
	if(vset.expandMethod!="")
	{
		eval(vset.expandMethod);
	}
}
/**************************LOV代码结束*********************************/

//解析sql
function analysisSql(sql)
{
	var pattern =new RegExp("\\{{(.| )+?\\}}","igm");
	var strs=[];
	var params=[];
    strs=sql.match(pattern);
    if(strs!=null)
    {
        for(var i=0;i<strs.length;i++)
        {
            var param={};
            param.name=strs[i];
            strs[i]=strs[i].replace("{{","").replace("}}","")
            param.value=strs[i];
            params.push(param);
        }
    }
    params=rewoveSame(params);
	return params;
}

//去重
function rewoveSame(params)
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
				if(newParams[j].name==params[i].name)
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


//获取所有控件值
function getParamsValue(data,params){
	var sql="";
	sql=data.sqlText;
	var headerParams=analysisSql(sql);
	var nullValue="";
	
	for(var i=0;i<params.length;i++)
	{
		var value="";
		if(params[i].formElement=="SINGLE_SELECT")//select,下拉框
		{
			value=$("#"+params[i].paramsName).data("kendoDropDownList").value();
		}
    	else if(params[i].formElement=="INPUT")//text,输入框
		{
    		value=$("#"+params[i].paramsName).val();
		}
    	else if(params[i].formElement=="COMBOBOX")//combobox,下拉输入框
		{
    		value=$("#"+params[i].paramsName).data("kendoComboBox").value();
		}
    	else if(params[i].formElement=="MULTI_SELECT")//MultiSelect,下拉多选框
		{
    		value=$("#"+params[i].paramsName).data("kendoMultiSelect").value();
		}
    	else if(params[i].formElement=="CHECKBOX")//checkbox,多选框
		{
    		$("input[name="+params[i].paramsName+"]:checked").each( function(){
    	          
    			value+=$(this).val()+",";
    		});
    		value=value.substring(0,value.length-1);

		}
    	else if(params[i].formElement=="DATE")//D,时间框
		{
    		value=$("#"+params[i].paramsName).data("kendoDatePicker").value();
    		if(value!="" && value!=null)
			{
        		value = new Date(value);
        		value=value.getFullYear()+"-"+(value.getMonth()+1)+"-"+value.getDate();
			}
		}
    	else if(params[i].formElement=="TIME")//TIME
		{
    		value=$("#"+params[i].paramsName).data("kendoDateTimePicker").value();
    		if(value!="" && value!=null)
			{
    			value = new Date(value);
        		value=value.getFullYear()+"-"+(value.getMonth()+1)+"-"+value.getDate()+" "+value.getHours()+"-"+value.getMinutes()+"-"+value.getSeconds();
			}
		}
    	else if(params[i].formElement=="LOV")//LOV
		{
    		value=$("#"+params[i].paramsName).data("value");
    		if(value==undefined)
			{
    			value=null;
			}
		}
		
		var required=params[i].required;
		var display=params[i].display;
		if(required=="Y" && display=="Y")
		{
			if(value=="" || value==null)
			{
				nullValue+=params[i].name+",";
			}
		}
		for(var j=0;j<headerParams.length;j++)
		{
			if(params[i].paramsName==headerParams[j].value)
			{
//	   			if(value!="" && value!=null)
//				{	
//					sql=sql.replace(headerParams[i].name,value);
//				}
//				else
//				{
//					value+='"" or 1=1 ';
//					sql=sql.replace(headerParams[i].name,value);
//				}
				if(value=="")
				{
					value=null;
				}
				while(sql.indexOf(headerParams[i].name)>0)
				{
					sql=sql.replace(headerParams[i].name,value);

				}
			}
		}
	}
	if(nullValue!="")
	{
		alert(nullValue+notEmpty);
		sql="false";
	}

	return sql;
}
//获取报表内容
function getReportDataSource(data,sql){
	var headerId=data.repHeaderId;
	var dsId=data.dsId;
	var dataSource=[];
	$.ajax({
        url:  "/core/rep/reportHeader/getReportDataSource",
        type: 'POST',
        data: {
        	"headerId":headerId,
        	"dsId":dsId,
        	"sql":sql
        },
        async: false,
        success: function (data) {
        	dataSource=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    
    dataSource=analysisDataSource(dataSource);
	return dataSource;
}
//格式化报表数据源
function analysisDataSource(data)
{
	var dataSource={};
	var reportDataSources=[];
	for(var i=0;i<data.length;i++)
	{
		dataSource=data[i].reportDataSource;
		var reportDataSource={};
		for(var j=0;j<dataSource.length;j++)
		{
			for(var k in dataSource[j])
			{
				reportDataSource[k]=dataSource[j][k];
			}
		}
		reportDataSources.push(reportDataSource);
	}
	return reportDataSources;
}

//根据headerId获取line
function getLines(headerId){
	var lines=[];
	$.ajax({
        url:  "/core/rep/reportLine/getLinesByHeaderId",
        type: 'POST',
        data: {
        	"headerId":headerId
        },
        async: false,
        success: function (data) {
        	lines=data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    return lines;
}
//获取表头信息
function getReportColumns(lines)
{
	var columns=[];
	for(var i=0;i<lines.length;i++)
	{
		var column={};
		column.field=lines[i].columnName;
		column.title=lines[i].name;
		column.width=lines[i].displayWidth;
		if((lines[i].dataType=="DATE" ||lines[i].dataType=="DATETIME" || lines[i].dataType=="TIMESTAMP") && (lines[i].format!="" && lines[i].format!=null))
		{
			column.format="{0:"+lines[i].format+"}";
		}
		else if((lines[i].dataType=="INT" || lines[i].dataType=="INTEGER" || lines[i].dataType=="BIGINT" || lines[i].dataType=="DOUBLE" || lines[i].dataType=="FLOAT" || lines[i].dataType=="NUMBER") && (lines[i].format!="" && lines[i].format!=null))
		{
			column.format="{0:"+lines[i].format+"}";
		}
		columns.push(column);
	}
	return columns;
}
//根据headerId获取参数
function getParams(headerId){
	var params=[];
	$.ajax({
        url:  "/core/rep/queryParams/getParamsByHeaderId",
        type: 'POST',
        data: {
        	"headerId":headerId
        },
        async: false,
        success: function (data) {
        	params=data.rows;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
    return params;
}
//展示表头
function showReportTitle(columns)
{
	var header=getSelectedRow("reportListGrid");
	var reportName=header.name+".xlsx";
	var dataSource=[];
	$("#report").kendoGrid({
		toolbar: ["excel"],
    	dataSource: dataSource,
        resizable: true,
        scrollable: false,
        columns: columns,
        editable: false,
        sortable:true,
        excel: {
            fileName: reportName
        },
        reorderable:true
    });
	//var grid=$("#report").kendoGrid();
}
function showReportContent()
{


	var header = getSelectedRow("reportListGrid");
	var headerId=header.repHeaderId;
	
	var params=[];
	params=getParams(headerId);
	
	var sql=getParamsValue(header,params);
	if(sql=="false")
	{
		return;
	}
	
	var data=getReportDataSource(header,sql);
	var lines=getLines(headerId);
	var model={};
	var fields={};
	
	for(var i=0;i<lines.length;i++)
	{
		if((lines[i].dataType=="DATE" ||lines[i].dataType=="DATETIME" || lines[i].dataType=="TIMESTAMP") && lines[i].format!="")
		{
			fields[lines[i].columnName]={type:"date"};
		}
		else if((lines[i].dataType=="INT" || lines[i].dataType=="INTEGER" || lines[i].dataType=="BIGINT" || lines[i].dataType=="DOUBLE" || lines[i].dataType=="FLOAT" || lines[i].dataType=="NUMBER") && lines[i].format!="")
		{
			fields[lines[i].columnName]={type:"number"};
		}
	}
	model.fields=fields;
	
	var dataSource = new kendo.data.DataSource({
		  data: data,
		  schema: {
			  model:model
		  }
		});
	
	var grid=$('#report').data('kendoGrid');
	grid.setDataSource(dataSource);
	
	var columns=getReportColumns(lines);
    grid.setOptions({
    	toolbar: ["excel"],
        columns: columns,
        excel: {
            fileName: header.name+".xlsx"
        },
    });

}

function getSelectedRow(gridId)
{
	var grid = $("#"+gridId).data("kendoGrid");
	var dataRows = grid.items();
	var rowIndex = dataRows.index(grid.select());
	var row = grid.dataItem(grid.select());
	return row;
}

function addReport()
{
	var header=getSelectedRow("reportListGrid");
	var headerId=header.repHeaderId;
	$.ajax({
        url:  "/core/rep/reportHeader/addReport",
        type: 'POST',
        data: {
        	"headerId":headerId
        },
        async: false,
        success: function (data) {
        	alert(addSuccess);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(error)
        }
    })
}


