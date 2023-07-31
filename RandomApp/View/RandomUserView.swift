//
//  RandomUserView.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import SwiftUI

struct RandomUserView: View {
    @StateObject private var viewModel = RandomUserViewModel()

    var body: some View {
        VStack {
            Picker("Choose Type", selection: $viewModel.selectedGender) {
                ForEach(RandomUserViewModel.gender.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .unredacted()

            VStack(spacing: 15) {
                AsyncImage(url: URL(string: viewModel.user?.picture ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: 200, height: 200)
                }
                
                Text(viewModel.user?.fullName ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)

                VStack {
                    Text(viewModel.user?.gender ?? "")
                    Text(viewModel.user?.email ?? "")
                    Text(viewModel.user?.phone ?? "")
                    Text(viewModel.user?.cell ?? "")
                    Text(viewModel.user?.address ?? "")
                }
            }
                .padding()
                .frame(minWidth: UIScreen.main.bounds.size.width - 50,
                       maxWidth: UIScreen.main.bounds.size.width - 50,
                       minHeight: 400,
                       alignment: .top)
                .background(.gray)
                .cornerRadius(20)
            
            Spacer()

            ButtonView(text: "Random User", image: "dice.fill") {
                viewModel.fetchUser()
            }.disabled(viewModel.isLoading)

        }
            .navigationTitle("User")
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
