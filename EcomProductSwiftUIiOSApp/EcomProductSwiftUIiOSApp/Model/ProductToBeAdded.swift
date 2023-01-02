//
//  ProductToFavourite.swift
//  EcomProductSwiftUIiOSApp
//
//  Created by Abhay Singh on 12/27/22.
//

import Foundation

struct ProductToBeAdded {
  let product: Product
  let added: Date
}

extension ProductToBeAdded: Identifiable {
  var id: String { product.id! }
}
