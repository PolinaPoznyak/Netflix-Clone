//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 10.07.23.
//

import UIKit

enum Section: Int {
    case PopularMovies = 0
    case TrendingMovies = 1
    case TrendingCartoons = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    private let homeFeedView = HomeView()
    private let homeViewModel: HomeViewModel
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.backgroundColor = .black
        return table
    } ()
    
    let sectionTitles: [String] = [ "Popular Movies", "Trending Movies", "Trending Cartoons", "Upcoming Movies", "Top Rated"]
    
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

        view.backgroundColor = .black
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = HomeHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    //MARK: - Nav Bar
    
    private func configureNavbar() {
        var image = UIImage(named: "netflix-logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    //MARK: - Functions
    
    func getTrendingMovies() {
        homeViewModel.fetchTrendingMovies()
    }
}

//MARK: - Extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            return UITableViewCell()
        }

        switch indexPath.section {
        case Section.PopularMovies.rawValue:
            homeViewModel.apiClient.getPopularMovies() { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(_):
                    print("Failed to get popular movies")
                }
            }
        case Section.TrendingMovies.rawValue:
            homeViewModel.apiClient.getTrendingMovies() { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(_):
                    print("Failed to get popular movies")
                }
            }
        case Section.TrendingCartoons.rawValue:
            homeViewModel.apiClient.getTrendingСartoons() { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(_):
                    print("Failed to get popular movies")
                }
            }
        case Section.Upcoming.rawValue:
            homeViewModel.apiClient.getUpcomingMovies() { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(_):
                    print("Failed to get popular movies")
                }
            }
        case Section.TopRated.rawValue:
            homeViewModel.apiClient.getRatedMovies() { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(_):
                    print("Failed to get popular movies")
                }
            }
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        //header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

