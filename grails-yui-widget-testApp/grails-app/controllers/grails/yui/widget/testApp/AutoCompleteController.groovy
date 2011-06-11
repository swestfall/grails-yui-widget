package grails.yui.widget.testApp

class AutoCompleteController {

    def index = { }

    def allExamples = { }

    def localData = {
        List stocks = Stock.findAll().collect() {return it.company}
        return [stocks: stocks]
    }
}