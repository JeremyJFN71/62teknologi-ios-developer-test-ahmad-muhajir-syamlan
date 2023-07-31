//
//  PredictAgeViewModel.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import Foundation

final class PredictAgeViewModel: ObservableObject {
    @Published var predictedAge: PredictedAge?
    @Published var name = ""
    @Published var message = "Input Name"
    @Published var isLoading = false
    
    func fetchPredictAge(){
        isLoading = true
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.agify.io"
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
                let predictedAge = try JSONDecoder().decode(PredictedAge.self, from: data)
                
                DispatchQueue.main.async {
                    self.predictedAge = predictedAge
                    if predictedAge.count == 0 {
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
