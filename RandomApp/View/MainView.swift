//
//  ContentView.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()

                    Image("random_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180)

                    Text("Random Game")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    OptionView()
                    
                    Spacer()
                }
            }
        }
    }
}

struct ButtonView: View {
    var text: String

    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding(.vertical, 15)
            .foregroundColor(.white)
            .frame(width: 140)
            .background(.brown)
            .cornerRadius(30)
    }
}

struct OptionView: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: RandomCatView()) {
                    ButtonView(text: "Cat Facts")
                }
                
                NavigationLink(destination: RandomDogView()) {
                    ButtonView(text: "Dog Images")
                }
            }
            
            HStack {
                NavigationLink(destination: RandomJokeView()) {
                    ButtonView(text: "Jokes")
                }
                
                NavigationLink(destination: RandomUserView()) {
                    ButtonView(text: "Users")
                }
            }
            
            HStack {
                NavigationLink(destination: PredictAgeView()) {
                    ButtonView(text: "Predict Age")
                }
                
                NavigationLink(destination: PredictGenderView()) {
                    ButtonView(text: "Predict Gender")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
