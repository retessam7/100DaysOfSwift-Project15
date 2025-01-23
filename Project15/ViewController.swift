//
//  ViewController.swift
//  Project15
//
//  Created by VII on 23.01.2025.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        
        // method accepts two closures. what animations to execute, and finally a closure that will execute when the animation finishes.
        // don’t need to use [weak self] because there’s no risk of strong reference cycles here – the closures passed to animate(withDuration:) used once then thrown away
        UIView.animate(withDuration: 1, delay: 0, options: [],
                       animations: {
            switch self.currentAnimation {
            case 0:
                break
            
            default:
                break
            }
        }) { finished in
            sender.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

