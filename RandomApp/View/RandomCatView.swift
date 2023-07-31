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
        ZStack {
            BackgroundView()

            VStack {
                Spacer()

                Text(viewModel.catFact?.fact ?? "")
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: UIScreen.main.bounds.width - 50, minHeight: 150)
                    .background(.white)
                    .cornerRadius(20)
                
                Spacer()
                
                ButtonView(text: "Random Cat Fact", image: "dice.fill") {
                    viewModel.fetchCat()
                }.disabled(viewModel.isLoading)
            }
        }
            .navigationTitle("Cat Facts")
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
