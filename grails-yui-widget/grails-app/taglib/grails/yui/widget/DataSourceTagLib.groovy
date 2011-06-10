package grails.yui.widget

import grails.converters.JSON

class DataSourceTagLib {

    static namespace = "yuiWidget"

    def yuiDataSource = { attrs, body ->

        def dataSourceID = pageScope.dataSourceID
        def data = attrs.remove('data')
        def responseType = attrs.remove('responseType')
        def responseSchema = attrs.remove('responseSchema')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]

        def eventStrings = Util.buildEventStrings(dataSourceID, events)

        out << """
        ${dataSourceID} = new YAHOO.util.DataSource(${data as JSON}, ${config as JSON});
        ${dataSourceID}.responseType = "${responseType}";
        ${dataSourceID}.responseScehma = ${responseSchema as JSON}

        //attach any events created
        ${eventStrings.join()}
        """
    }
}


