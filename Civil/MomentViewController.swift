//
//  MomentViewController.swift
//  Civil
//
//  Created by Mehmet Alper Duran on 15.03.2016.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class MomentViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Main.storyboard Section

    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
    // Coding Section
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    
}
