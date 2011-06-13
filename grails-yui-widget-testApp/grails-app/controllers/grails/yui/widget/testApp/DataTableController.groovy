package grails.yui.widget.testApp

import grails.converters.JSON
import grails.yui.widget.Util

class DataTableController {

    def index = {
    }

    def localData = {
        List stocks = Stock.findAll()
        return [stocks: stocks]
    }

    def scrollingGrid = {
        List stocks = Stock.findAll()
        return [stocks: stocks]
    }

    def editableGrid = {
        List stocks = Stock.findAll()
        return [stocks: stocks]
    }

    def remoteJSONData = {

    }

    def remoteJSONDataWithSorting = {

    }

    def remoteJSONDataWithPaging = {

    }

    def getStocksJSON = {
        List stocks = Stock.findAll()
        Map returnMap = [
                results: stocks
        ]
        render returnMap as JSON
    }

    def getStocksJSONSortedPaged = {
        Map pagingParams = Util.extractPaginationParams(params)
        List stocks = Stock.list(pagingParams)
        Map returnMap = [
                totalRecords: Stock.count(),
                results: stocks
        ]
        render returnMap as JSON
    }
}
