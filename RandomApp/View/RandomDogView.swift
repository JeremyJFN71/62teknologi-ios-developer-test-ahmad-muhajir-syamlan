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
        VStack(spacing: 40) {
            Spacer()

            AsyncImage(url: URL(string: viewModel.dogImage?.message ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
                    .frame(width: 300, height: 300)
            }
            
            Spacer()
            
            Button {
                viewModel.fetchDog()
            } label: {
                Text("Random Dog")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(width: 250)
                    .background(.red)
                    .cornerRadius(10)
            }.disabled(viewModel.isLoading)
        }
            .navigationTitle("Dog Image")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDogView()
    }
}
