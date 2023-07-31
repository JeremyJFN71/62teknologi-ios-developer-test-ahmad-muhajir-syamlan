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
            NavigationBarView(title: "Fake Users")
            
            Picker("Choose Type", selection: $viewModel.selectedGender) {
                ForEach(RandomUserViewModel.gender.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .unredacted()

            VStack(spacing: 15) {
                AsyncImage(url: URL(string: viewModel.user?.picture ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(
                                Circle()
                                    .stroke(.black, lineWidth: 4)
                        )
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: 200, height: 200)
                        .overlay(
                                Circle()
                                    .stroke(.black, lineWidth: 4)
                        )
                }
                
                VStack {
                    Text(viewModel.user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    Text(viewModel.user?.gender.capitalized ?? "")
                }

                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .unredacted()
                        Text(viewModel.user?.email ?? "")
                    }
                    HStack {
                        Image(systemName: "iphone.gen1")
                            .unredacted()
                        Text(viewModel.user?.phone ?? "")
                    }
                    HStack {
                        Image(systemName: "phone.fill")
                            .unredacted()
                        Text(viewModel.user?.cell ?? "")
                    }
                    HStack {
                        Image(systemName: "location.fill")
                            .unredacted()
                        Text(viewModel.user?.address ?? "")
                    }
                }
            }
                .padding()
                .frame(maxWidth: 320, minHeight: 400, alignment: .top)
                .cornerRadius(20)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 4)
                )

            Spacer()

            ButtonView(text: "Random Fake User", image: "dice.fill") {
                viewModel.fetchUser()
            }.disabled(viewModel.isLoading)

        }
        .toolbar(.hidden)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
