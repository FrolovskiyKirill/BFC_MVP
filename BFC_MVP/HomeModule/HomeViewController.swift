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
        NSLayoutConstraint.activate([
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupShowGreetingButton() {
        view.addSubview(showGreetingButton)
        NSLayoutConstraint.activate([
            showGreetingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showGreetingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
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

//class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = .clear
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .lightGray
//        setupCollectionView()
//    }
//    
//    private func setupCollectionView() {
//        view.addSubview(collectionView)
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
//        ])
//    }
//    
//    // MARK: - UICollectionViewDataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 20
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
//            fatalError("Unable to dequeue CustomCollectionViewCell")
//        }
//        cell.configure(with: "Title \(indexPath.row)")
//        return cell
//    }
//    
//    // MARK: - UICollectionViewDelegateFlowLayout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding: CGFloat = 10
//        let collectionViewSize = collectionView.frame.size.width - padding
//        
//        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
//    }
//}
//
//
//class CustomCollectionViewCell: UICollectionViewCell {
//    static let identifier = "CustomCollectionViewCell"
//    
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(titleLabel)
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(with title: String) {
//        titleLabel.text = title
//    }
//}
