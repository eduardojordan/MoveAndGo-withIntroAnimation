//
//  AnimationViewController.swift
//  MoveAndGo
//
//  Created by MAC on 24/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimation()
    }
    
    func startAnimation (){
        
        let path = Bundle.main.path(forResource: "PointJump", ofType: "json") ?? ""
        animationView.animation = Animation.filepath(path)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play(completion: { finished in
            
            self.performSegue(withIdentifier: "NextSceneSegue", sender: self)
        }
        )
        
    }
    
}
