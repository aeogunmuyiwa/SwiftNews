//
//  ArticleViewModel.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit
import Kingfisher
import Combine

class ArticleViewModel: NSObject {
    
    // MARK:   Outlets and Properties
    private weak var controller : UIViewController?
    private var datasource : Child?
    private lazy var articleView : ArticleView = {
        var articleView = ArticleView.init()
        articleView.translatesAutoresizingMaskIntoConstraints = false
        return articleView
    }()
    
    //MARK : - Initialization , injects the controller and the datasource
    init(controller : UIViewController, datasource : Child?) {

        self.controller = controller
        self.datasource = datasource
        super.init()
        
        self.articleView.backgroundColor = CustomColors.appbackground
        controller.view.addSubview(self.articleView)
        //self.articleView.draw(.init())
        articleView.pin(to: controller.view)
        
        
        //initialze view datasource :
        if let datasource = datasource{
            self.articleView.width = controller.view.frame.width
            controller.navigationItem.title = datasource.data?.title
            self.articleView.determineImagePreset(dataSource: datasource)
            
        }

    }
}
