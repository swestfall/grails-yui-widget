package grails.yui.widget

import org.codehaus.groovy.grails.web.taglib.GroovyPageTagBody;
import org.codehaus.groovy.grails.web.taglib.GroovyPageAttributes;

class UtilTagLib {

    static namespace = "yuiWidget"

    def javascript = { attrs, body ->

        out << """
            <script type="text/javascript" src="${resource(plugin: 'grails-yui-widget', dir: 'js', file: 'pluginResources.js')}"></script>
        """
    }

    def whatTheHellDude = {
        out << "<h1>testTag results</h1>"
    }

    def testTag2 = {
        out << "<h1>testTag2 results</h1>"
    }
}
