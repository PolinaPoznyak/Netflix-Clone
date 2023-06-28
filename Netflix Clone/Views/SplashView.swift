//
//  SplashView.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 27.06.23.
//

import SnapKit
import UIKit

class SplashView : UIView {
    // MARK: - Ini
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    //нужен, если хотим инициализировать view не из кода, а из сториборда
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 250
        static let logoHeight: CGFloat = 250
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "netflix-logo")
        view.contentMode = .scaleAspectFit
        return view
    } ()
}

// MARK: Private methods
private extension SplashView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHeight)
        }
    }
}
