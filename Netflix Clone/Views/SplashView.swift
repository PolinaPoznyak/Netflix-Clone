//
//  SplashView.swift
//  Netflix Clone
//
//  Created by Polina Poznyak on 27.06.23.
//

import SnapKit
import UIKit
import Lottie

class SplashView : UIView {
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    //it is needed if we want to initialize the view not from the code, but from the storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 410
        static let logoHeight: CGFloat = 410
    }
    
    // MARK: - Private image properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "netflix-logo")
        view.contentMode = .scaleAspectFit
        return view
    } ()
    
    // MARK: - Lottie
    private let animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.animation = Animation.named("netflix-logo-swoop")
        animationView.loopMode = .playOnce
        animationView.play()
        return animationView
    } ()
}

// MARK: Private methods
private extension SplashView {
    func initialize() {
        addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHeight)
        }
    }
}
