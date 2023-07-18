//
//  FavoriteViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import UIKit
import SwiftUI
import SnapKit

class FavoriteViewController: UIViewController {
    
    //MARK: - Properties
    
    let contentView = UIHostingController(rootView: FavoriteSwiftUIView())
    private let favoriteViewModel: FavoriteViewModel
    
    
    //MARK: - Init
    
    init(viewModel: FavoriteViewModel) {
        self.favoriteViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.favoriteViewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(contentView)
        view.addSubview(contentView.view)
        
        contentView.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
