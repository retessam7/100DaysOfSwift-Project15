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
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],
                       animations: {
            switch self.currentAnimation {
            case 0:
                // CGAffineTransform value that you can put into a view's transform property to apply it. Inside an animation block, transform automatically be animated
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            
            case 1:
                self.imageView.transform = .identity
                
            case 2:
                // values are deltas, or differences from the current value
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                
            case 3:
                self.imageView.transform = .identity
                
            case 4:
                // Core Animation will always take the shortest route to make the rotation work!
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            
            case 5:
                self.imageView.transform = .identity
                
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.green
                
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clear
                
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

//  UIKit animations have an "ease in, ease out" curve, which means the movement starts slow, accelerates, then slows down again before reaching the end.
// uses spring animations rather than the default, ease-in-ease-out animation
