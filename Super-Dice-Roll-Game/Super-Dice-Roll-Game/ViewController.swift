//
//  ViewController.swift
//  Super-Dice-Roll-Game
//
//  Created by Joey Essak on 3/11/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Fire off myu initial Animations / set up
        logoImageView.alpha = 0
        loadingLabel.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire initial animations
        animateLogo()
        
    }
    
    func animateLogo(){
        UIView.animate(withDuration: 1.5, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }){
            (completed) in
            self.animateLoadingLabel()
            self.segueToNextViewController(segueID: Segues.toMainGameBackgroundVC, delay: 2.0)
        }
    }
    
    
    func animateLoadingLabel(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.loadingLabel.alpha = 1
            self.loadingLabel.frame.origin.y -= 100
            self.loadingLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    
}

