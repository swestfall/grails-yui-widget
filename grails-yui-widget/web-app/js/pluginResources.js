if (!window.grails) {
    grails = {};
}

grails.yui = {};

/* components instantiated by taglib */
grails.yui.components = {};

/* contains predefined formatters */
grails.yui.formatters = {};

/* contains reusable event handlers */
grails.yui.events = {};

/* contains reusable utility methods */
grails.yui.util = {
    buildQueryString: function(oState, oDataTable) {

        // Get states or use defaults.  when called by initialReqest, arguments will be null
        oState = oState || { pagination: null, sortedBy: null };
        var sort = (oState.sortedBy) ? oState.sortedBy.key : "id";
        var order = (oState.sortedBy && oState.sortedBy.dir === YAHOO.widget.DataTable.CLASS_DESC) ? "desc" : "asc";
        var offset = (oState.pagination) ? oState.pagination.recordOffset : 0;
        var max = (oState.pagination) ? oState.pagination.rowsPerPage : 25;
        debugger;

        // Build custom request
        var queryString = "?sort=" + sort +
                "&order=" + order +
                "&offset=" + offset +
                "&max=" + max

        return queryString;
    },
    doBeforeLoadData : function(oRequest, oResponse, oPayload) {
        debugger;
        oPayload.totalRecords = oResponse.meta.totalRecords;
        oPayload.pagination.recordOffset = oResponse.meta.startIndex;
        return oPayload;
    }
}
