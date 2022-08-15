//
//  Request.swift
//  Pollen Index
//
//  Created by Carl Burnham on 7/11/19.
//  Copyright © 2019 Carl Burnham. All rights reserved.
//

import Foundation

public enum Response<T> {
    case success(T)
    case failure(error: String)
}

public protocol Request {
    
    associatedtype ResultObject: Decodable
    
    var endpoint: String { get }
    var headers: [String: String] { get }
}

public extension Request {
    
    var headers: [String: String] {
        return [:]
    }
    
    func makeRequest(result: @escaping (Response<ResultObject>) -> ()) {
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        print(url)
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                result(.failure(error: error!.localizedDescription))
                return
            }
            guard let responseData = data else {
                result(.failure(error: "Error: did not receive data"))
                return
            }
            
            do {
                let resultObject = try JSONDecoder().decode(ResultObject.self, from: responseData)
                DispatchQueue.main.async {
                    result(.success(resultObject))
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    result(.failure(error: "Error: did not receive data"))
                }
            }
        })
        task.resume()
    }
}
