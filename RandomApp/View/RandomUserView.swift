//
//  RandomUserView.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import SwiftUI

struct RandomUserView: View {
    @StateObject var viewModel = RandomUserViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
