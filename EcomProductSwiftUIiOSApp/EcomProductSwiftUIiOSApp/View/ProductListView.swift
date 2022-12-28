//
//  ProductListView.swift
//  EcomProductSwiftUIiOSApp
//
//  Created by Abhay Singh on 12/27/22.
//

import SwiftUI

struct ProductListView: View {
  @ObservedObject var viewModel: ProductListViewModel
  @EnvironmentObject var heartsProvider: HeartsProvider
  
  var body: some View {
    List (viewModel.products, id: \.self){
      product in
      NavigationLink {
        viewModel.viewForSelectedProduct(product)
      } label: {
        VStack(alignment: .center){
          ZStack(alignment: .topTrailing) {
            URLImageView(urlString: product.imageURL)
            
            HeartButton(isLikded: heartsProvider.isHearted(id: product.id),
                        function:{
              heartsProvider.toggle(id: product.id)
              viewModel.addOrRemoveProductFromFavourite(product: product)
            })
            .frame(width: 60, height: 60)
            
          }
          Text(product.title).bold()
          Text("\(product.saleUnitPrice)").bold()
        }.padding(3)
      }
    }.onAppear{
      viewModel.fetchProductList()
    }
  }
  
}

