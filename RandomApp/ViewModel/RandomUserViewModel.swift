//
//  RandomUserViewModel.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import Foundation

final class RandomUserViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading = false
    
    func fetchUser() {
        isLoading = true
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
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
                let user = try JSONDecoder().decode(User.self, from: data)
                
                DispatchQueue.main.async {
                    self.user = user
                    self.isLoading = false
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
