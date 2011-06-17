package grails.yui.widget.testapp

import grails.yui.widget.UtilTagLib

class LocalTagLib {

    static namespace = "local"

    def liquidYuiDataTable = { attrs, body ->

        //attach the liquid width event
        def events = attrs.events ?: []
        events << [type: 'postRenderEvent', fn: 'function() { this.getTableEl().style.width = "100%"; }']
        attrs.events = events

        out << yuiWidget.yuiDataTable(attrs, body)
    }

    def remoteDataTable = { attrs, body ->

        //set the config up for remoting
        def config = attrs.config ?: [:]
        config.generateRequest = '@grails.yui.util.buildQueryString'
        config.initialRequest = '?max=5&offset=0&sort=id&order=asc'
        config.dynamicData = true
        config.sortedBy = [key: 'id', dir: '@YAHOO.widget.DataTable.CLASS_ASC']
        attrs.config = config;

        //set the props for remoting
        def props = attrs.props ?: [:]
        props.handleDataReturnPayload = '@grails.yui.util.handleDataReturnPayload'
        attrs.props = props

        //set the namespace
        attrs.namespace = "grails.yui.components"

        //run the tag
        out << yuiWidget.yuiDataTable(attrs, body)

    }

    def remoteDataSource = { attrs, body ->

        def fields = attrs.remove('fields')

        //set the configs for remoting
        def config = attrs.config ?: [:]
        config.responseType = '@YAHOO.util.DataSource.TYPE_JSON'
        config.responseSchema = config.responseSchema ?: [:]
        config.responseSchema.resultsList = 'results'
        config.fields = fields
        config.responseSchema.metaFields = [totalRecords: 'totalRecords']
        attrs.config = config

        //run the tag
        out << yuiWidget.yuiXHRDataSource(attrs, body)
    }

    def remotePaginator = { attrs, body ->

        //set the configs for remoting
        def config = attrs.config ?: [:]
        config.rowsPerPage = 5
        attrs.config = config

        //run the tag
        out << yuiWidget.yuiPaginator(attrs, body)

    }

    //TODO: Liquid Width solution doesnt work well with Remoting Grids.  Due to "Loading" behavior
    //TODO: Liquid Width on Scrollable -- wont work w/o heavy customization. Grid can be set to 100% width via external config.
    //TODO: Liquid Width on Scrollable -- internal table set to 100% works.  header columns are seperate though.
    //TODO: Liquid Width on Scrollable -- need solution that follows containing element size and sets internals acoordingly
}
