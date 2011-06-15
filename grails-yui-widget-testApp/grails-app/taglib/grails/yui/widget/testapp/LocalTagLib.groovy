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

    //TODO: Liquid Width solution doesnt work well with Remoting Grids.  Due to "Loading" behavior
    //TODO: Liquid Width on Scrollable -- wont work w/o heavy customization. Grid can be set to 100% width via external config.
    //TODO: Liquid Width on Scrollable -- internal table set to 100% works.  header columns are seperate though.
    //TODO: Liquid Width on Scrollable -- need solution that follows containing element size and sets internals acoordingly
}
