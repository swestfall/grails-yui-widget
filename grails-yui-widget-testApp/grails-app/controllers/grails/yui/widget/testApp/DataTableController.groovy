package grails.yui.widget.testApp

class DataTableController {

    def index = {
        redirect(action: 'allExamples')
    }

    def allExamples = {}

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
}
