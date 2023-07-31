//
//  PredictedGender.swift
//  RandomApp
//
//  Created by Tokio Marine on 29/07/23.
//

import Foundation

struct PredictedGender: Codable {
    let count: Int
    let name: String
    let gender: String?
    let probability: Float
}
