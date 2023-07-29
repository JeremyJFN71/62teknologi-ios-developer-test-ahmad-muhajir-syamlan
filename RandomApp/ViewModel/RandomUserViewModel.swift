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
        let url = URL(string: "https://randomuser.me/api")!
        
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
                let user = try JSONDecoder().decode(Welcome.self, from: data)
                
                DispatchQueue.main.async {
                    print(user)
                    let result = user.results[0]
                    self.user = User(picture: result.picture.large,
                                     fullName: "\(result.name.title). \(result.name.first) \(result.name.last)",
                                     gender: result.gender,
                                     email: result.email,
                                     phone: result.phone,
                                     cell: result.cell)

                    switch result.location.postcode {
                    case .string(let stringValue):
                        self.user?.address = "\(result.location.street.number) \(result.location.street.name), \(result.location.city), \(result.location.state), \(result.location.country), \(stringValue)"
                    case .int(let intValue):
                        self.user?.address = "\(result.location.street.number) \(result.location.street.name), \(result.location.city), \(result.location.state), \(result.location.country), \(intValue)"
                    }

                    self.isLoading = false
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
