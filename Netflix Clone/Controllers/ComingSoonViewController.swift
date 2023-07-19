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
    
    
    //MARK: - Init
    
    init(viewModel: ComingSoonViewModel) {
        self.comingSoonViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.comingSoonViewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
}
