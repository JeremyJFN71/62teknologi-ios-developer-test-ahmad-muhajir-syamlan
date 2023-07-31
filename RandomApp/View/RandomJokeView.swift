//
//  RandomJokeView.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import SwiftUI

struct RandomJokeView: View {
    @StateObject private var viewModel = RandomJokeViewModel()

    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    Text("Choose Joke Type")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }.unredacted()
                
                Picker("Choose Type", selection: $viewModel.selectedType) {
                    ForEach(RandomJokeViewModel.JokesType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .padding(.top, -15)
                .unredacted()
                .onChange(of: viewModel.selectedType) { _ in
                    viewModel.joke = nil
                    viewModel.punchline = nil
                }
            
                Spacer()

                Text(viewModel.joke?.setup ?? "")
                    .padding()
                    .multilineTextAlignment(.center)
                Text(viewModel.punchline ?? "")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                ButtonView(text: "Random Joke", image: "dice.fill") {
                    viewModel.fetchJoke()
                }.disabled(viewModel.isLoading)
            }
        }
            .navigationTitle("Jokes")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
