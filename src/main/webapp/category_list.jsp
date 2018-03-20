<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--url是请求数据的地址-->
<table class="easyui-datagrid" data-options="url:'/category.html?act=list'" toolbar="#category-datagrid-toolbar" id="category-datagrid">
    <thead>
    <tr>
        <!--field是服务端返回的json数据的属性-->
        <th data-options="field:'id',width:80">ID</th>
        <th data-options="field:'name',width:100">分类</th>
    </tr>
    </thead>
</table>
<div id="category-datagrid-toolbar">
    <div>
        ID：<input type="text" class="easyui-numberbox" id="search-category-id"/>
        名称：<input type="text" id="search-category-name"/>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search"
           onclick="doCategorySearch()">搜索</a>
    </div>
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="doAddCategory()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="">修改</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="">删除</a>
</div>
<div class="easyui-dialog" href="<%=request.getContextPath()%>/category_edit.jsp" closed="true" id="add-category-dialog" modal="true" title="编辑分类" style="width:300px;height:200px;padding-top:30px" buttons="#dlg-category-buttons">
</div>
<div id="dlg-category-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitCategory()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#edit-category-form').form('clear');">重填</a>
</div>
<script type="text/javascript">
    function doAddCategory(){
        $("#add-category-dialog").dialog("open")
    }
    function doCategorySearch(){
        var queryParams = $('#category-datagrid').datagrid('options').queryParams;
        queryParams.id=$("#search-category-id").val();
        queryParams.name = $("#search-category-name").val();
        //重新加载datagrid
        $("#category-datagrid").datagrid('reload');
    }
    function submitCategory(){
        $('#edit-category-form').form('submit',{
            onSubmit:function(){
                if($(this).form('enableValidation').form('validate')){
                    $.ajax({
                        url:"<%=request.getContextPath()%>/category.html?act=add",
                        data:$("#edit-category-form").serialize(),
                        method:"post",
                        success:function(data){
                            if(data.status){
                                $("#category-datagrid").datagrid('reload');
                                $("#add-category-dialog").dialog("close")
                            }else{
                                alert(data.message)
                            }
                        }
                    })
                }
                return false;
            }
        });
    }
</script>