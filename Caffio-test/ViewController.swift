//
//  ViewController.swift
//  Caffio-test
//
//  Created by Noah Halford on 8/4/14.
//  Copyright (c) 2014 Noah Halford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var viewControllers: NSArray!
    weak var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // computed from device width so the aspect ratio is correct
        let cardHeight: CGFloat = (self.view.bounds.width - 20)*37/38
        
        var rect = CGRectMake(0, 0, CGFloat(self.view.bounds.width)-20, cardHeight)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "LLLL d yyyy"
        
        let firstDate = dateFormatter.dateFromString("August 1 2014")
        let secondDate = dateFormatter.dateFromString("July 25 2014")
        let thirdDate = dateFormatter.dateFromString("July 2 2014")
        
        // create cards
        var firstCard = CardView(frame: rect, image: UIImage(named: "Before I die.jpg"), fullPhoto: false, category: "Music", title: "Before I die I want to see these men sing", subtitle: "Because I've literally heard nothing more beautiful", author: "Allana Rivera", authorPhoto: UIImage(named:"Allana Rivera.jpg"), date: firstDate)
        
        var secondCard = CardView(frame: rect, image: UIImage(named: "Donde esta.jpg"), fullPhoto: true, category: "Literature", title: "Donde, está, la biblioteca.", subtitle: "Me llamo T-Bone. La araña discoteca. The Book Project reviewed, part tres.", author: "Allana Rivera", authorPhoto: UIImage(named: "Allana Rivera.jpg"), date: secondDate)
        
        var thirdCard = CardView(frame: rect, image: UIImage(named: "Six word.jpg"), fullPhoto: true, category: "Writing", title: "A Six Word Story", subtitle: "(Not including this title.)", author: "Charlie Andrews", authorPhoto: UIImage(named: "Charlie Andrews.jpg"), date: thirdDate)
        
        // so that buttons work
        firstCard.userInteractionEnabled = false
        secondCard.userInteractionEnabled = false
        thirdCard.userInteractionEnabled = false
        
        var scrollView = UIScrollView()
        
        // 10 pixels padding everywhere
        var firstButton = UIButton(frame: CGRectMake(0, 10, self.view.bounds.width-20, cardHeight))
        firstButton.addSubview(firstCard)
        firstButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        var secondButton = UIButton(frame: CGRectMake(0, 20 + cardHeight, self.view.bounds.width-20, cardHeight))
        secondButton.addSubview(secondCard)
        secondButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        
        var thirdButton = UIButton(frame: CGRectMake(0, 30 + cardHeight*2, self.view.bounds.width-20, cardHeight))
        thirdButton.addSubview(thirdCard)
        thirdButton.addTarget(self, action: Selector("buttonPressed:"), forControlEvents: .TouchUpInside)
        scrollView.backgroundColor = .whiteColor()
        
        scrollView.addSubview(thirdButton)
        scrollView.addSubview(secondButton)
        scrollView.addSubview(firstButton)
        
        scrollView.contentInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
        scrollView.contentSize = CGSizeMake(self.view.bounds.width, 3*cardHeight + 20) // no horizontal scrolling
        
        var subviewRect = CGRectZero
        for view in scrollView.subviews {
            subviewRect = CGRectUnion(subviewRect, view.frame)
        }
        scrollView.contentSize = subviewRect.size
        
        // without this line, it starts at the wrong place because of padding
        scrollView.setContentOffset(CGPoint(x: 0, y: -10), animated: false)
        
        self.view = scrollView
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func buttonPressed(sender:UIButton!) {
        self.pageViewController.setViewControllers([viewControllers.objectAtIndex(2)], direction: .Forward, animated: true, completion: nil)
        
    }
    
    func dismissNavController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


