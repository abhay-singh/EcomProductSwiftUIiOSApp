//
//  ViewModelsFactory.swift
//  EcomProductSwiftUIiOSApp
//
//  Created by Abhay Singh on 12/27/22.
//

class ViewModelFactory {
  
  let productController = ProductController()
  
  func makeProductListViewModel() -> ProductListViewModel {
    return ProductListViewModel(productController: productController, viewForSelectedProduct: { [unowned self] in
      ProductDetailView(viewModel: self.makeProductDetailViewModel(for: $0))
    })
  }
  
  func makeProductDetailViewModel(for product: Product) -> ProductDetailViewModel {
    return ProductDetailViewModel(product: product, productController: productController)
  }
  
  func makeToFavouriteListViewModel() -> ToFavouriteListViewModel {
    return ToFavouriteListViewModel(productController: productController,viewForSelectedProduct: { [unowned self] in
      ProductDetailView(viewModel: self.makeProductDetailViewModel(for: $0))})
  }
  
  
}
