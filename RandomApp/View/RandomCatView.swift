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
            NavigationBarView(title: "Cat Facts")

            Spacer()

            Text(viewModel.catFact?.fact ?? "")
                .padding()
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ButtonView(text: "Random Cat Fact", image: "dice.fill") {
                viewModel.fetchCat()
            }.disabled(viewModel.isLoading)
        }
        .toolbar(.hidden)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .onAppear {
            viewModel.fetchCat()
        }
    }
}

struct RandomCatView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatView()
    }
}
