//
//  FavouriteListView.swift
//  EcomProductSwiftUIiOSApp
//
//  Created Abhay Singh  on 12/27/22.
//

import SwiftUI

struct FavouriteListView: View {
  @ObservedObject var viewModel: ToFavouriteListViewModel
  @EnvironmentObject var heartsProvider: HeartsProvider
  var body: some View {
    
    List(viewModel.products) { item in
      NavigationLink {
        viewModel.viewForSelectedProduct(item.product)
      } label: {
        ProductRow(product: item.product, heartsProvider: _heartsProvider, function: {
          viewModel.addOrRemoveProductFromFavourite(product: item.product)
        }).padding(3)
      }
    }
    
  }
  
}


