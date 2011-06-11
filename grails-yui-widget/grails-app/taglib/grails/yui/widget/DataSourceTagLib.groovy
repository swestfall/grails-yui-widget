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
        ${dataSourceID} = new YAHOO.util.DataSource(${data as JSON}, ${Util.toJSON(config)});
        ${dataSourceID}.responseType = "${responseType}";
        ${dataSourceID}.responseSchema = ${Util.toJSON(responseSchema)}

        //attach any events created
        ${eventStrings.join()}
        """
    }
}


