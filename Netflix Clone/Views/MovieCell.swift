//
//  MovieCell.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 19.07.23.
//

import UIKit
import SnapKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let imageView = UIImageView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setup() {
        contentView.addSubview(imageView)

        imageView.contentMode = .scaleToFill
        clipsToBounds = true
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(200)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
    
    //MARK: - Functions
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        imageView.sd_setImage(with: url, completed: nil)
    }
}
