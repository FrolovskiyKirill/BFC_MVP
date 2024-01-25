//
//  HomeAssambly.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 21.01.2024.
//

import UIKit

class HomeAssambly {
    static func makeModule() -> UIViewController {
        let view = HomeViewController()
        let authorityClient = AuthorityClient()
        let networkService = NetworkService()
        let presenter = HomePresenter(view: view, networkService: networkService, authorityClient: authorityClient)
        view.presenter = presenter
        return view
    }
}
