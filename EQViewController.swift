//
//  EQViewController.swift
//  Civil
//
//  Created by Mehmet Alper Duran on 10.03.2016.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class EQViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // This scrolView delegates to itself
        
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
    
    @IBOutlet weak var xField: UITextField!
    
    @IBOutlet weak var yField: UITextField!
    
    @IBOutlet weak var zField: UITextField!
    
    @IBOutlet weak var hField: UITextField!
    
    @IBOutlet weak var forceField: UITextField!
    
    @IBOutlet weak var xLbl: UILabel!
    
    @IBOutlet weak var yLbl: UILabel!
    
    @IBOutlet weak var zLbl: UILabel!
    
    
    // Variables
    
    var roundedresult = 0.0
    var roundedresult2 = 0.0
    var roundedresult3 = 0.0
    
    
    var fX:Double = 0.0
    var fY:Double = 0.0
    var fZ:Double = 0.0
    
    
    var arrayX:[[Double]] = [[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]]
    var arrayB:[Double] = []
    
    var tempArr:[Double] = []
    
    
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
    var t:Double = 0.0
    var q:Double = 0.0
    var w:Double = 0.0
    
    
    var x1:Double = 0.0
    var y1:Double = 0.0
    var z1:Double = 0.0
    var t1:Double = 0.0
    var q1:Double = 0.0
    var w1:Double = 0.0
    
    var x2:Double = 0.0
    var y2:Double = 0.0
    var z2:Double = 0.0
    var t2:Double = 0.0
    var q2:Double = 0.0
    var w2:Double = 0.0
    
    var x3:Double = 0.0
    var y3:Double = 0.0
    var z3:Double = 0.0
    var t3:Double = 0.0
    var q3:Double = 0.0
    var w3:Double = 0.0
    
    
    var sum1:Double = 0.0
    var sum2:Double = 0.0
    var sum3:Double = 0.0
    var sum4:Double = 0.0
    var sum7 = 0.0
    var sum8 = 0.0
    var sum9 = 0.0
    var sum10 = 0.0
    
    
    var total:Double = 0.0
    var total2:Double = 0.0
    var total3 = 0.0
    var total4 = 0.0
    
    
    var tempor1 = 0.0
    var tempor2 = 0.0
    var tempor3 = 0.0
    
    
    var wF:Double = 0.0
    
    
    var temp1:[Double] = [0.0,0.0,0.0]
    var temp2:[Double] = [0.0,0.0,0.0]
    var temp3:[Double] = [0.0,0.0,0.0]
    
    
    var height:Double = 0.0
    
    
    var divide1:Double = 0.0
    var divide2:Double = 0.0
    var divide3:Double = 0.0
    
    
    var dA:[Double] = []
    var dB:[Double] = []
    var dC:[Double] = []
    var dW:[Double] = [0,0,0]
    
    
    var fA:[Double] = []
    var fB:[Double] = []
    var fC:[Double] = []
    var aArr:[Double] = []
    var bArr:[Double] = []
    var cArr:[Double] = []
    
    
    var buttonCount = 0
    var buttonCount2 = 0
    
    
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
    

    
    @IBAction func addCoor(sender: AnyObject) {
        
        if buttonCount == 0 {
            dA.append(Double(xField.text!)!)
            dA.append(Double(yField.text!)!)
            dA.append(Double(zField.text!)!)
            
            
            
            xField.text = nil
            yField.text = nil
            zField.text = nil
            
        }
        
        if buttonCount == 1 {
            dB.append(Double(xField.text!)!)
            dB.append(Double(yField.text!)!)
            dB.append(Double(zField.text!)!)
            
            
            
            xField.text = nil
            yField.text = nil
            zField.text = nil
        }
        
        if buttonCount == 2 {
            dC.append(Double(xField.text!)!)
            dC.append(Double(yField.text!)!)
            dC.append(Double(zField.text!)!)
            
            
            
            xField.text = nil
            yField.text = nil
            zField.text = nil
        }
        let disableMyButton = sender as? UIButton
        if buttonCount == 2 {
            disableMyButton!.enabled = false
            
        }
        buttonCount = buttonCount + 1
    }
    
    
    @IBAction func addForce(sender: AnyObject) {
        
        height = Double(hField.text!)!
        wF = Double(forceField.text!)!
        
   
        
        hField.text = nil
        forceField.text = nil
        
        buttonCount2 = buttonCount2 + 1
        
        arrayB.append(0)
        arrayB.append(0)
        arrayB.append(-wF)
        
        
        let disableMyButton = sender as? UIButton
        
        if buttonCount2 == 1 {
            
            disableMyButton!.enabled = false
            
        }

    }
    
    @IBAction func calculateButton(sender: AnyObject) {
        dA[2] = dA[2] - height
        
        dB[2] = dB[2] - height
        
        dC[2] = dC[2] - height
        
        for var i = 0 ; i<=2 ; i++ {
            
            temp1[i] = dA[i] - dW[i]
            temp2[i] = dB[i] - dW[i]
            temp3[i] = dC[i] - dW[i]
            
            divide1 += (dA[i] - dW[i])*(dA[i] - dW[i])
            divide2 += (dB[i] - dW[i])*(dB[i] - dW[i])
            divide3 += (dC[i] - dW[i])*(dC[i] - dW[i])
        }
        
        for var i = 0 ; i<=2 ; i++ {
            
            tempor1 = temp1[i] / sqrt(divide1)
            tempor2 = temp2[i] / sqrt(divide2)
            tempor3 = temp3[i] / sqrt(divide3)
            
            
            fA.append(tempor1)
            fB.append(tempor2)
            fC.append(tempor3)
        }
        
        for var j = 0 ; j<=2 ; j++ {
            
            for var k = 0 ; k<=2 ; k++ {
                if k==0 {
                    arrayX[j][k] = fA[j]
                }
                
                if k==1 {
                    arrayX[j][k] = fB[j]
                }
                
                if k==2 {
                    arrayX[j][k] = fC[j]
                    
                }
                
            }
            
        }
        
        x = arrayX[0][0]*arrayX[1][1]*arrayX[2][2]
        y = arrayX[0][1]*arrayX[1][2]*arrayX[2][0]
        z = arrayX[0][2]*arrayX[1][0]*arrayX[2][1]
        t = arrayX[0][2]*arrayX[1][1]*arrayX[2][0]
        q = arrayX[0][0]*arrayX[1][2]*arrayX[2][1]
        w = arrayX[0][1]*arrayX[1][0]*arrayX[2][2]
        
        
        
        sum1 = x+y+z
        
        sum2 = t+q+w
        
        total = sum1-sum2
        
        if fX == 0 {
            tempArr.append(arrayX[0][0])
            arrayX[0][0] = arrayB[0]
            tempArr.append(arrayX[0][1])
            arrayX[1][0] = arrayB[1]
            tempArr.append(arrayX[0][2])
            arrayX[2][0] = arrayB[2]
            
            
            x1 = arrayX[0][0]*arrayX[1][1]*arrayX[2][2]
            y1 = arrayX[0][1]*arrayX[1][2]*arrayX[2][0]
            z1 = arrayX[0][2]*arrayX[1][0]*arrayX[2][1]
            t1 = arrayX[0][2]*arrayX[1][1]*arrayX[2][0]
            q1 = arrayX[0][0]*arrayX[1][2]*arrayX[2][1]
            w1 = arrayX[0][1]*arrayX[1][0]*arrayX[2][2]
            
            
            sum3 = x1+y1+z1
            
            sum4 = t1+q1+w1
            
            total2 = sum3-sum4
            
            fX = total2/total
            
            arrayX[0][0] = tempArr[0]
            arrayX[1][0] = tempArr[1]
            arrayX[2][0] = tempArr[2]
            
            
            
        }
        
        
        if fY == 0 {
            tempArr[0] = arrayX[0][1]
            arrayX[0][1] = arrayB[0]
            tempArr[1] = arrayX[1][1]
            arrayX[1][1] = arrayB[1]
            tempArr[2] = arrayX[2][1]
            arrayX[2][1] = arrayB[2]
            
            
            x2 = arrayX[0][0]*arrayX[1][1]*arrayX[2][2]
            y2 = arrayX[0][1]*arrayX[1][2]*arrayX[2][0]
            z2 = arrayX[0][2]*arrayX[1][0]*arrayX[2][1]
            t2 = arrayX[0][2]*arrayX[1][1]*arrayX[2][0]
            q2 = arrayX[0][0]*arrayX[1][2]*arrayX[2][1]
            w2 = arrayX[0][1]*arrayX[1][0]*arrayX[2][2]
            
            
            sum7 = x2+y2+z2
            
            sum8 = t2+q2+w2
            
            total3 = sum7-sum8
            
            fY = total3/total
            
            arrayX[0][1] = tempArr[0]
            arrayX[1][1] = tempArr[1]
            arrayX[2][1] = tempArr[2]
            
        }
        
        
        
        if fZ == 0 {
            
            tempArr[0] = arrayX[0][2]
            arrayX[0][2] = arrayB[0]
            tempArr[1] = arrayX[1][2]
            arrayX[1][2] = arrayB[1]
            tempArr[2] = arrayX[2][2]
            arrayX[2][2] = arrayB[2]
            
            print(arrayX)
            
            x3 = arrayX[0][0]*arrayX[1][1]*arrayX[2][2]
            y3 = arrayX[0][1]*arrayX[1][2]*arrayX[2][0]
            z3 = arrayX[0][2]*arrayX[1][0]*arrayX[2][1]
            t3 = arrayX[0][2]*arrayX[1][1]*arrayX[2][0]
            q3 = arrayX[0][0]*arrayX[1][2]*arrayX[2][1]
            w3 = arrayX[0][1]*arrayX[1][0]*arrayX[2][2]
            
            
            sum9 = x3+y3+z3
            
            sum10 = t3+q3+w3
            
            total4 = sum9-sum10
            
            fZ = total4/total
            
            arrayX[0][2] = tempArr[0]
            arrayX[1][2] = tempArr[1]
            arrayX[2][2] = tempArr[2]
            
        }
        
        
        roundedresult = Double(String(format:"%.3f", fX))!
        roundedresult2 = Double(String(format:"%.3f", fY))!
        roundedresult3 = Double(String(format:"%.3f", fZ))!
        
        
        xLbl.text = "Fx = \(roundedresult)"
        yLbl.text = "Fy = \(roundedresult2)"
        zLbl.text = "Fz = \(800-roundedresult3)"
        

    }
}
