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
        <title>Example of YUI DataTable with Scrolling Enabled</title>
        <meta name="layout" content="main"/>
    </head>
    <body>

        <div>Example of a local data source</div>
        <a href="http://developer.yahoo.com/yui/examples/datatable/dt_cellediting.html">YUI 2 Example</a>

        <%
            def columns = [
                    [key: "id", sortable: true, resizeable: true],
                    [key: "company", sortable: true, resizeable: true, editor: '@new YAHOO.widget.TextboxCellEditor()'],
                    [key: "price", sortable: true, resizeable: true, formatter: 'currency'],
                    [key: "change", sortable: true, resizeable: true],
                    [key: "percentChange", sortable: true, resizeable: true],
                    [key: "lastChange", sortable: true, resizeable: true, formatter: '@grails.yui.formatters.formatDate']
            ]

            def events = []
        %>

        <div style="height: width: 'auto'; padding: 20px;">
            <yuiWidget:yuiDataTable
                    id="testTable"
                    columns="${columns}"
                    namespace="grails.yui.components"
                    liquidWidth="${true}"
                    editable="${true}"
                    config="${[caption: 'DataTable Caption', height: '100px']}">
                <yuiWidget:yuiLocalDataSource
                        data="${stocks}"
                        config="${[
                            responseType : '@YAHOO.util.DataSource.TYPE_JSARRAY',
                            responseSchema: [
                                    fields: ['id', 'company', 'price', 'change', 'percentChange', 'lastChange']
                            ]
                        ]}"/>
            </yuiWidget:yuiDataTable>
        </div>

    </body>
</html>