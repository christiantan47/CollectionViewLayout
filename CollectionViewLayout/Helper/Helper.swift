//
//  Helper.swift
//  CollectionViewLayout
//
//  Created by Hubert Wang on 22/04/19.
//  Copyright © 2019 Tan Christian. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static let shared = Helper()
    
    private init() {}
    
    /**
     Fetch image from using a URL. Make sure Internet connection is active. Completion handler runs in background thread asynchronously (need to Dispatch and put the task into main thread)
     
     - Parameters:
         - url: A valid URL of type String
         - completion: A normal escaping completion handler with UIImage and Error
     
     - Return: None
    */
    func fetchImage(from url: String, _ completion: @escaping((UIImage?, Error?) -> Void)) {
        guard let url = URL(string: url) else {
            completion(nil, (Error.self as! Error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            completion(UIImage(data: data), nil)
        }.resume()
        
    }
}
