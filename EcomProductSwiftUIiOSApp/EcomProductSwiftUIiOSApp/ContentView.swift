//
//  ContentView.swift
//  EcomProductSwiftUIiOSApp
//
//  Created Abhay Singh  on 12/26/22.
//

import SwiftUI

class ViewModel: ObservableObject {
  @Published var ecomProduct: EcomProduct = EcomProduct(products: [])
  func fetch() {
    guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328")
    else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      //convert to JSON
      do {
        let ecomProduct = try JSONDecoder().decode(EcomProduct.self, from: data)
        DispatchQueue.main.async {
          self?.ecomProduct = ecomProduct
        }
      }
      catch {
        print(error)
      }
      
    }
    task.resume()
    
  }
  
  
}
struct URLImage: View {
  let urlString: String
  @State var data: Data?

  var body: some View {
    
    if let data = data, let uiimage = UIImage(data: data) {
      
      Image(uiImage: uiimage)
        .resizable()
        .aspectRatio(contentMode: .fill)
//        .frame(width: 130, height: 200)
        .background(Color.gray)
      
    } else {
      Image(systemName: "Profile")
        .resizable()
        .aspectRatio(contentMode: .fill)
//        .frame(width: 130, height: 70)
        .background(Color.gray)
        .onAppear{
          APIManager.shared.downloadContent(fromUrlString: urlString, completionHandler: { (result) in
            switch result {
              case .success(let imageData):
                  // handle data
                data = imageData
                break
              case .failure(let error):
                debugPrint(error.localizedDescription)
            }
          })
        }
    }
  }
}



struct ContentView: View {
//  @StateObject var vm = ViewModel()
//  @State private var isLiked = false

  var body: some View {
    VStack{
      Image(systemName: "heart")
        .resizable()
        .aspectRatio(contentMode: .fit)
      Text("Product Name")
      Text("Product Name")

    }
  }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
