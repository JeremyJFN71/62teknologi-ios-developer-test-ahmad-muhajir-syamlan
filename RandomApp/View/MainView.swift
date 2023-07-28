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
            .padding(.vertical, 15)
            .foregroundColor(.white)
            .frame(width: 140)
            .background(.blue)
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
                NavigationLink(destination: RandomDogView()) {
                    ButtonView(text: "Jokes")
                }
                
                NavigationLink(destination: RandomDogView()) {
                    ButtonView(text: "Users")
                }
            }
            
            HStack {
                NavigationLink(destination: RandomDogView()) {
                    ButtonView(text: "Predict Age")
                }
                
                NavigationLink(destination: RandomDogView()) {
                    ButtonView(text: "Predict Gender")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
