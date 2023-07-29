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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PredictAgeView_Previews: PreviewProvider {
    static var previews: some View {
        PredictAgeView()
    }
}
