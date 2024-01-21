//
//  HomeViewController.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 20.01.2024.
//

import UIKit

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol!

    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showGreetingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Greeting", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupGreetingLabel()
        setupShowGreetingButton()
    }
    
    private func setupGreetingLabel() {
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate(
            [
                greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
    }
    
    private func setupShowGreetingButton() {
        view.addSubview(showGreetingButton)
        NSLayoutConstraint.activate(
            [
                showGreetingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                showGreetingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ]
        )
        showGreetingButton.addTarget(self, action: #selector(showGreetingButtonTapped), for: .touchUpInside)
    }
    
    @objc private func showGreetingButtonTapped() {
        presenter.showGreeting()
    }
}

extension HomeViewController: HomeViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}
