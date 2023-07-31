//
//  RandomUserViewModel.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import Foundation

final class RandomUserViewModel: ObservableObject {
    @Published var user: User?
    @Published var selectedGender: gender = .all
    @Published var isLoading = false
    
    enum gender: String, CaseIterable {
        case all = "All"
        case male = "Male"
        case female = "Female"
    }
    
    func fetchUser() {
        isLoading = true
        
        var endpoint = "https://randomuser.me/api"
        
        if selectedGender != .all {
            endpoint = "https://randomuser.me/api?gender=\(selectedGender)"
        }

        guard let url = URL(string: endpoint) else {
            print("Error: Invalid URL")
            self.isLoading = false
            return
        }
        
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
