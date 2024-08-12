//
//  URLHelper.swift
//  MediFInderApp
//
//  Created by Octavio on 12/08/24.
//

import Foundation

func generateAdverseQuery(
    countCriteria: String,
    countKey: String,
    limit: String) -> String{
    
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.fda.gov"
        components.path = "/drug/event.json"
        
        components.queryItems = [
                  URLQueryItem(name: "search", value: countCriteria),
                  URLQueryItem(name: "count", value: countKey),
                  URLQueryItem(name: "limit", value: limit)
                ]
        
        return components.string!
        
}

func generateSearchQuery(
    nameCriteria: String,
    limit: String) -> String{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.fda.gov"
        components.path = "/drug/label.json"
        
        components.queryItems = [
                  URLQueryItem(name: "search", value: nameCriteria),
                  URLQueryItem(name: "limit", value: limit)
                ]
        
        return components.string!
}

func generateNameCriteria(
    searchType: String,
    query: String) -> String{
        
        return "openfda.\(searchType):\(query)"
        
    }

func generateCountCriteria(
    med1: String,
    med2: String,
    reaction: String) -> String{
        
        return "patient.drug.medicinalproduct:\(med1)+AND+patient.drug.medicinalproduct:\(med2)+AND+patient.reaction.reactionmeddrapt:\(reaction)"
        
    }
