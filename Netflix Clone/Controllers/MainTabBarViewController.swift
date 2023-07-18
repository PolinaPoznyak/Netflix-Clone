//
//  MainTabBarViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 18.07.23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    //MARK: - Properties
    
    private let mainTabBarViewModel: MainTabBarViewModel
    
    //MARK: - Init
    
    init(viewModel: MainTabBarViewModel) {
        self.mainTabBarViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.mainTabBarViewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiClient = APIClient()
        let homeViewModel = HomeViewModel(apiClient: apiClient)
        let commingSoonViewModel = CommingSoonViewModel(apiClient: apiClient)
        let favoriteViewModel = FavoriteViewModel(apiClient: apiClient)
        
        let vc1 = UINavigationController(rootViewController: HomeViewController(viewModel: homeViewModel))
        let vc2 = UINavigationController(rootViewController: CommingSoonViewController(viewModel: commingSoonViewModel))
        let vc3 = UINavigationController(rootViewController: FavoriteViewController(viewModel: favoriteViewModel))
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "heart")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Favorites"
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}
