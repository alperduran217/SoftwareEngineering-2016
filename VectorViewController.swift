//
//  VectorViewController.swift
//  Civil
//
//  Created by Mehmet Alper Duran on 7.03.2016.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

var vector:[String] = []


import UIKit
import Charts


class VectorViewController: UIViewController, UIScrollViewDelegate, ChartViewDelegate{
    
    
    var tappedInt:Int = 0
    var fakeGraphX:[Double] = [0.0]
    var fakeGraphY:[Double] = [0.0]
    var lineGrarphX:[Double] = []
    var lineGrarphY:[Double] = []
    var rXarr:[Double] = []
    var rYarr:[Double] = []
    var rX = 0.0;
    var rY = 0.0;
    var rV = 0.0;
    var forceArray:[Double] = []
    var degreeArray:[Double] = []
    var cosX:Double = 0.0
    var sinY:Double = 0.0
    var roundedresult = 0.0
    var roundedresult2 = 0.0
    func radiansToDegrees (radians: Double)->Double {
        return radians * M_PI / 180
    }
    @IBOutlet weak var degreeField: UITextField!
    @IBOutlet weak var sliderValue: UISlider!
        @IBAction func sliderMoved(sender: AnyObject) {
        
        let value = String(Int(sliderValue.value))
        
        degreeField.text = value
        
    }


    
    @IBOutlet weak var viewForce: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
       
        degreeField.text = String(180)
        
       // GRAPH
        
       
        
        
        setChart(degreeArray, values: degreeArray)
        setChart2(fakeGraphX, values: fakeGraphY)
        
        barChartView.delegate = self
        lineChartView.delegate = self
      
        button.enabled = false
            }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    // DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Pagin yapan fonksiyon
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        self.pageControl.currentPage = Int(currentPage)
    }
 

    
    
    // SAYFA 1
    
    @IBOutlet weak var forceField: UITextField!
    @IBAction func addForce(sender: AnyObject) {
        guard let theText = forceField.text where !forceField.text!.isEmpty else {
            viewForce.text = "Must enter values to the empty spaces"
            return
        }
        print("user wrote \(theText)")
        
        if tappedInt != 0 {
            if forceField.text!.rangeOfString("√") != nil {
                let sliced = String(forceField.text!.characters.dropFirst())
                forceArray[tappedInt]=(sqrt(Double(sliced)!))
                
                forceField.text = nil }
                
            else {
                
                
                forceArray[tappedInt]=(Double(forceField.text!)!)
                
                forceField.text = ""
            }
            
            degreeArray[tappedInt] = Double(degreeField.text!)!
            setChart(degreeArray, values: forceArray)
            
           
             let   roundresult = Double(String(format:"%.3f", forceArray[tappedInt]))!
                
                viewForce.text = "\(tappedInt+1). Vector = \(roundresult) N, \(degreeArray[tappedInt]) ° \n"
            

            tappedInt = 0
        }
        
        else {
        if forceField.text!.rangeOfString("√") != nil {
            let sliced = String(forceField.text!.characters.dropFirst())
            forceArray.append(sqrt(Double(sliced)!))
            
            forceField.text = nil }
            
        else {

        
                forceArray.append(Double(forceField.text!)!)
            forceField.text = ""
    }
        degreeArray.append(Double(degreeField.text!)!)
        
        setChart(degreeArray, values: forceArray)

        for var i=0 ; i<forceArray.count; i++ {
            
            var roundresult = 0.0
            roundresult = Double(String(format:"%.3f", forceArray[i]))!
            
            viewForce.text = "\(i+1). Vector = \(roundresult) N, \(degreeArray[i]) ° \n"
        }
        
        }


    }
    
    // SAYFA 2
    
    
    //set up the chart
    
    func setChart(dataPoints: [Double], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        barChartView.descriptionText = ""
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Forces vs Angles")
        let chartData = BarChartData(xVals: degreeArray, dataSet: chartDataSet)
        barChartView.data = chartData
        barChartView.xAxis.labelPosition = .Bottom
        chartDataSet.colors = ChartColorTemplates.colorful()
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        print("\(entry.value) in \(forceArray[entry.xIndex])")
        
        tappedInt = entry.xIndex
        button.enabled = true
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState())
    }
    

    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        forceField.text = String(forceArray[tappedInt])
        degreeField.text = String(degreeArray[tappedInt])

    }
    
   // SAYFA 3
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBAction func findResult(sender: AnyObject) {
        
        if forceArray.count == degreeArray.count {
            for var i=0; i<forceArray.count; i++ {
                
                
                cosX = cos(radiansToDegrees(degreeArray[i]))
                rXarr += [forceArray[i]*cosX]
                sinY = sin(radiansToDegrees(degreeArray[i]))
                rYarr += [forceArray[i]*sinY]
                
                
            }
            
            for var j=0; j<rXarr.count; j++ {
                setChart2(rXarr, values: rYarr)

                rX += rXarr[j]
                rY += rYarr[j]
            }
            
            lineGrarphX.append(rXarr[0])
            lineGrarphY.append(rYarr[0])
            setChart3(lineGrarphX, values: lineGrarphY)
            lineGrarphX.append(rX)
            lineGrarphY.append(rY)
            setChart3(lineGrarphX, values: lineGrarphY)


            


            

            
            
            var result = 0.0
            var result2 = 0.0
            result=sqrt(rX*rX+rY*rY)
            var x = 0.0
            
            x=rY/rX
            
            result2 = atan(x) * (180 / M_PI)
            
            
            
            
            roundedresult = Double(String(format:"%.3f", result))!
            roundedresult2 = Double(String(format:"%.3f", result2))!
            
            
            
            
            
            resultLbl.text = "R Vector = \(roundedresult) N, \(roundedresult2) °"
            
        }
        else {
            resultLbl.text = "Force and magnitude values must be equal"
        }
        
        

    }
    
    
    func setChart2(dataPoints: [Double], values: [Double]) {
        barChartView.descriptionText = ""

        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Final Vector")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        
    }
    
    
    
    func setChart3(dataPoints: [Double], values: [Double]) {
        barChartView.descriptionText = ""
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Final Vector")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        
        lineChartDataSet.colors = ChartColorTemplates.colorful()

        
    }
    

}
