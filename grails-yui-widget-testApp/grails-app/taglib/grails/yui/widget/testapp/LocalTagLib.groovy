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

    def formCalendar = { attrs, body ->

        //TODO: Respect Namespaces
        //TODO: Pass through configs
        //TODO: Calendar should read in input value

        def calID = attrs.id
        def inputID = attrs.inputID
        def containerID = calID + '_container'
        def dialogID = calID + '_dialog'

        //output the required html
        out << """
        <div class="box">
            <div class="datefield">
                <label for="${inputID}">Date:</label>
                <input type="text" id="${inputID}" name="date" value=""/>
                <button type="button" id="show" title="Show Calendar" onclick="grails.yui.components.grailsYuiDialog_${dialogID}.show()">
                    <img src="assets/calbtn.gif" width="18" height="18" alt="Calendar">
                </button>
            </div>
        </div>
        """

        //configure the dialog tag
        def dialogAttrs = [:]
        dialogAttrs.id = dialogID
        dialogAttrs.config = [
                visible: false,
                draggable: false,
                close: true,
                context: ['show', 'tl', 'bl']]
        dialogAttrs.methods = [
                "setHeader('Pick a Date')",
                "setBody(\'<div id=\"${containerID}\"></div><div style=\"clear: both;\"></div>\')",
                "beforeShowEvent.subscribe(window.handleCalendarBeforeShow, {inputID: '${inputID}', namespace: grails.yui.components, calID: '${calID}' })",
                "render(document.body)"
        ]

        //run the dialog tag
        out << yuiWidget.yuiDialog(dialogAttrs, body)

        //configure the calendar tag
        def calAttrs = [:]
        calAttrs.id = attrs.id
        calAttrs.container = containerID
        calAttrs.config = [
                iframe: false,
                hide_blank_weeks: true
        ]
        calAttrs.methods = [
                "selectEvent.subscribe(window.handleCalendarSelect, {inputID: '${inputID}', calID : grails.yui.components.grailsYuiCalendar_${calID}, dialogID: grails.yui.components.grailsYuiDialog_${dialogID} })",
                "render()"
        ]

        //run the calendar tag
        out << yuiWidget.yuiCalendar(calAttrs, body)
    }

//TODO: Liquid Width solution doesnt work well with Remoting Grids.  Due to "Loading" behavior
//TODO: Liquid Width on Scrollable -- wont work w/o heavy customization. Grid can be set to 100% width via external config.
//TODO: Liquid Width on Scrollable -- internal table set to 100% works.  header columns are seperate though.
//TODO: Liquid Width on Scrollable -- need solution that follows containing element size and sets internals acoordingly
}
