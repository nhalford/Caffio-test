//
//  AppDelegate.swift
//  Caffio-test
//
//  Created by Noah Halford on 8/4/14.
//  Copyright (c) 2014 Noah Halford. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIPageViewControllerDataSource {
                            
    var window: UIWindow?
    var pageViewController: UIPageViewController!
    var viewControllers: NSArray!

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        
        if let window = self.window {
            let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
            
            let yellowView = UIScrollView(frame: window.frame)
            yellowView.backgroundColor = .yellowColor()
            let yellowViewController = UIViewController()
            yellowViewController.view = yellowView
            
            let redView = UIScrollView(frame: window.frame)
            redView.backgroundColor = .redColor()
            let redViewController = UIViewController()
            redViewController.view = redView
           
            let mainViewController = ViewController()
            
            viewControllers = [yellowViewController, mainViewController, redViewController]
            mainViewController.viewControllers = viewControllers
            mainViewController.pageViewController = pageViewController
            
            pageViewController.dataSource = self
            
            pageViewController.setViewControllers([mainViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
            
            let menuBarView = UIView(frame: CGRect(x: 0, y: 0, width: window.frame.width, height: 20))
            menuBarView.backgroundColor = .whiteColor()
            pageViewController.view.addSubview(menuBarView)

            window.rootViewController = pageViewController
            window.setNeedsDisplay()
        }
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {
        var i = viewControllers.indexOfObject(viewController)
        if (i < viewControllers.count - 1) {
            return viewControllers.objectAtIndex(i+1) as UIViewController!
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController! {
        var i = viewControllers.indexOfObject(viewController)
        if (i > 0) {
            return viewControllers.objectAtIndex(i-1) as UIViewController!
        }
        return nil
    }
 
    
}

