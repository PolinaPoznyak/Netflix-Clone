//
//  SplashViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 27.06.23.
//

import SnapKit
import UIKit

class SplashViewController: UIViewController {
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private method
private extension SplashViewController {
    func initialize() {
        view.backgroundColor = .black
        
        let splashView = SplashView()
        view.addSubview(splashView)
        
        splashView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
    }
}
