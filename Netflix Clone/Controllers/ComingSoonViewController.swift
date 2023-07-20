//
//  ComingSoonViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import UIKit

class ComingSoonViewController: UIViewController {

    //MARK: - Properties
    
    private let comingSoonViewModel: ComingSoonViewModel
    var comingView: ComingView!

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        comingSoonViewModel.fetchComingSoon()
    }
    
    //MARK: - Init
    
    init(viewModel: ComingSoonViewModel) {
        self.comingSoonViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.comingSoonViewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        view.backgroundColor = .black
        comingView = ComingView()
        view.addSubview(comingView)
        comingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        comingView.collectionView.dataSource = self
        comingView.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "\(MovieCell.self)")
    }
}

//MARK: - Extensions

extension ComingSoonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comingSoonViewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieCell.self)", for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: comingSoonViewModel.movies[indexPath.item].posterPath)
        return cell
    }
}
