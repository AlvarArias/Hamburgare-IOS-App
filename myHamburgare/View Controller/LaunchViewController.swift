//
//  LaunchViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-13.
//

import UIKit
import Lottie


class LaunchViewController: UIViewController {

   @IBOutlet weak var animationView: AnimationView!
    
    @IBOutlet weak var startButton: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Lottie.animation
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.6
        animationView!.play()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

/*
extension UIView {
  func fadeTo(_ alpha: CGFloat, duration: TimeInterval = 0.3) {
    DispatchQueue.main.async {
      UIView.animate(withDuration: duration) {
        self.alpha = alpha
      }
    }
  }

  func fadeIn(_ duration: TimeInterval = 0.3) {
    fadeTo(1.0, duration: duration)
  }

  func fadeOut(_ duration: TimeInterval = 0.3) {
    fadeTo(0.0, duration: duration)
  }
}
*/
