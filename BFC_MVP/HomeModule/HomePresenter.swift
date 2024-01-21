//
//  HomePresenter.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 20.01.2024.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeViewProtocol, networkService: NetworkServiceProtocol)
    func getData()
    var products: [BabyFoodCareModel]? { get set }
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    let networkService: NetworkServiceProtocol!
    var products: [BabyFoodCareModel]?
    
    required init(view: HomeViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getData()
    }
    
    func getData() {
        networkService.getProducts { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}

