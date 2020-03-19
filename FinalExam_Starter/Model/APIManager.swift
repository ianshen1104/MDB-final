//
//  APIManager.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A class containing static methods to make API calls
 */
class APIManager {
    static let BASE_STRING  = "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats"
    

    /**
     A static method which makes an API call to retrieve data from the API. It passes this data
     to the caller via the provided completion method.
     */
    static func retrieveData(for country: String?, completion: @escaping ([ProvinceData]) -> ()) {
        // Part 1C
        let headers = [
            "x-rapidapi-host": "covid-19-coronavirus-statistics.p.rapidapi.com",
            "x-rapidapi-key": "SIGN-UP-FOR-KEY"
        ]
        var request = URLRequest(url: URL(string: "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=Canada")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            guard let request = try? JSONDecoder().decode(APIResponse.self, from: data) else {
                return
            }
            completion(request.provinces!)
        }
        task.resume()
    }
}


import Foundation
