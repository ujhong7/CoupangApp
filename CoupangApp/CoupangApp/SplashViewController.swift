//
//  SplashViewController.swift
//  CoupangApp
//
//  Created by yujaehong on 9/19/24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    @IBOutlet weak var lottieAnimatiionView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        
        lottieAnimatiionView.play {  _ in
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
                window.rootViewController = viewController
            }
        }
    }
    
}
