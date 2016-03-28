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
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MomentViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Variables
    
    var bigArray:[[String]] =  [[String]](count:50, repeatedValue:[String](count:6, repeatedValue:""))
    
    var biggestArray:[Double] = []
    
    var row = 0
    var column = 0
    var sum = 0.0
    var mI = 0.0
    var mJ = 0.0
    var mK = 0.0
    var sumI = 0.0
    var sumJ = 0.0
    var sumK = 0.0
    
    // Main.storyboard Section

    @IBOutlet weak var xField: UITextField!
    
    @IBOutlet weak var yField: UITextField!
    
    @IBOutlet weak var zField: UITextField!
    
    @IBOutlet weak var iField: UITextField!
    
    @IBOutlet weak var jField: UITextField!
    
    @IBOutlet weak var kField: UITextField!
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var iLabel: UILabel!
    @IBOutlet weak var jLabel: UILabel!
    @IBOutlet weak var kLabel: UILabel!
    // Coding Section
    @IBAction func addition(sender: AnyObject) {
        
        if column == 6 {
            
            column = 0
        }
        
        
        bigArray[row][column] = (iField.text)!
        column = column + 1
        
        bigArray[row][column] = (jField.text)!
        column = column + 1
        
        bigArray[row][column] = (kField.text)!
        column = column + 1
        
        bigArray[row][column] = (xField.text)!
        column = column + 1
        
        bigArray[row][column] = (yField.text)!
        column = column + 1
        
        bigArray[row][column] = (zField.text)!
        column = column + 1
        row = row + 1
        column = 0
        
        print(bigArray)
        
        iField.text = nil
        jField.text = nil
        kField.text = nil
        xField.text = nil
        yField.text = nil
        zField.text = nil
        
    }
    
    @IBAction func findResult(sender: AnyObject) {
        
        
        for i in 0...1000 {
            if bigArray[i][0] == "" {
                break
            }
            mI = Double(bigArray[i][1])!*Double(bigArray[i][5])! - Double(bigArray[i][2])!*Double(bigArray[i][4])!
            mJ = Double(bigArray[i][2])!*Double(bigArray[i][3])! - Double(bigArray[i][0])!*Double(bigArray[i][5])!
            mK = Double(bigArray[i][0])!*Double(bigArray[i][4])! - Double(bigArray[i][1])!*Double(bigArray[i][3])!
            
            sumI += mI
            sumJ = sumJ + mJ
            sumK += mK
        }
        
        iLabel.text = String(sumI)
        jLabel.text = String(sumJ)
        kLabel.text = String(sumK)


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
