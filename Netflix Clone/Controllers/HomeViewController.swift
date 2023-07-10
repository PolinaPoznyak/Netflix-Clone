//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 10.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
    }
}
