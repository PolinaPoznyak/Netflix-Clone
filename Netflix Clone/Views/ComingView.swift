//
//  ComingView.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 19.07.23.
//

import UIKit
import SnapKit

class ComingView: UIView {
    
    //MARK: - Properties
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!

    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    //MARK: - Setup
    
    private func setupSubviews() {
        backgroundColor = .black
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        }
        collectionView.backgroundColor = .systemBackground
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 140, height: 200)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30)
        layout.scrollDirection = .vertical
        return layout
    }
}
