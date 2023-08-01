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
        VStack(spacing: 15) {
            NavigationBarView(title: "Predict Gender")
            
            Spacer()
            
            if let gender = viewModel.predictedGender?.gender {
                VStack {
                    Text("\(viewModel.probability)% you are")
                        .font(.system(size: 30, weight: .semibold, design: .default))
                    Text(gender.capitalized)
                        .font(.system(size: 70, weight: .bold, design: .default))
                }
            } else {
                Text(viewModel.message)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            Spacer()

            Form {
                HStack {
                    TextField("Name", text: $viewModel.name)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .fontWeight(.bold)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .cornerRadius(15)
                        .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.primary, lineWidth: 4)
                        )

                    Button {
                        viewModel.fetchPredictGender()
                    } label: {
                        Image(systemName: "dice.fill")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(14)
                            .background(.brown)
                            .cornerRadius(15)
                    }.disabled(viewModel.isLoading)
                }.padding()
            }.formStyle(.columns)
        }
        .toolbar(.hidden)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct PredictGenderView_Previews: PreviewProvider {
    static var previews: some View {
        PredictGenderView()
    }
}
