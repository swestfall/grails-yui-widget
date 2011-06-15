package grails.yui.widget.testApp

class LocalController {

    def index = { }

    def liquidDataTable = {
        List stocks = Stock.findAll()
        return [stocks: stocks]
    }
}
