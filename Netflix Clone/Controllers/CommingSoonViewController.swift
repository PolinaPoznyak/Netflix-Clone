//
//  CommingSoonViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import UIKit

class CommingSoonViewController: UIViewController {

    //MARK: - Properties
    
    private let commingSoonViewModel: CommingSoonViewModel
    
    
    //MARK: - Init
    
    init(viewModel: CommingSoonViewModel) {
        self.commingSoonViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.commingSoonViewModel.view = self
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
