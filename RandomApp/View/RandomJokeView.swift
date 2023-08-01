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
        VStack {
            NavigationBarView(title: "Jokes")

            HStack {
                Text("Choose Joke Type")
                    .font(.title)
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
            }
        
            Spacer()

            if viewModel.joke != nil {
                Text(viewModel.joke?.setup ?? "")
                    .padding()
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                if viewModel.tapped {
                    Text(viewModel.joke?.punchline ?? "")
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .multilineTextAlignment(.center)
                } else {
                    Button {
                        viewModel.tapped = true
                    } label: {
                        Text("-> Tap <-")
                            .padding()
                    }
                }
            }
            
            Spacer()
            
            ButtonView(text: "Random Joke", image: "dice.fill") {
                viewModel.fetchJoke()
            }.disabled(viewModel.isLoading)
        }
        .toolbar(.hidden)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .onAppear {
            viewModel.fetchJoke()
        }
    }
}

struct RandomJokeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomJokeView()
    }
}
