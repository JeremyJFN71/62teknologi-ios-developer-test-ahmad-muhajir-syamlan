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
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                self.isLoading = false
                return
            }

            guard let data = data else {
                print("Error: Empty data")
                self.isLoading = false
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

