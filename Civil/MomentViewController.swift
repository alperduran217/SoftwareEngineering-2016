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

    
    // Variables
    
     var bigArray:[[Double]] =  [[Double]]()
    
    var row = 0
    var column = 0
    
    // Main.storyboard Section

    @IBOutlet weak var xField: UITextField!
    
    @IBOutlet weak var yField: UITextField!
    
    @IBOutlet weak var zField: UITextField!
    
    @IBOutlet weak var iField: UITextField!
    
    @IBOutlet weak var jField: UITextField!
    
    @IBOutlet weak var kField: UITextField!
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
    // Coding Section
    @IBAction func addition(sender: AnyObject) {
        
        if column == 6 {
            
            column = 0
        }
        
        bigArray[row].append(Double(iField.text!)!)
        column = column + 1
        
        bigArray[row].append(Double(jField.text!)!)
        column = column + 1
        
        bigArray[row].append(Double(kField.text!)!)
        column = column + 1
        
        bigArray[row].append(Double(xField.text!)!)
        column = column + 1
        
        bigArray[row].append(Double(yField.text!)!)
        column = column + 1
        
        bigArray[row].append(Double(zField.text!)!)
        column = column + 1
        row = row + 1
        
        print(bigArray)
        
        iField.text = nil
        jField.text = nil
        kField.text = nil
        xField.text = nil
        yField.text = nil
        zField.text = nil
        
    }
    

    
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
