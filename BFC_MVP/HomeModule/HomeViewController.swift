//
//  HomeViewController.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 20.01.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    private var greeting: String?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 50)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GreetingCollectionViewCell.self, forCellWithReuseIdentifier: GreetingCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.products?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GreetingCollectionViewCell.identifier, for: indexPath) as? GreetingCollectionViewCell else {
            fatalError("Unable to dequeue GreetingCollectionViewCell")
        }
        let productTitle = presenter.products?[indexPath.row]
        cell.greetingLabel.text = productTitle?.description
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate { }

// MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func success() {
        collectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

class GreetingCollectionViewCell: UICollectionViewCell {
    static let identifier = "GreetingCollectionViewCell"

    let greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
            greetingLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
