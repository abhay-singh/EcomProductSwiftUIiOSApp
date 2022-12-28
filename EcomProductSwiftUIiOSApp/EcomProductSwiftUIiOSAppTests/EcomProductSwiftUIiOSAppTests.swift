//
//  EcomProductSwiftUIiOSAppTests.swift
//  EcomProductSwiftUIiOSAppTests
//
//  Created by Abhay Singh on 12/26/22.
//

import XCTest
import Combine
@testable import EcomProductSwiftUIiOSApp

class EcomProductSwiftUIiOSAppTests: XCTestCase {
  
  private let product = Product(
    citrusID: "123124", title: "Wine", id: "545345", imageURL: "sdfsdf", price: [], brand: "dsfdsf", badges: [], ratingCount: 23.0, messages: Messages.init(secondaryMessage: "addaf", sash: Sash(), promotionalMessage: "dfsdfs"), isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText.addToCart, isInTrolley:true, isInWishlist: true, purchaseTypes: [], isFindMeEnable: true, saleUnitPrice: 3234.0, totalReviewCount: 2, isDeliveryOnly: true, isDirectFromSupplier: true)
  
  private var cancellables = Set<AnyCancellable>()
  private var controller: ProductController!
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      controller = ProductController()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      controller = nil
    }
  

  func testAPIForProductList()  {
    APIManager.shared.fetchProductForUrl { ecomProduct, flag in
      XCTAssertTrue(flag)
      XCTAssertNil(ecomProduct)
    }
  }
  
  func testAddOrRemoveProductAddWhenProductIsNotInFavouriteList() {
    let viewModel = ProductDetailViewModel(product: product, productController: controller)
    
    XCTAssertFalse(controller.isProductInFavouriteList(product))
     
    XCTAssertEqual(viewModel.addOrRemoveProductTextFromFavourite, "Add to favourite list")
  }
  
  func testAddOrRemoveProductRemoveWhenProductIsInFavouriteList() {

    controller.addToFavourite(product: product)
    XCTAssertTrue(controller.isProductInFavouriteList(product))
    
    let viewModel = ProductDetailViewModel(product: product, productController: controller)
    
    XCTAssertEqual(viewModel.addOrRemoveProductTextFromFavourite, "Remove from favourite list")
  }

}
