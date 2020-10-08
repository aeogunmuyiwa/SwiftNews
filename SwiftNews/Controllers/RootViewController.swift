//
//  RootViewController.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-07.
//

import UIKit

class RootViewController: UISplitViewController , UISplitViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    

    // to show table view when first lauched
//
//    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
//        guard let NavigationController = secondaryViewController as? UINavigationController else { return false }
//        
//        guard let topAsDetailController = NavigationController.topViewController as? ArticleViewController else { return false }
//        if topAsDetailController.datsource == nil {
//            // Return true to show table view when first lauched
//            // meaning no item is selected
//            return false
//        }
//        return true
//    }
}



