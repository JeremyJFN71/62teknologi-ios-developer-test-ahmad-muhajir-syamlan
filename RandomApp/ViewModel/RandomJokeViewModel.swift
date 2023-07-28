//
//  RandomJokeViewModel.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import Foundation

final class RandomJokeViewModel: ObservableObject {
    @Published var joke: Joke?
    @Published var punchline: String?
    @Published var selectedType: JokesType = .all
    @Published var isLoading = false

    enum JokesType: String, CaseIterable {
        case all = "All"
        case general = "General"
        case programming = "Programming"
    }
    
    func fetchJoke() {
        isLoading = true
        punchline = nil
        var endpoint = "https://official-joke-api.appspot.com/jokes/random"

        if selectedType != .all {
            endpoint = "https://official-joke-api.appspot.com/jokes/\(selectedType)/random"
        }
        
        guard let url = URL(string: endpoint) else {
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
                var joke: Joke
                if self.selectedType != .all {
                    joke = try JSONDecoder().decode([Joke].self, from: data)[0]
                } else {
                    joke = try JSONDecoder().decode(Joke.self, from: data)
                }
                
                DispatchQueue.main.async {
                    self.joke = joke
                    self.isLoading = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.punchline = joke.punchline
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}
