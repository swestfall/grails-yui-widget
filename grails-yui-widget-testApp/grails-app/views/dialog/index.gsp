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
        <title>Collection of Dialog Example Pages</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <a href="${createLink(controller: 'dialog', action: 'toolTip')}">Example of YUI ToolTip</a>
        <br />
        <a href="${createLink(controller: 'dialog', action: 'simpleDialog')}">Example of YUI Simple Dialog</a>
    </body>
</html>