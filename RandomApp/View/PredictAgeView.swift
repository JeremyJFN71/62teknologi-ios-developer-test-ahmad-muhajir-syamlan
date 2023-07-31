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
        VStack {
            if let age = viewModel.predictedAge?.age {
                Text("Your Age:")
                Text("\(age)")
            } else {
                Text(viewModel.message)
            }
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                ButtonView(text: "Predict", image: "dice.fill") {
                    viewModel.fetchPredictAge()
                }.disabled(viewModel.isLoading)
            }
        }.navigationTitle("Predict Age")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct PredictAgeView_Previews: PreviewProvider {
    static var previews: some View {
        PredictAgeView()
    }
}
