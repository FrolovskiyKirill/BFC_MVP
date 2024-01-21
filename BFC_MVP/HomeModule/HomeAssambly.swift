//
//  HomeAssambly.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 21.01.2024.
//

import UIKit

class HomeAssambly {
    static func makeModule() -> UIViewController {
        let model = BabyFoodCareModel(id: 1, title: "Pepper", description: "Food", foodType: "Vegi", imageURL: "123", calories: 190, protein: 40, carbs: 12)
        let view = HomeViewController()
        let presenter = HomePresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}
