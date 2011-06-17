package grails.yui.widget

class PaginatorTagLib {

    static namespace = "yuiWidget"

    def util = GrailsYuiWidgetUtil.getInstance();

    def yuiPaginator = { attrs, body ->

        pageScope.usePaginator = true
        def paginatorID = pageScope.paginatorID
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]
        def props = attrs.remove('props') ?: []
        def methods = attrs.remove('methods') ?: []

        def eventStrings = util.buildEventStrings(paginatorID, events)

        out << """
        ${paginatorID} = new YAHOO.widget.Paginator(${util.toJSON(config)});
        grails.yui.util.applyConfig(${paginatorID}, ${util.toJSON(props)});
        ${util.buildEventStrings(paginatorID, events).join()}
        ${util.buildMethodStrings(paginatorID, methods).join()}
        """

    }
}
