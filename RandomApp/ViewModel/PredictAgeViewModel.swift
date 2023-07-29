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
    @Published var isLoading = false
    
    func fetchPredictedAge(){
        isLoading = true

        guard let url = URL(string: "https://api.agify.io?name=\(name)") else {
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
                let predictedAge = try JSONDecoder().decode(PredictedAge.self, from: data)
                
                DispatchQueue.main.async {
                    self.predictedAge = predictedAge
                    self.isLoading = false
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
