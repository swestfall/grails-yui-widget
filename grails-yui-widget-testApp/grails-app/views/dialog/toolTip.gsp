<%--
  Created by IntelliJ IDEA.
  User: swestfall
  Date: 6/9/11
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Example of YUI ToolTip</title>
        <meta name="layout" content="main"/>

        <style>
        #ctx {
            background: orange;
            width: 200px;
            height: 200px;
        }
        </style>

    </head>
    <body>

        <div>Example of a YUI ToolTip</div>
        <a href="http://developer.yahoo.com/yui/examples/container/tooltip.html">YUI ToolTip Sample Page</a>

        <div style="margin: 20px;">
            <div id="ctx">Hover over me to see a Tooltip!</div>
            <a id="link" href="http://www.yahoo.com/" title="Do You Yahoo?">Hover over me to see a Tooltip!</a>
        </div>

        <yuiWidget:yuiToolTip
                id="toolTip1"
                config="${[ context: 'ctx', text: 'here is the text' ]}"/>

        <yuiWidget:yuiToolTip
                id="toolTip2"
                config="${[
                    context: 'link'
            ]}"/>

    </body>
</html>