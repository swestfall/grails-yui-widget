package grails.yui.widget

class DataTableTagLib {

    static namespace = "yuiWidget"

    def util = GrailsYuiWidgetUtil.getInstance();

    def yuiDataTable = { attrs, body ->

        //pull the config properties & set defaults
        def id = attrs.remove('id')
        def columns = attrs.remove('columns')
        def events = attrs.remove('events') ?: []
        def props = attrs.remove('props') ?: []
        def namespace = attrs.remove('namespace') ?: 'grails.yui.components'
        def config = attrs.remove('config') ?: [:]
        def editable = attrs.remove('editable')?.toBoolean() ?: false
        def methods = attrs.remove('methods') ?: []

        //set ids
        def elementID = "grailsYuiDataTableEl_${id}"
        def dataTableID = "${namespace}.grailsYuiDataTable_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"
        def paginatorID = "${namespace}.grailsYuiPaginator_${id}"

        //attach scope for consuming code
        pageScope.dataSourceID = dataSourceID
        pageScope.paginatorID = paginatorID
        pageScope.usePaginator = false

        //run the internal tags
        def internalTags = body()

        //setup paginator if used
        if (pageScope.usePaginator == true) {
            config['paginator'] = "@${paginatorID}".toString()
        }

        //setup editable if used
        if (editable) {
            events << [type: 'cellClickEvent', fn: "${dataTableID}.onEventShowCellEditor"]
        }


        out << """
<div id="${elementID}"></div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){
        ${internalTags}
        ${dataTableID} = new YAHOO.widget.DataTable("${elementID}",
            ${util.toJSON(columns)}, ${dataSourceID}, ${util.toJSON(config)});
        grails.yui.util.applyConfig(${dataTableID}, ${util.toJSON(props)});
        ${util.buildEventStrings(dataTableID, events).join()}
        ${util.buildMethodStrings(dataTableID, methods).join()}

     });
</script>
        """
    }


    def yuiScrollingDataTable = { attrs, body ->

        //pull the config properties & set defaults
        def id = attrs.remove('id')
        def columns = attrs.remove('columns')
        def events = attrs.remove('events') ?: []
        def props = attrs.remove('props') ?: []
        def namespace = attrs.remove('namespace') ?: 'grails.yui.components'
        def config = attrs.remove('config') ?: [:]
        def editable = attrs.remove('editable')?.toBoolean() ?: false
        def methods = attrs.remove('methods') ?: []

        //set ids
        def elementID = "grailsYuiDataTableEl_${id}"
        def dataTableID = "${namespace}.grailsYuiDataTable_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"
        def paginatorID = "${namespace}.grailsYuiPaginator_${id}"

        //attach scope for consuming code
        pageScope.dataSourceID = dataSourceID
        pageScope.paginatorID = paginatorID
        pageScope.usePaginator = false

        //run the internal tags
        def internalTags = body()

        //setup paginator if used
        if (pageScope.usePaginator == true) {
            config.paginator = paginatorID
        }

        //setup editable if used
        if (editable) {
            events << [type: 'cellClickEvent', fn: "${dataTableID}.onEventShowCellEditor"]
        }

        out << """
<div id="${elementID}"></div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){
        ${internalTags}
        ${dataTableID} = new YAHOO.widget.ScrollingDataTable("${elementID}",
            ${util.toJSON(columns)}, ${dataSourceID}, ${util.toJSON(config)});
        grails.yui.util.applyConfig(${dataTableID}, ${util.toJSON(props)});
        ${util.buildEventStrings(dataTableID, events).join()}
        ${util.buildMethodStrings(dataTableID, methods).join()}
     });
</script>
        """
    }

}
