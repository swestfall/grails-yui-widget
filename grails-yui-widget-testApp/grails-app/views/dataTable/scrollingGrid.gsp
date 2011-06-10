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
        <script type="text/javascript">
            var cellMousedownEvent_Handler = function() {
                //alert('cellMousedownEvent_Handler fired');
            }
            var cellMouseoutEvent_Handler = function() {
                //alert('cellMouesoutEvent_Handler fired');
            }

            grails = {};
            grails.yui = {};

        </script>
    </head>
    <body>

        <div>Example of a local data source</div>
        <a href="http://developer.yahoo.com/yui/examples/datatable/dt_basic.html">YUI 2 Example</a>

        <%
            def data = [
                    [id: "po-0167", date: "2/24/1980", quantity: 1, amount: 4, title: "A Book About Nothing"],
                    [id: "po-0783", date: "1/3/1983", quantity: null, amount: 12.12345, title: "The Meaning of Life"],
                    [id: "po-0297", date: "11/12/1978", quantity: 12, amount: 1.25, title: "This Book Was Meant to Be Read Aloud"],
                    [id: "po-1482", date: "3/11/1985", quantity: 6, amount: 3.5, title: "Read Me Twice"]
            ]

            def columns = [
                    [key: "id", sortable: true, resizeable: true],
                    [key: "date", formatter: "YAHOO.widget.DataTable.formatDate", sortable: true, sortOptions: "{defaultDir: 'YAHOO.widget.DataTable.CLASS_DESC'}", resizeable: true],
                    [key: "quantity", formatter: "YAHOO.widget.DataTable.formatNumber", sortable: true, resizeable: true],
                    [key: "amount", formatter: "YAHOO.widget.DataTable.formatCurrency", sortable: true, resizeable: true],
                    [key: "title", sortable: true, resizeable: true]
            ]
        %>

        <yui-widget:DataTable
                id="testTable"
                columns="${columns}"
                events="${[
                        [type: 'cellMousedownEvent', fn: 'this.cellMousedownEvent_Handler', obj: '{}', scope: 'this'],
                        [type: 'cellMouseoutEvent', fn: 'this.cellMouseoutEvent_Handler', obj: '{}', scope: 'this']
                ]}"
                namespace="grails.yui.components"
                config="${[caption: 'DataTable Caption']}">
            <yui-widget:DataSource
                    data="${stocks}"
                    responseType="YAHOO.util.DataSource.TYPE_JSARRAY"
                    responseSchema="${[
                            fields: ['id', 'company', 'price', 'change', 'percentChange', 'lastChange']
                    ]}"/>
        </yui-widget:DataTable>

    </body>
</html>