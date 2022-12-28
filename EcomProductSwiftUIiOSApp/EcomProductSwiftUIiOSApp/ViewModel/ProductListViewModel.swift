//
//  ProductListViewModel.swift
//  EcomProductSwiftUIiOSApp
//
//  Created by Abhay Singh on 12/27/22.
//
import Foundation
import Combine

class ProductListViewModel: ObservableObject {
  
  @Published var products: [Product] 
  private let productController: ProductController
  let viewForSelectedProduct: (Product) -> ProductDetailView
  
  init(products: [Product] = [], productController: ProductController, viewForSelectedProduct: @escaping (Product) -> ProductDetailView) {
    self.products = products
    self.productController = productController
    self.viewForSelectedProduct = viewForSelectedProduct
  }
  
  
  func fetchProductList() {
    APIManager.shared.fetchProductForUrl {[weak self] productData, responseFlag in
      if responseFlag {
        DispatchQueue.main.async {
          self?.products = productData!.products
        }
      } else {
        
      }
    }
  }
  
  func addOrRemoveProductFromCart(product: Product) {
    if productController.isProductInCartList(product) {
      productController.removeFromCart(product: product)
    } else {
      productController.addToCart(product: product)
    }
  }
  
  func addOrRemoveProductFromFavourite(product: Product) {
    if productController.isProductInFavouriteList(product) {
      productController.removeFromFavourite(product: product)
    } else {
      productController.addToFavourite(product: product)
    }
  }
  
  func isProductFavourite(product: Product)-> Bool {
    return productController.isProductInFavouriteList(product)
  }
  
}
