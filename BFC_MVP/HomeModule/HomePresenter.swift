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
    init(view: HomeViewProtocol, networkService: NetworkServiceProtocol, authorityClient: AuthorityClient)
    func getData()
    func getData2()
    var products: [BabyFoodCareModel]? { get set }
    var authority: [Authority]? { get set }
}

class HomePresenter: HomePresenterProtocol {
    required init(view: HomeViewProtocol, networkService: NetworkServiceProtocol, authorityClient: AuthorityClient) {
        self.view = view
        self.networkService = networkService
        self.authorityClient = authorityClient
        getData()
        getData2()
    }
    
    weak var view: HomeViewProtocol?
    let networkService: NetworkServiceProtocol!
    let authorityClient: AuthorityProtocol!
    var products: [BabyFoodCareModel]?
    var authority: [Authority]?
    
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
    
    func getData2() {
        Task.init {
            do {
                self.authority = try await authorityClient.getAuthorities()
            } catch {
                print("Fetching establishments failed with error \(error)")
            }
        }
    }
    
//    func getData() async {
//        Task.init {
//            do {
//                self.products = try await networkService.getProducts2()
//                DispatchQueue.main.async { [weak self] in
//                    self?.view?.success()
//                }
//            } catch {
//                DispatchQueue.main.async { [weak self] in
//                    self?.view?.failure(error: error)
//                }
//            }
//        }
//    }

}

