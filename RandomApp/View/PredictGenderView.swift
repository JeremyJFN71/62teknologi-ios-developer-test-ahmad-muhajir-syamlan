//
//  PredictGenderView.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import SwiftUI

struct PredictGenderView: View {
    @StateObject private var viewModel = PredictGenderViewModel()

    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 15) {
                Spacer()
                
                Circle()
                    .frame(width: 280)
                    .foregroundColor(.brown)
                    .overlay {
                        if let gender = viewModel.predictedGender?.gender {
                            VStack {
                                Text("\(viewModel.probability)% you are")
                                    .font(.system(size: 30, weight: .semibold, design: .default))
                                    .foregroundColor(.white)
                                Text(gender.capitalized)
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
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(.white)
                        .cornerRadius(15)
                }.formStyle(.columns)
                
                ButtonView(text: "Predict Gender", image: "dice.fill") {
                    viewModel.fetchPredictGender()
                }.disabled(viewModel.isLoading)
            }
        }
            .navigationTitle("Predict Gender")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct PredictGenderView_Previews: PreviewProvider {
    static var previews: some View {
        PredictGenderView()
    }
}
