//
//  MainGameBackgroundViewController.swift
//  Super-Dice-Roll-Game
//
//  Created by Joey Essak on 3/11/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//
import UIKit
import AVFoundation



class MainGameBackgroundViewController: UIViewController{
    
    
    var player:AVAudioPlayer = AVAudioPlayer()
   
    @IBOutlet weak var myMainImage: UIImageView!
    
    @IBOutlet weak var feelingLuckyText: UIImageView!
    
    @IBOutlet weak var instructionsText: UIImageView!
    
    
    @IBOutlet weak var rulesText: UIImageView!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    do{
        let audioPath =  Bundle.main.path(forResource: "Super-Dice-Theme", ofType: "mp3")
        try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch
    {
        // process error
        print("No Audio File Found!")
    }
    
    
    
    player.play()
}


override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    myMainImage.alpha = 0
   feelingLuckyText.alpha = 0
   rulesText.alpha = 0
   instructionsText.alpha = 0
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // TODO: Fire initial animations
    animateMainImage()
    
}


//Mark: Animation
func animateMainImage()
{
    UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseIn], animations: {
       self.myMainImage.alpha = 1
    }){
        (completed) in
        self.animateFeelingLuckyText()
    }
}
func animateFeelingLuckyText()
{
    UIView.animate(withDuration: 2.0, delay:0, options: [.curveEaseIn], animations: {
    self.feelingLuckyText.alpha = 1
    }){
        (completed) in
        self.animateFeelingLuckyTextOut()
    }
}

func animateFeelingLuckyTextOut()
{
    UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
        self.feelingLuckyText.alpha = 0
    }){
        (completed) in
        self.animateInstructionsText()
    }
}

func animateInstructionsText()
{
    UIView.animate(withDuration: 3.5, delay: 0, options: [.curveEaseIn], animations: {
       self.instructionsText.alpha = 1
    }){
        (completed) in
        self.animateInstructionsTextOut()
    }
}

func animateInstructionsTextOut()
{
    UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
      self.instructionsText.alpha = 0
    }){
        (completed) in
        self.animateRuleText()
    }
}

func animateRuleText()
{
    UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseIn], animations: {
       self.rulesText.alpha = 1
    }){
        (completed) in
        self.animateRuleTextOut()
    }
}


func animateRuleTextOut()
{
    UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
      self.rulesText.alpha = 0
    }){
        (completed) in
        self.segueToNextViewController(segueID: Segues.toMainDiceGameVC, delay: 0)
    }
}







}

