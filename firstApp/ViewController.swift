//
//  ViewController.swift
//  firstApp
//
//  Created by Panacloud on 3/31/15.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //Outlets
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var object1: UIView!
    @IBOutlet weak var object2: UIView!
    @IBOutlet weak var object3: UIView!
    @IBOutlet weak var object4: UIView!
    @IBOutlet weak var object5: UIView!
    @IBOutlet weak var object6: UIView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var userIconView: UIView!
    @IBOutlet weak var audioView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewContainer: UIView!
    @IBOutlet weak var exploreViewContainer: UIView!
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var segmentSelector: UISegmentedControl!
    @IBOutlet var pen: UIPanGestureRecognizer!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!

    // bounadries variable
    var object1MinX : CGFloat?
    var object1MaxX : CGFloat?
    var object1MinY : CGFloat?
    var object1MaxY : CGFloat?
    
    var object2MinX : CGFloat?
    var object2MaxX : CGFloat?
    var object2MinY : CGFloat?
    var object2MaxY : CGFloat?
    
    var object3MinX : CGFloat?
    var object3MaxX : CGFloat?
    var object3MinY : CGFloat?
    var object3MaxY : CGFloat?
    
    var object4MinX : CGFloat?
    var object4MaxX : CGFloat?
    var object4MinY : CGFloat?
    var object4MaxY : CGFloat?
    
    var object5MinX : CGFloat?
    var object5MaxX : CGFloat?
    var object5MinY : CGFloat?
    var object5MaxY : CGFloat?
    
    var object6MinX : CGFloat?
    var object6MaxX : CGFloat?
    var object6MinY : CGFloat?
    var object6MaxY : CGFloat?
    
    var counter = 3
    var timer = NSTimer()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }
    
    override func viewWillAppear(animated: Bool) {
     
        roundObjects(circle)
        roundObjects(object1)
        roundObjects(object2)
        roundObjects(object3)
        roundObjects(object4)
        roundObjects(object5)
        roundObjects(object6)
        roundObjects(roundView)
        roundObjects(counterView)
        roundObjects(audioView)
        roundObjects(searchView)
        
        circle.layer.borderColor = UIColor.blackColor().CGColor
        circle.layer.borderWidth = 2
        roundView.layer.borderColor = UIColor.blackColor().CGColor
        roundView.layer.borderWidth = 2
        //collectionView.hidden = true
 
        objectHide()
        collectionViewContainer.hidden = true
        circle.hidden = false

        //boundaries
        object1MinX = object1.frame.minX
        object1MaxX = object1.frame.maxX
        object1MinY = object1.frame.minY
        object1MaxY = object1.frame.maxY
        
        object2MinX = object2.frame.minX
        object2MaxX = object2.frame.maxX
        object2MinY = object2.frame.minY
        object2MaxY = object2.frame.maxY
        
        object3MinX = object3.frame.minX
        object3MaxX = object3.frame.maxX
        object3MinY = object3.frame.minY
        object3MaxY = object3.frame.maxY
        
        object4MinX = object4.frame.minX
        object4MaxX = object4.frame.maxX
        object4MinY = object4.frame.minY
        object4MaxY = object4.frame.maxY
        
        object5MinX = object5.frame.minX
        object5MaxX = object5.frame.maxX
        object5MinY = object5.frame.minY
        object5MaxY = object5.frame.maxY
        
        object6MinX = object6.frame.minX
        object6MaxX = object6.frame.maxX
        object6MinY = object6.frame.minY
        object6MaxY = object6.frame.maxY
    }

    
    @IBAction func segmentControlEvent(sender: AnyObject) {
        
        if segmentSelector.selectedSegmentIndex == 1 {
            objectHide()
            circle.hidden = false
            segmentSelector.setTitle("Music", forSegmentAtIndex: 1)
            roundObjects(circle)
            self.objectAnimate(self.searchTextField, x: 250, y: 5, width: 20, height: 30)
            
            
        }
        
        if segmentSelector.selectedSegmentIndex == 0 {
            
            objectHide()
            exploreViewContainer.hidden = false
            segmentSelector.setTitle("HumTap", forSegmentAtIndex: 1)
            counter  = 3
            counterLabel.text = "3"
            self.objectAnimate(self.searchTextField, x: 250, y: 5, width: 20, height: 30)
            
            
            
        }
        
        if segmentSelector.selectedSegmentIndex == 2 {
            objectHide()
            segmentSelector.setTitle("Music", forSegmentAtIndex: 1)
            counter  = 3
            counterLabel.text = "3"
            self.objectAnimate(self.searchTextField, x: 250, y: 5, width: 20, height: 30)
            
        }
    }
    
    
    @IBAction func touchDownEvent(sender: AnyObject) {

        
        
        objectShow()
//        objectAnimate(object1, x: 52, y: 146, width: 50, height: 50)
//        objectAnimate(object2, x: 52, y: 300, width: 50, height: 50)
//        objectAnimate(object3, x: 215, y: 146, width: 50, height: 50)
//        objectAnimate(object4, x: 215, y: 293, width: 50, height: 50)
//        objectAnimate(object5, x: 135, y: 87, width: 50, height: 50)
//        objectAnimate(object6, x: 135, y: 358, width: 50, height: 50)
        
        
        
        //animateCircle(self.circle, height: 40, width: 40)
        circle.bounds.size.width = 60
        circle.bounds.size.height = 60
        roundObjects(circle)
 
    }
   
    
    @IBAction func collectionViewCancelEvent(sender: AnyObject) {
 
                UIView.animateWithDuration(1.0, animations: {
            
            self.collectionViewContainer.center.y += self.view.center.y
            self.objectAnimate(self.searchTextField, x: 250, y: 5, width: 20, height: 30)
 
        
        })
        
        if object4.center == self.view.center {
        
        swapping(object4, subObject: circle)
        
        }
            
        else {
            
            swapping(object3, subObject: circle)
        }
        
        objectHide()
        circle.hidden = false
        circle.bounds.size.height = 70
        circle.bounds.size.width = 70
        roundObjects(circle)
    
    }
    
    @IBAction func touchUpEvent(sender: AnyObject) {
    
        objectHide()
        circle.hidden = false
        animateCircle(self.circle, height: 70, width: 70)
 
    }
    
    
    @IBAction func searchClick(sender: AnyObject) {
        
        searchTextField.hidden = false
        objectAnimate(searchTextField, x: 10, y: 5, width: 250, height: 30)
        
    }
    

    @IBAction func penGesture(sender: AnyObject) {
   
        let moveCircle = sender.locationInView(self.view)
        
        if pen.state == .Changed {
            
        circle.center = moveCircle
            
        }
  
        if pen.state == .Ended {
        
            
            if circle.center.x > object1MinX && circle.center.x < object1MaxX && circle.center.y > object1MinY && circle.center.y < object1MaxY   {
                
                swapping(circle, subObject: object1)
                
                objectHide()
                
                counterView.hidden = false
                
                
                counterLabel.text = String(counter)
                
                timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "counterDecrement", userInfo: nil, repeats: true)
         
                
            }
            else if circle.center.x > object2MinX && circle.center.x < object2MaxX && circle.center.y > object2MinY && circle.center.y < object2MaxY   {
     
                swapping(circle, subObject: object2)
                
                objectHide()
                
                counterView.hidden = false
         
                counterLabel.text = String(counter)
                
                timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "counterDecrement", userInfo: nil, repeats: true)

            }

            else if circle.center.x > object3MinX && circle.center.x < object3MaxX && circle.center.y > object3MinY && circle.center.y < object3MaxY   {
                
                swapping(circle, subObject: object3)
                
                objectHide()
                
                collectionViewContainer.hidden = false
 
                UIView.animateWithDuration(1.0, animations: {
                    
                    self.collectionViewContainer.center.y -= self.view.center.y
                })
                
                
            }
                
            else if circle.center.x > object4MinX && circle.center.x < object4MaxX && circle.center.y > object4MinY && circle.center.y < object4MaxY   {
                
                swapping(circle, subObject: object4)
                
                objectHide()
                
                collectionViewContainer.hidden = false
       
                UIView.animateWithDuration(1.0, animations: {
                    
                    self.collectionViewContainer.center.y -= self.view.center.y
                    
                    })
     
                
            }
     
            else if circle.center.x > object5MinX && circle.center.x < object5MaxX && circle.center.y > object5MinY && circle.center.y < object5MaxY   {
                
                
                swapping(circle, subObject: object5)
        
            
            
            }
  
            else if circle.center.x > object6MinX && circle.center.x < object6MaxX && circle.center.y > object6MinY && circle.center.y < object6MaxY   {
                
                swapping(circle, subObject: object6)
                
            }

            else {
                
                circle.center = self.view.center
                objectHide()
                circle.hidden = false
                //animateCircle(self.circle, height: 50, width: 50)
                circle.bounds.size.width = 70
                circle.bounds.size.height = 70
                roundObjects(circle)
            }
  
            
        }
        
    }

        
   
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == exploreCollectionView{
        
            return 10
        }
        else {
            
            return 8
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if collectionView == exploreCollectionView {
       let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Explore Cell", forIndexPath: indexPath) as UICollectionViewCell
            let userViewIcon :UIView! = cell.viewWithTag(123)
            roundObjects(userViewIcon)
            
            
        
        //cell.backgroundColor = cellColor ? UIColor.redColor() : UIColor.blueColor()
        //cellColor = !cellColor
       // cell.layer.cornerRadius = cell.bounds.size.width/2
        
        return cell
        }
        
        else {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
            
            
            //cell.backgroundColor = cellColor ? UIColor.redColor() : UIColor.blueColor()
            //cellColor = !cellColor
            cell.layer.cornerRadius = cell.bounds.size.width/2
            
            return cell
        }
        
        
        
    }

    
    //object hidden
    func objectHide() {
        
        
        object1.hidden = true
        object2.hidden = true
        object3.hidden = true
        object4.hidden = true
        object5.hidden = true
        object6.hidden = true
        circle.hidden = true
        roundView.hidden = true
        counterView.hidden = true
        //collectionViewContainer.hidden = true
        exploreViewContainer.hidden = true
        audioView.hidden = true
        searchTextField.hidden = true
        
        
    }
    


    
    //object Show
    func objectShow() {
        
        
        object1.hidden = false
        object2.hidden = false
        object3.hidden = false
        object4.hidden = false
        object5.hidden = false
        object6.hidden = false
        roundView.hidden = false
        
        
    }

    
    func roundObjects(objectName: UIView){
        objectName.layer.cornerRadius = objectName.bounds.size.width/2
    }
 
    
    func swapping(mainObject: UIView, subObject: UIView) {
        
        mainObject.center.x = subObject.center.x
        mainObject.center.y = subObject.center.y
        
        subObject.center = view.center
        
        
    }
    
    func animateCircle(object: UIView , height: Int , width: Int) {
        
        UIView.animateWithDuration(1.0, animations: {
            
            object.bounds.size.height = CGFloat(height)
            object.bounds.size.width = CGFloat(width)
            object.layer.cornerRadius = object.bounds.size.width/2
        })
        
    }
    
    
    func counterDecrement() {

        
        counterLabel.text = String(counter--)
        if counter  < -1 {
            timer.invalidate()
            counter = 0
            counterView.hidden = true
            audioView.hidden = false
            
        }
//        counterView.hidden = true
//        audioView.hidden = false
        
        
        
        
    }
    
    //    func swapObjects(mainCircle: UIView, objectCircle: UIView)  {
    //
    //        if mainCircle.center.x < objectCircle.frame.maxX && mainCircle.center.x > objectCircle.frame.minX && mainCircle.center.y < objectCircle.frame.maxY && mainCircle.center.y > objectCircle.frame.minY {
    //
    //
    //            mainCircle.center.x =  objectCircle.center.x
    //            mainCircle.center.y = objectCircle.center.y
    //            objectCircle.center = self.view.center
    //
    //
    //
    //        }
    //        else {
    //
    //            circle.center = self.view.center
    //
    //        }
    //        circle.removeGestureRecognizer(pen)
    //
    //
    //
    //
    //
    //    }
    
    
        func objectAnimate(objectName: UIView, x: Int, y: Int, width: Int, height: Int){
    
            UIView.animateWithDuration(1.0, animations: {
    
                objectName.frame = CGRect(x: x, y: y , width: width,height: height)
            })
            
           
        }

}

