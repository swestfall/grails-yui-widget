package grails.yui.widget.testApp

import grails.converters.JSON

class AutoCompleteController {

    def index = { }

    def allExamples = { }

    def localData = {
        List stocks = Stock.findAll().collect() {return it.company}
        return [stocks: stocks]
    }

    def remoteJSONData = {

    }

    def searchStockByCompany = {
        String query = params.remove('query');
        List stocks = Stock.findAllByCompanyLike(query + '%').collect() {return [companyName: it.company]}
        render stocks as JSON
    }
}