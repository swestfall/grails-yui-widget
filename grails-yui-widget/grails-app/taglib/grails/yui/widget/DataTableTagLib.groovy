package grails.yui.widget

import grails.converters.JSON

class DataTableTagLib {

    static namespace = "yuiWidget"

    def yuiDataTable = { attrs, body ->

        def id = attrs.remove('id')
        def columns = attrs.remove('columns')
        def events = attrs.remove('events') ?: []
        def props = attrs.remove('props') ?: []
        def namespace = attrs.remove('namespace') ?: 'window'
        def config = attrs.remove('config') ?: [:]
        def liquidWidth = attrs.remove('liquidWidth')?.toBoolean() ?: false
        def editable = attrs.remove('editable')?.toBoolean() ?: false

        def elementID = "grailsYuiDataTableEl_${id}"
        def dataTableID = "${namespace}.grailsYuiDataTable_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"
        def paginatorID = "${namespace}.grailsYuiPaginator_${id}"

        pageScope.dataSourceID = dataSourceID
        pageScope.paginatorID = paginatorID
        pageScope.usePaginator = false

        //run the internal tags
        def internalTags = body()

        if (pageScope.usePaginator == true) {
            config['paginator'] = "@${paginatorID}".toString()
        }

        if (liquidWidth) {
            events << [type: 'postRenderEvent', fn: 'function() { this.getTableEl().style.width = "100%"; }']
        }
        if (editable) {
            events << [type: 'cellClickEvent', fn: "${dataTableID}.onEventShowCellEditor"]
        }
        def eventStrings = Util.buildEventStrings(dataTableID, events)


        out << """
<div id="${elementID}"></div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){

        ${internalTags}

        ${dataTableID} = new YAHOO.widget.DataTable("${elementID}",
            ${Util.toJSON(columns)}, ${dataSourceID}, ${Util.toJSON(config)});

        //attach any properties
        grails.yui.util.applyConfig(${dataTableID}, ${Util.toJSON(props)});

        //attach any events created
        ${eventStrings.join()}




     });
</script>
        """
    }


    def yuiScrollingDataTable = { attrs, body ->

        def id = attrs.remove('id')
        def columns = attrs.remove('columns')
        def events = attrs.remove('events') ?: []
        def namespace = attrs.remove('namespace') ?: 'window'
        def config = attrs.remove('config') ?: [:]
        def liquidWidth = attrs.remove('liquidWidth')?.toBoolean() ?: false
        def editable = attrs.remove('editable')?.toBoolean() ?: false

        def elementID = "grailsYuiDataTableEl_${id}"
        def dataTableID = "${namespace}.grailsYuiDataTable_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"
        def paginatorID = "${namespace}.grailsYuiPaginator_${id}"

        pageScope.dataSourceID = dataSourceID
        pageScope.paginatorID = paginatorID
        pageScope.usePaginator = false

        //run the internal tags
        def internalTags = body()

        if (pageScope.usePaginator == true) {
            config.paginator = paginatorID
        }

        //TODO: liquidWidth doesnt work
        if (liquidWidth) {
            events << [type: 'postRenderEvent', fn: 'function() { this.getTableEl().style.width = "100%"; }']
        }
        if (editable) {
            events << [type: 'cellClickEvent', fn: "${dataTableID}.onEventShowCellEditor"]
        }
        def eventStrings = Util.buildEventStrings(dataTableID, events)




        out << """
<div id="${elementID}"></div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){

        ${internalTags}

        ${dataTableID} = new YAHOO.widget.ScrollingDataTable("${elementID}",
            ${Util.toJSON(columns)}, ${dataSourceID}, ${Util.toJSON(columns)});

        ${dataTableID}.doBeforeLoadData = window.doBeforeLoadData

        //attach any events created
        ${eventStrings.join()}

     });
</script>
        """
    }

    //TODO: Lots of copy/paste in here.  Need common code

    //TODO: Liquid Width behaviors are non-standard yui - move out of this code.
    //TODO: Liquid Width of Grid can be done via PostRenderEvent or specific CSS Rule.  Need to decide which is better
    //TODO: Liquid Width solution doesnt work well with Remoting Grids.  Due to "Loading" behavior
    //TODO: Liquid Width on Scrollable -- wont work w/o heavy customization. Grid can be set to 100% width via external config.
    //TODO: Liquid Width on Scrollable -- internal table set to 100% works.  header columns are seperate though.
    //TODO: Liquid Width on Scrollable -- need solution that follows containing element size and sets internals acoordingly


}
