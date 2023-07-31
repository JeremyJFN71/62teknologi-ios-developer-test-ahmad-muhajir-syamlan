//
//  NavigationBarView.swift
//  RandomApp
//
//  Created by Tokio Marine on 31/07/23.
//

import SwiftUI

struct NavigationBarView: View {
    @Environment(\.dismiss) var dismiss
    var title: String

    var body: some View {
        ZStack {
            Button {
                dismiss()
            } label: {
                Label("Back", systemImage: "arrowshape.turn.up.left.fill")
                    .foregroundColor(.black)
                    .bold()
                    .padding()
            }.frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)

            Text(title.capitalized)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .center)
        }
        .unredacted()
        
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Preview")
    }
}
