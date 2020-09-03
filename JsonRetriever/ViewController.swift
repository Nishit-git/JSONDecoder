//
//  ViewController.swift
//  JsonRetriever
//
//  Created by Nishit Bhuchar on 2020-09-02.
//  Copyright © 2020 Nishit Bhuchar. All rights reserved.
//

import UIKit

struct object: Decodable{
    var conformsTo: String?
    var describedBy: String?
    var dataset: [Dataset]
    
}
struct Dataset: Decodable {
    var title: String?
    var modified: String?
    var accessLevel: String?
    var identifier: String?
    var contactPoint: contactPoint
//    init(json: [String: Any]) {
//        title = json["title"] as? String ?? ""
//        modified = json["modified"] as? Date ?? Date()
//        accessLevel = json["accessLevel"] as? String ?? ""
//    }
}

struct contactPoint: Decodable{
    var fn: String?
    var hasEmail: String?
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        let urlString: String = "https://www.sba.gov/sites/default/files/data.json"
        guard let url = URL(string: urlString) else {return }
    
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return }
//            let dataAsString = String(data: data, encoding: .utf8)
//            print (dataAsString)
            do{
                
                let dataSet = try JSONDecoder().decode(object.self, from: data)
                print(dataSet)
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else{return}
//
//                let dataSet = Dataset(json: json)
//                print(dataSet.title)
            } catch let jsonError{
                
                print("Error serializing JSON response", jsonError)
            }
            
            
        }.resume()
    
    }
    
}
