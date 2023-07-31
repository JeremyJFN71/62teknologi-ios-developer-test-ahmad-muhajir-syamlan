//
//  ButtonView.swift
//  RandomApp
//
//  Created by Tokio Marine on 30/07/23.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var image: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Label(text, systemImage: image)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .frame(width: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(15)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Random", image: "dice.fill") {
            
        }
    }
}
