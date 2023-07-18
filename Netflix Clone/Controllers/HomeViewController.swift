//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 10.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    private let homeView = HomeView()
    private let homeViewModel: HomeViewModel
    
    //MARK: - Init
    
    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.homeViewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
    }
}
