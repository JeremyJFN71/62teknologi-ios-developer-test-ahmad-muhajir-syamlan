//
//  PredictAgeView.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import SwiftUI

struct PredictAgeView: View {
    @StateObject private var viewModel = PredictAgeViewModel()

    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 15) {
                Spacer()
                
                Circle()
                    .frame(width: 280)
                    .foregroundColor(.brown)
                    .overlay {
                        if let age = viewModel.predictedAge?.age {
                            VStack {
                                Text("Your Age:")
                                    .font(.system(size: 30, weight: .semibold, design: .default))
                                    .foregroundColor(.white)
                                Text(String(age))
                                    .font(.system(size: 70, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                            }
                        } else {
                            Text(viewModel.message)
                                .font(.system(size: 40, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                        }
                    }
                
                Spacer()
                
                Form {
                    TextField("Name", text: $viewModel.name)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(.white)
                        .cornerRadius(15)
                }.formStyle(.columns)
                
                ButtonView(text: "Predict", image: "dice.fill") {
                    viewModel.fetchPredictAge()
                }.disabled(viewModel.isLoading)
            }
        }
            .navigationTitle("Predict Age")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct PredictAgeView_Previews: PreviewProvider {
    static var previews: some View {
        PredictAgeView()
    }
}
