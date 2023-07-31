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
        ZStack {
            BackgroundView()
            
            VStack {
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
                    } placeholder: {
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 200, height: 200)
                    }
                    
                    Text(viewModel.user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image("gender")
                                .unredacted()
                            Text(viewModel.user?.gender.capitalized ?? "")
                        }
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
                    .frame(maxWidth: UIScreen.main.bounds.size.width - 50,
                           minHeight: 400,
                           alignment: .top)
                    .background(.brown)
                    .cornerRadius(20)
                
                Spacer()

                ButtonView(text: "Random User", image: "dice.fill") {
                    viewModel.fetchUser()
                }.disabled(viewModel.isLoading)

            }
        }
            .navigationTitle("Users")
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
