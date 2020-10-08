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
    
    private lazy var navBarTitleView : UILabel = {
       let title = UILabel()
        title.font = CustomFont.Title
        title.sizeToFit()
        return title
    }()
    
    //MARK : - Initialization , injects the controller and the datasource
    init(controller : UIViewController, datasource : Child?) {
        self.controller = controller
        self.datasource = datasource
        super.init()
        
        self.articleView.backgroundColor = CustomColors.appbackground
        controller.view.addSubview(self.articleView)
        articleView.pin(to: controller.view)

        //initialze view datasource and Set navbar title
        if let datasource = datasource{
            navBarTitleView.text = datasource.data?.title
            controller.navigationItem.titleView = navBarTitleView
            self.articleView.determineImagePreset(dataSource: datasource)
        }

    }
}
