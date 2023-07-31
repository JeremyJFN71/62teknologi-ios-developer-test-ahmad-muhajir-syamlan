//
//  RandomCatView.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import SwiftUI

struct RandomCatView: View {
    @StateObject private var viewModel = RandomCatViewModel()

    var body: some View {
        VStack {
            Spacer()

            Text(viewModel.catFact?.fact ?? "")
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ButtonView(text: "Random Cat Fact", image: "dice.fill") {
                viewModel.fetchCat()
            }.disabled(viewModel.isLoading)
        }
            .navigationTitle("Cat Fact")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct RandomCatView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatView()
    }
}
