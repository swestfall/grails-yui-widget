package grails.yui.widget.testApp

import grails.converters.JSON
import grails.converters.XML

class AutoCompleteController {

    def index = { }

    def localData = {
        List stocks = Stock.findAll().collect() {return it.company}
        return [stocks: stocks]
    }

    def remoteJSONData = {

    }

    def remoteXMLData = {

    }

    def searchStockByCompanyJSON = {
        String query = params.remove('query');
        List stocks = Stock.findAllByCompanyLike(query + '%').collect() {return [companyName: it.company]}
        Map returnMap = [results: stocks]
        render returnMap as JSON
    }

    def searchStockByCompanyXML = {
        String query = params.remove('query');
        List stocks = Stock.findAllByCompanyLike(query + '%').collect() {return [companyName: it.company]}
        render stocks as XML
    }
}