//
//  ViewController.swift
//  JsonDecoder
//
//  Created by Ozgur Toprak on 14.02.2018.
//  Copyright © 2018 Ozgur Toprak. All rights reserved.

import UIKit

struct WebsiteDescription : Decodable{
    let name : String
    let description : String
    let courses : [Course]
}

struct Course : Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard  let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
  
            do {
                let courses  = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
                
//                guard let json  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else { return }
//
//                let course = Course(json: json)
//                print(course.name)
                
                
            } catch let jsonnErr {
                print("Error seriaalizin json:",jsonnErr)
            }
            
            }.resume()
        
        
    }
    
    
    
}

