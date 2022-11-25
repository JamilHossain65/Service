//
//  ProductDetailVM.swift
//  Service
//
//  Created by Hamza on 12/11/2022.
//

import Foundation

class ProdctDetailVM {
    var productDetail: ProductDetailModel?
    var cartList = [CartModel]()
    var cartPrice = 0
    
}
extension ProdctDetailVM {
    
    func getProductDeatil(id: Int,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .productDetail(id)) { (result: Result<ProductDetailRootModel>) in
            switch result {
            case .success(let value):
                guard let detaile = value.oData else { completion(value.message); return}
                self.productDetail =  detaile
                value.code == 201 ?  completion(nil) :  completion(value.errors?.first?.value.stringValue)
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func addToCart(request: AddToCartRequest,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .addToCart(request)) { (result: Result<ProductDetailRootModel>) in
            switch result {
            case .success(let value):
                value.code == 201 ?  completion(nil) :  completion(value.errors?.first?.value ?? "")
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func getCart(completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .getCart) { (result: Result<CartRootModel>) in
            switch result {
            case .success(let value):
                self.cartList = value.oData?.cartList ?? []
                self.cartPrice = value.oData?.totalCartPrice ?? 0
                value.code == 200 ?  completion(nil) :  completion(value.errors?.first?.value ?? "")
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func deleteCart(id: Int,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .deleteCartItem(id)) { (result: Result<CartBaseModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ? completion(nil) : completion(value.message ?? "Error")
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func plusCart(id: Int,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .plusCartItem(id)) { (result: Result<CartBaseModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ? completion(nil) : completion(value.message ?? "Error")
            case .failure(let string):
                completion(string)
            }
        }
    }
    
    func minusCart(id: Int,completion: @escaping(String?) -> Void) {
        APIClient.shared.request(path: .minusCartItem(id)) { (result: Result<CartBaseModel>) in
            switch result {
            case .success(let value):
                value.code == 200 ? completion(nil) : completion(value.message ?? "Error")
            case .failure(let string):
                completion(string)
            }
        }
    }
}
