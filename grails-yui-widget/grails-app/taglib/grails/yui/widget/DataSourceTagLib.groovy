package grails.yui.widget

import grails.converters.JSON

class DataSourceTagLib {

    static namespace = "yuiWidget"

    def yuiLocalDataSource = { attrs, body ->

        def dataSourceID = pageScope.dataSourceID
        def data = attrs.remove('data')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]

        def eventStrings = Util.buildEventStrings(dataSourceID, events)

        out << """
        ${dataSourceID} = new YAHOO.util.LocalDataSource(${data as JSON}, ${Util.toJSON(config)});
        //attach any events created
        ${eventStrings.join()}
        """
    }

    def yuiXHRDataSource = { attrs, body ->

        def dataSourceID = pageScope.dataSourceID
        def url = attrs.remove('url')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]

        def eventStrings = Util.buildEventStrings(dataSourceID, events)

        out << """
        ${dataSourceID} = new YAHOO.util.XHRDataSource("${url}", ${Util.toJSON(config)});
        //attach any events created
        ${eventStrings.join()}
        """
    }
}


