//
//  ProductViewModel.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 24/01/2021.
//

import Foundation
import UIKit

class ProductViewModel : NSObject {
    
    //private var apiService : WebService!
    private(set) var productData : ProductList! {
        didSet {
            self.bindProductViewModelToController()
        }
    }
    var bindProductViewModelToController : (() -> ()) = {}
    var bindApiError : ((_ error : String) -> Void) = {_ in }
    override init() {
        super.init()
        //self.apiService =  WebService()
        callFuncToGetProductsData()
    }
    func callFuncToGetProductsData() {
        WebService.shared.fetchProducts { (product, error) in
            
            if let err = error {
                print("Failed to fetch products:", err)
                switch err {
                case .apiFailure(let error), .unAuthorizeError(let error):
                    self.bindApiError(error)
                    print(error)
                    break
                }
                return
            }
            self.productData = product
        }
    }
    
}
