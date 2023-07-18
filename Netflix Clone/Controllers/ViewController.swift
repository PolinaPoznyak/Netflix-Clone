//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 26.06.23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private let splashView = SplashView()
    private let splashViewModel: SplashViewModel
    
    
    //MARK: - Init
    
    init(viewModel: SplashViewModel) {
        self.splashViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.splashViewModel.view = self
        view.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
   
// MARK: - Private method

private extension ViewController {
    func initialize() {
        view.backgroundColor = .black
        view.addSubview(splashView)
        
        splashView.snp.makeConstraints {
            make in make.edges.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            self?.splashViewModel.goToLoginPage()
        }
    }
}
