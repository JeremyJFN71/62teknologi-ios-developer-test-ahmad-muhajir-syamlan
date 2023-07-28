//
//  Joke.swift
//  RandomApp
//
//  Created by Tokio Marine on 28/07/23.
//

import Foundation

struct Joke: Codable, Hashable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}
