//
//  MessageService.swift
//  smack-app
//
//  Created by Raul Ernesto Villarreal Sigala on 7/15/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error != nil {
                
                guard let data = response.data else { return }
                
                // Swift 4 way with Decodable Struct
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
//
//                print(self.channels)
                
                // SwiftyJSON way
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue

                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)

                            self.channels.append(channel)
                        }
                        
                        completion(true)
                    }
                } catch {
                    print(error)
                }
                
                
            } else {
                completion(false)
                print(response.result.error as Any)
            }
            
        }
        
    }
    
}
