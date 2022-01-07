//
//  myPageViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2022-01-07.
//

import UIKit

class myPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
                setViewControllers([firstViewController],
                    direction: .forward,
                    animated: true,
                    completion: nil)
            }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "Green"),
                self.newColoredViewController(color: "Red"),
            self.newColoredViewController(color: "Blue")]
    }()

    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
        instantiateViewController(withIdentifier: "\(color)ViewController")
    }
 
}

// MARK: UIPageViewControllerDataSource

extension myPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil}
                
                let previousIndex = viewControllerIndex - 1
                
                guard previousIndex >= 0 else {
                    return orderedViewControllers.last
                }
                
                guard orderedViewControllers.count > previousIndex else {
                    return nil
                }
                
                return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                   return nil
               }
               
               let nextIndex = viewControllerIndex + 1
               let orderedViewControllersCount = orderedViewControllers.count

               guard orderedViewControllersCount != nextIndex else {
                   return orderedViewControllers.first
               }
               
               guard orderedViewControllersCount > nextIndex else {
                   return nil
               }
               
               return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        orderedViewControllers.count
    }
   
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
                let firstViewControllerIndex = orderedViewControllers.firstIndex(of: firstViewController) else {
                   return 0
           }
           
           return firstViewControllerIndex
    }
    
    
}
