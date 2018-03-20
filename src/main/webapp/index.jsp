<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<header>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/media/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/media/easyui/themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/media/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/media/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/media/easyui/locale/easyui-lang-zh_CN.js"></script>
</header>
<body class="easyui-layout">
<div data-options="region:'north'" style="height:70px;background: #000000;padding-left:20px"><h1 style="color: #fff">
    孟孟哒博客管理后台</h1></div>
<div data-options="region:'west',split:true" title="菜单" style="width:200px;">
    <ul class="easyui-tree" id="menuTree">
        <li>
            <span>博客管理</span>
            <ul>
                <li data-options="attributes:{'url':'<%=request.getContextPath()%>/category_list.jsp'}">博客分类</li>
                <li>发表博客</li>
                <li>博客关键字</li>
            </ul>
        </li>
    </ul>
</div>
<div data-options="region:'center',title:'管理后台',iconCls:'icon-ok'">
    <div id="main-tabs" class="easyui-tabs">
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#menuTree").tree({
            onClick: function (node) {
                //alert(node.attributes.url);
                //如果选中的是叶子节点，就打开选项卡，否则什么都不敢
                if ($('#menuTree').tree("isLeaf", node.target)) {
                    //如果选项卡已经存在，就切换到选中状态
                    if ($('#main-tabs').tabs('exists', node.text)) {
                        $('#main-tabs').tabs('select', node.text)
                    } else {//如果选项卡不存在，就新增选项卡
                        $('#main-tabs').tabs('add', {
                            title: node.text,
                            href:node.attributes.url,
                            closable: true//选项卡可关闭
                        });
                    }
                }
            }
        });
    })
</script>
</body>
</html>
