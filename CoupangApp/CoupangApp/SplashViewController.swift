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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lottieAnimatiionView.play()
    }
    
}
