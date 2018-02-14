//
//  ViewController.swift
//  JsonDecoder
//
//  Created by Ozgur Toprak on 14.02.2018.
//  Copyright © 2018 Ozgur Toprak. All rights reserved.

import UIKit

struct Course {
    let id: Int
    let name: String
    let link: String
    let imageURL: String
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageURL = json["imageURL"] as? String ?? ""
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard  let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            //            let dataAsString = String(data: data, encoding: .utf8)
            //            print(dataAsString)
            
            do {
                guard let json  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else { return }
                
                let course = Course(json: json)
                print(course.name
                )
                
            } catch let jsonnErr {
                print("Error seriaalizin json:",jsonnErr)
            }
            
            }.resume()
        
        
    }
    
    
    
}

