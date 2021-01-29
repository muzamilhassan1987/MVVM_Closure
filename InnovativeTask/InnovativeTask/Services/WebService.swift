//
//  WebService.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 24/01/2021.
//

import Foundation
class WebService: NSObject {
    static let shared = WebService()
    
    func authenticateUser(param : [String : Any],completion: @escaping (User?, AppError?) -> ()) {
        
        let urlString = String(format: "http://94.206.102.22/app/authenticate")
        guard let url = URL(string: urlString) else { return }
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                DispatchQueue.main.async {
                    completion(nil, AppError.apiFailure("Failure"))
                }
                print("Failed to fetch products:", err)
                return
            }
            
            if let httpResponse = resp as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                switch httpResponse.statusCode {
                case ServiceCodes.authExpireCode:
                    DispatchQueue.main.async {
                        completion(nil, AppError.unAuthorizeError("You are unauthorized"))
                    }
                    break
                default:
                    break
                }
            }
            guard let data = data else { return }
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                print(user)
                DispatchQueue.main.async {
                    completion(user, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
    
    func fetchProducts(completion: @escaping (ProductList?, AppError?) -> ()) {
        
        let urlString = String(format: "http://94.206.102.22/app/item-list")
        guard let url = URL(string: urlString) else { return }
        //let parameterDictionary = [:]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(CurrentUser.loggedInUser?.token ?? "")", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                DispatchQueue.main.async {
                    completion(nil, AppError.apiFailure("Failure"))
                }
                print("Failed to fetch products:", err)
                return
            }
            if let httpResponse = resp as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                switch httpResponse.statusCode {
                case ServiceCodes.authExpireCode:
                    DispatchQueue.main.async {
                        completion(nil, AppError.unAuthorizeError("You are unauthorized"))
                    }
                    break
                default:
                    break
                }
            }
            guard let data = data else { return }
            do {
                let productList = try JSONDecoder().decode(ProductList.self, from: data)
                print(productList)
                DispatchQueue.main.async {
                    completion(productList, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
    
    
}
