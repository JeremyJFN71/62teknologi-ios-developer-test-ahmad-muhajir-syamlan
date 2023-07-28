//
//  RandomDogViewModel.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import Foundation

final class RandomDogViewModel: ObservableObject {
    @Published var dogImage: DogImage?
    @Published var isLoading = false
    
    func fetchDog() {
        isLoading = true
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            print("Error: Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {
                print("Error: Empty data")
                return
            }
            
            do {
                let dogImage = try JSONDecoder().decode(DogImage.self, from: data)
                
                DispatchQueue.main.async {
                    self.dogImage = dogImage
                    self.isLoading = false
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}

