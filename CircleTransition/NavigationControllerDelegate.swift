//
//  NavigationcontrollerDelegate.swift
//  CircleTransition
//
//  Created by kelly on 2014/12/5.
//  Copyright (c) 2014年 kelly. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject , UINavigationControllerDelegate{
    
    @IBOutlet weak var navigationcontroller: UINavigationController?
    
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var panGesture = UIPanGestureRecognizer(target: self, action: Selector("panned:"))
        self.navigationcontroller!.view.addGestureRecognizer(panGesture)
    }
    
    @IBAction func panned(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .Began:
            self.interactionController = UIPercentDrivenInteractiveTransition()
            if self.navigationcontroller?.viewControllers.count > 1 {
                self.navigationcontroller?.popViewControllerAnimated(true)
            } else {
                self.navigationcontroller?.topViewController.performSegueWithIdentifier("PushSegue", sender: nil)
            }
            
        case .Changed:
            var translation = gestureRecognizer.translationInView(self.navigationcontroller!.view)
            var completionProgress = translation.x/CGRectGetWidth(self.navigationcontroller!.view.bounds)
            self.interactionController?.updateInteractiveTransition(completionProgress)
            
        case .Ended:
            if (gestureRecognizer.velocityInView(self.navigationcontroller!.view).x > 0) {
                self.interactionController?.finishInteractiveTransition()
            } else {
                self.interactionController?.cancelInteractiveTransition()
            }
            self.interactionController = nil
            
        default:
            self.interactionController?.cancelInteractiveTransition()
            self.interactionController = nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CircleTransitionAnimator()
    } 
}
