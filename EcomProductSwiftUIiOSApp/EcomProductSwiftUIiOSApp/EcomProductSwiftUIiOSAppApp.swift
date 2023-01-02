//
//  EcomProductSwiftUIiOSAppApp.swift
//  EcomProductSwiftUIiOSApp
//
//  Created by Abhay Singh on 12/26/22.
//

import SwiftUI

@main
struct EcomProductSwiftUIiOSAppApp: App {
  
  private let viewModelFactory = ViewModelFactory()
  
  var body: some Scene {
    WindowGroup {
      TabView {
        
        NavigationView {
          ProductListView(viewModel: viewModelFactory.makeProductListViewModel()) // dependecy injection
            .navigationTitle("Products")
        }
        .tabItem { Text("All Product") }
        
        NavigationView {
          FavouriteListView(viewModel: viewModelFactory.makeToFavouriteListViewModel()) // dependecy injection
            .navigationTitle("Favourite")
        }
        .tabItem { Text("Favourite") }
        
      }
      .environmentObject(HeartsProvider()) // dependency injection using EnvironmentObject
    }
    
  }
}
