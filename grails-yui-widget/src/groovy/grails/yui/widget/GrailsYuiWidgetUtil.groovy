package grails.yui.widget

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

public class GrailsYuiWidgetUtil {

    private static GrailsYuiWidgetUtil instance;

    private GrailsYuiWidgetUtil() {}

    public static GrailsYuiWidgetUtil getInstance() {
        if (instance == null) {
            instance = new GrailsYuiWidgetUtil();
        }
        return instance;
    }

    public List<String> buildEventStrings(String name, List events) {
        List<String> eventStrings = []
        events.each() { it ->
            String obj = it.obj ? it.obj : 'null'
            String scope = it.scope ? it.scope : 'null'
            eventStrings << "${name}.subscribe('${it.type}', ${it.fn}, ${obj}, ${scope}); "
        }
        return eventStrings;
    }

    public List<String> buildPropStrings(String name, List props) {
        List<String> propStrings = []
        props.each() { prop ->
            propStrings << "${name}.${prop.name} = ${prop.val}"
        }
        return propStrings
    }

    public String toJSON(Object obj) {
        if (obj instanceof Map) {
            return new org.json.JSONObject(((Map) obj)).toString();
        } else if (obj instanceof ArrayList) {
            return new org.json.JSONArray(((Collection) obj)).toString();
        }
    }

    public Map extractPaginationParams(GrailsParameterMap params) {
        Map returnMap = [:]

        def sort = params.remove('sort')
        def order = params.remove('order')
        def max = params.remove('max')
        def offset = params.remove('offset')

        if (sort) {
            returnMap.sort = sort
        }
        if (order) {
            returnMap.order = order
        }
        if (max) {
            returnMap.max = max
        }
        if (offset) {
            returnMap.offset = offset
        }

        return returnMap
    }
}
