//
//  HeartButton.swift
//  EcomProductSwiftUIiOSApp
//
//  Created Abhay Singh  on 12/27/22.
//

import SwiftUI

class HeartsProvider: ObservableObject {
  @Published var hearts: [String] = []
  
  func isHearted(id: String) -> Bool {
    return hearts.contains(id)
  }
  
  func toggle(id: String) {
    if isHearted(id: id) {
      hearts = hearts.filter { $0 != id }
    } else {
      hearts.append(id)
    }
  }
}

struct HeartButton: View {
  @State var isLikded: Bool
  var function:() -> Void
  var body: some View {
    Button(action: {
      self.function()
      isLikded.toggle()
    }, label: {
      Image(systemName: isLikded ? "heart.fill" : "heart")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100)
        .foregroundColor(isLikded ? .red : .black)
    })
    
  }
}

struct HeartButton_Previews: PreviewProvider {

    static var previews: some View {
      HeartButton(isLikded: true, function: {})
    }
}
