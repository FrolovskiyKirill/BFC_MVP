//
//  HomePresenter.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 20.01.2024.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeViewProtocol, model: BabyFoodCareModel)
    func showGreeting()

}

class HomePresenter: HomePresenterProtocol {
    let view: HomeViewProtocol
    let model: BabyFoodCareModel
    
    required init(view: HomeViewProtocol, model: BabyFoodCareModel) {
        self.view = view
        self.model = model
    }
    
    func showGreeting() {
        let greeting = self.model.title + " Hello"
        self.view.setGreeting(greeting: greeting)
    }
}

