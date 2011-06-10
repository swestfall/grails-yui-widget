package grails.yui.widget

import grails.converters.JSON

class DataTableTagLib {

    static namespace = "yuiWidget"

    def yuiDataTable = { attrs, body ->

        def id = attrs.remove('id')
        def columns = attrs.remove('columns')
        def events = attrs.remove('events') ?: []
        def namespace = attrs.remove('namespace') ?: 'window'
        def config = attrs.remove('config') ?: [:]

        def elementID = "grailsYuiDataTableEl_${id}"
        def dataTableID = "${namespace}.grailsYuiDataTable_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"

        pageScope.dataSourceID = dataSourceID

        def eventStrings = Util.buildEventStrings(dataTableID, events)


        out << """
<div id="${elementID}"></div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){

        ${body()}

        ${dataTableID} = new YAHOO.widget.DataTable("${elementID}",
            ${Util.toJSON(columns)}, ${dataSourceID}, ${config as JSON});

        //attach any events created
        ${eventStrings.join()}

     });
</script>
        """
    }

}

//TODO: DataSource TagLib
//TODO: Config Object
//TODO: Config w/ JS Reference.  Cant be string.