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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PredictGenderView_Previews: PreviewProvider {
    static var previews: some View {
        PredictGenderView()
    }
}
