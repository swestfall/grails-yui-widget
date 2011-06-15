package grails.yui.widget.testapp

import grails.yui.widget.UtilTagLib

class LocalTagLib {

    static namespace = "local"

    def liquidYuiDataTable = { attrs, body ->
        def events = attrs.events ?: []
        events << [type: 'postRenderEvent', fn: 'function() { this.getTableEl().style.width = "100%"; }']
        attrs.events = events
        out << yuiWidget.yuiDataTable(attrs, body)
    }
}
