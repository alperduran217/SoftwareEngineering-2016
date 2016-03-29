//
//  PinPointViewController.swift
//  Civil
//
//  Created by Mehmet Alper Duran on 29.03.2016.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class PinPointViewController: UIViewController, UIScrollViewDelegate {

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
    
    var arrA:[Double] = []
    var arrB:[Double] = []
    
    var counter = 0
    
    var bigM = 0.0

    
    var resultA = 0.0
    var resultB = 0.0
    
    var areaA = 0.0
    var areaB = 0.0
    
    var distance = 0.0

    
    @IBOutlet weak var resB: UILabel!
    @IBOutlet weak var resA: UILabel!
    @IBOutlet weak var mField: UITextField!
    
    @IBOutlet weak var magnitudeField: UITextField!

    @IBOutlet weak var angleField: UITextField!
    
    @IBOutlet weak var distanceField: UITextField!
    
    @IBOutlet weak var lengthField: UITextField!
    
    @IBOutlet weak var pinField: UITextField!
    
    @IBOutlet weak var forceField: UITextField!
    
    @IBOutlet weak var cornerField: UITextField!
    
    @IBOutlet weak var magnitudeField2: UITextField!

    @IBAction func addAll(sender: AnyObject) {
        
        counter = counter + 1
        
        if counter == 1 {
            arrA.append(Double(magnitudeField.text!)!)
            arrA.append(Double(angleField.text!)!)
            arrA.append(Double(distanceField.text!)!)
            arrA.append(Double(lengthField.text!)!)
            arrA.append(Double(pinField.text!)!)
            arrA.append(Double(forceField.text!)!)
            arrA.append(Double(cornerField.text!)!)
            
        }
        
        bigM = Double(mField.text!)!
        
        if counter == 2{
            arrB.append(Double(magnitudeField.text!)!)
            arrB.append(Double(angleField.text!)!)
            arrB.append(Double(distanceField.text!)!)
            arrB.append(Double(lengthField.text!)!)
            arrB.append(Double(pinField.text!)!)
            arrB.append(Double(forceField.text!)!)
            arrB.append(Double(cornerField.text!)!)
            
        }
    }
    
    @IBAction func findAll(sender: AnyObject) {
        
        areaA = arrA[3]*arrA[5]
        areaB = arrB[3]*arrB[5]
        
        
        
        if arrA[6] == 3 {
            areaA = areaA / 2
            
            arrA[6] = arrA[3] / 3 + arrA[4]
            
        }
        
        if arrA[6] == 4 {
            
            
            arrA[6] = arrA[3] / 2 + arrA[4]
            
        }
        
        if arrB[6] == 4 {
            
            
            arrB[6] = arrB[3] / 2 + arrB[4]
            
        }
        
        if arrB[6] == 3 {
            areaB = areaB / 2
            
            arrB[6] = arrB[3] / 3 + arrB[4]
        }
        
        
        distance = arrA[4] - arrB[4]
        
        sin(radiansToDegrees(arrB[1]))
        
        
        
        
        resultB = (bigM + (areaA * (arrA[4] - (arrA[6]))) + (arrA[0]*sin(radiansToDegrees(arrA[1]))*(arrA[4] - arrA[2])) +   (areaB*(arrA[4]-arrB[6])) +  (arrB[0]*sin(radiansToDegrees(arrB[1]))*(arrA[4] - arrB[2]))        ) / distance
        
        
        
        
        resultB = (bigM + (areaA * (arrB[4] - (arrA[6]))) + (arrA[0]*sin(radiansToDegrees(arrA[1]))*(arrB[4] - arrA[2])) +   (areaB*(arrB[4]-arrB[6])) +  (arrB[0]*sin(radiansToDegrees(arrB[1]))*(arrB[4] - arrB[2]))        ) / distance
        
        
        
        resA.text = String(resultA)
        resB.text = String(resultB)

        
    }
    
    func radiansToDegrees (radians: Double)->Double {
        return radians * M_PI / 180
    }
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var pageControl: UIPageControl!
    
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
