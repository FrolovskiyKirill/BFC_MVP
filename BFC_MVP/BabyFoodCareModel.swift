//
//  BabyFoodCareModel.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 20.01.2024.
//

import Foundation

struct BabyFoodCareModel: Decodable {
    
    let id: Int
    let title: String
    let foodType: String
    let description: String
    let imageURL: String
    let foodTypeImageURL: String
    let monthFrom: Int
    let allergen: Bool
    let allergenDescription: String?
    let withWarning: Bool
    let warningNote: String?
    let howToServe: String?
    let howToServeImageURL: [String]?
    let calories: Int
    let protein: Int
    let fats: Int
    let carbs: Int
}
