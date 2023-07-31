//
//  SwiftUIView.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import SwiftUI

struct RandomDogView: View {
    @StateObject private var viewModel = RandomDogViewModel()

    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 40) {
                Spacer()

                AsyncImage(url: URL(string: viewModel.dogImage?.message ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .cornerRadius(20)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.secondary)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 250)
                        .cornerRadius(20)
                }
                
                Spacer()
                
                ButtonView(text: "Random Dog Image", image: "dice.fill") {
                    viewModel.fetchDog()
                }.disabled(viewModel.isLoading)
            }
        }
            .navigationTitle("Dog Images")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .onAppear {
                viewModel.fetchDog()
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDogView()
    }
}
