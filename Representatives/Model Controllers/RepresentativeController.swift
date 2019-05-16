//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Jordan Hendrickson on 5/16/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit

class RepresentativeController {
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping (([Representative]) -> Void )) {
        guard let url = baseURL else {completion([]);return}
        
        let stateQuery = URLQueryItem(name:"state" , value: state.lowercased())
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [stateQuery , jsonQuery]
        guard let requestURL = components?.url else { completion([]);return}
        
        let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print("error getting reps \(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data,
                let responseDataSting = String(data: data, encoding: .ascii),
                let fixedData = responseDataSting.data(using: .utf8)
                else {completion([]);return}
            
            let jsonDecoder = JSONDecoder()
            
            do{
                let resultsDictionary = try jsonDecoder.decode([String: [Representative]].self, from: fixedData)
                let repArray = resultsDictionary["results"]
                completion(repArray ?? [])
            }catch{
                print("error decoding json \(error.localizedDescription)")
                completion([])
                return
            }
        }
            dataTask.resume()
    }
}
