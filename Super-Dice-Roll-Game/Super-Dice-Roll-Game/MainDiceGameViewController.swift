//
//  MainDiceGameViewController.swift
//  Super-Dice-Roll-Game
//
//  Created by Joey Essak on 3/11/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class MainDiceGameViewController: UIViewController {
    var offset: CGFloat {
        return d1.frame.width/2
    }
    
    var sound = AVAudioPlayer()
    
    let myDice = [#imageLiteral(resourceName: "dice-one"),#imageLiteral(resourceName: "dice-two"),#imageLiteral(resourceName: "dice-three"),#imageLiteral(resourceName: "dice-four"),#imageLiteral(resourceName: "dice-five"),#imageLiteral(resourceName: "dice-six")]
    
        //These are both my UIImageViews's that I currently have displayed on the screen
    @IBOutlet weak var d1: UIImageView!
    @IBOutlet weak var d2: UIImageView!
    
    @IBOutlet weak var textBoxBackground: UIImageView!
    
    @IBOutlet weak var textBoxTextForground: UILabel!
    
    
    
        //This is my button currently displayed on screen
    @IBAction func myButton(_ sender: UIButton)
    {
        animateDiceWithKeyFramesForward()
        if let myDice = self.myDice.randomElement()
        {
            self.d1.image = myDice
        }
        
        if let myDice = self.myDice.randomElement()
        {
            self.d2.image = myDice
        }
        
        
        // My Button Sound
        func pressButton()
        {
            if let path = Bundle.main.path(forAuxiliaryExecutable: "Button-Sound.mp3")
            {
                let url = URL(fileURLWithPath: path)
                do{
                    sound = try AVAudioPlayer(contentsOf: url)
                    sound.play()
                }
                catch {
                    print("cant find audio file")
                }
            }
            
            
        }
        //Call press button function that plays sound effect
        pressButton()
        
        
        
        
    }
    
        //This is my viewDidLoad. This gets called after the controllers view is loaded into memory
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textBoxBackground.alpha = 0
        textBoxTextForground.alpha = 0
    }
    
       //This is my viewWill Appear. It Notifies the view controller that its view is about to be added to a view hierarchy.
    override func viewWillAppear(_ animated: Bool)
    {
        //-code- TextBoxBackground goes here set alpha 0
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        //*Fire* Initialize animations
        //self.textBoxBackground.alpha = 0
      
    }
    
        // Here i used Functional programming to enable me to utilize functions that call functions in order to link my animations together and perform sequencing
    func  animateDiceWithKeyFramesForward()
    {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations:
        {
         UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations:
            {
                self.d1.frame.origin.y -= 300
                self.d2.frame.origin.y -= 300
                self.d1.alpha = 0
                self.d2.alpha = 0
                //self.d2.frame.origin.y -= 350
              
            })
        })
        {
            (comleted) in
           self.animateDiceWithKeyFramesBackToOrgin()
        }
    }
    
    func animateDiceWithKeyFramesBackToOrgin()
    {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn], animations:
            {
                self.d1.frame.origin.y += 250
                self.d2.frame.origin.y += 250
                self.d1.alpha = 1
                self.d2.alpha = 1
        }){
            (completed) in
           
            self.animateTextBoxWithKeyFramesIntoSceen()
            
        }
    }
    
    func animateTextBoxWithKeyFramesIntoSceen()
    {
        UIView.animate(withDuration:5.0, delay: 0, options: [.curveEaseIn], animations:
        {
         self.textBoxBackground.alpha = 1
        }){
            (completed) in
            self.animateTextForgroundIntoSceen()
        }
    }
    
    func animateTextBoxWithKeyFramesOutOfSceen()
    {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations:
            {
             self.textBoxBackground.alpha = 0
            }, completion: nil)
    }
    
    
    func animateTextForgroundIntoSceen()
    {
        UIView.animate(withDuration: 3.0, delay: 0, options:
        [.curveEaseIn], animations:
            {
               self.textBoxTextForground.alpha = 1
        }){
            (completed)in
            self.animateTextForgroundOutOfSceen()
        }
    }
    
    
    func animateTextForgroundOutOfSceen()
    {
        UIView.animate(withDuration: 1.0, delay:0, options: [.curveEaseOut], animations:
            {
                self.textBoxTextForground.alpha = 0
        })
        {
            (completed)in
            self.animateTextBoxWithKeyFramesOutOfSceen()
        }
    }
    
    
}



