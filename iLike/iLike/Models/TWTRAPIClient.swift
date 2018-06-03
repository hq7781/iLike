//
//  TWTRAPIClient.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation

extension TWTRAPIClient {
    
    typealias RequestUserCompletion = (_ result: RequestUserResult) -> Void
    
    enum RequestUserResult {
        case success([TwitterUser])
        case failure(Error)
    }
    
    private struct Endpoint {
        static let usersLookup = "https://api.twitter.com/1.1/users/lookup.json"
    }
    
    func fetchUsers(withUserIDs userIDs: [String], completion: @escaping RequestUserCompletion) {
        let client = TWTRAPIClient()
        let userIDsString = userIDs.joined(separator: ",")
        let params = ["user_id": userIDsString]
        var clientError: NSError?
        
        let request = client.urlRequest(withMethod: "GET", url: Endpoint.usersLookup, parameters: params, error: &clientError)
        client.sendTwitterRequest(request) { (response, data, connectionError) in
            if let error = connectionError {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.success([]))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([TwitterUser].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
