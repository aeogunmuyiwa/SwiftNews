//
//  ArticleViewController.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit

class ArticleViewController: UIViewController {
 
    //Mark : Variables
    var datsource : Child?
    private var articleViewModel : ArticleViewModel?
    
    
    //Mark : View controller lifecyle method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
       
       //inject the the Article view model into the controller and parse in the datasource
        articleViewModel = ArticleViewModel(controller: self, datasource: datsource)
    }

}


