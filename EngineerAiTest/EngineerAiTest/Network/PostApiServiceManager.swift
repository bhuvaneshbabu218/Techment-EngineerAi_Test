//
//  PostApiServiceManager.swift
//  EngineerAiTest
//
//  Created by Techment bhuvan on 09/12/19.
//  Copyright © 2019 Techment bhuvan. All rights reserved.
//

import UIKit
import Alamofire

class PostApiServiceManager {
    let baseUrlString = "https://hn.algolia.com/api/v1/"
    // MARK: - Function created to call posts api 
    func getPostsList(page: Int , completionHandler: @escaping ([PostModel])->Void,errorHandler:@escaping ()->Void)  {
        
        let UrlString = baseUrlString + "search_by_date?tags=story&page=\(page)"
        guard let url = URL(string: UrlString) else {
            return
        }
        Alamofire.request(url , method: .get).response{(responce) in
            guard let data = responce.data else{return}
            do {
                // using decodeing to get the list
                let decodeResponce  =  JSONDecoder()
                
                let decodedHits = try decodeResponce.decode(Hits.self, from: data)
                
                if decodedHits.hits.count > 0 {
                    completionHandler(decodedHits.hits)
                }else{
                    errorHandler()
                }
                
            } catch let error {
                print(error)
                errorHandler()
            }
            
            
            
        }
        
    }
}
