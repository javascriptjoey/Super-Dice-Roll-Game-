//
//  Extensions.swift
//  Super-Dice-Roll-Game
//
//  Created by Joey Essak on 3/11/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import Foundation
import UIKit

//Delay
extension NSObject {
    
    public func delayForSeconds(delay:Double, completion: @escaping() -> ()){
        let timer = DispatchTime.now() + delay
        
        DispatchQueue.main.asyncAfter(deadline: timer){
            completion()
        }
    }
}

//Segue

extension UIViewController{
    func segueToNextViewController(segueID: String, delay: Double){
        delayForSeconds(delay:delay){
            self.performSegue(withIdentifier: segueID, sender: nil)
        }
    }
}
