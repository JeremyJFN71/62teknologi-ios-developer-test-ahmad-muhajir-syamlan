//
//  PredictGenderViewModel.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import Foundation

final class PredictGenderViewModel: ObservableObject {
    @Published var predictedGender: PredictedGender?
    @Published var name = ""
    @Published var probability: Int = 0
    @Published var message = "Input Name"
    
    @Published var isLoading = false
    
    func fetchPredictGender(){
        isLoading = true
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.genderize.io"
        components.queryItems = [
            URLQueryItem(name: "name", value: name)
        ]
        
        let task = URLSession.shared.dataTask(with: components.url!) { data, _, error in
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
                let predictedGender = try JSONDecoder().decode(PredictedGender.self, from: data)
                
                DispatchQueue.main.async {
                    self.predictedGender = predictedGender
                    self.probability = Int(predictedGender.probability * 100)
                    if predictedGender.count == 0 {
                        self.message = "Cant Predict"
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
