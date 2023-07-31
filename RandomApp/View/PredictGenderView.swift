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
        VStack {
            if let gender = viewModel.predictedGender?.gender {
                Text("\(viewModel.probability)% you are")
                Text(gender.capitalized)
                    .font(.title)
                    .fontWeight(.bold)
            } else {
                Text(viewModel.message)
            }

            Form {
                TextField("Name", text: $viewModel.name)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                ButtonView(text: "Predict Gender", image: "dice.fill") {
                    viewModel.fetchPredictGender()
                }.disabled(viewModel.isLoading)
            }
        }.navigationTitle("Predict Gender")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct PredictGenderView_Previews: PreviewProvider {
    static var previews: some View {
        PredictGenderView()
    }
}
