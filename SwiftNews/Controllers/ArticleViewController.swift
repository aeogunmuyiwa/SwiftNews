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
    
    //Mark : Outlets and Properties
    private lazy var backButton : UIBarButtonItem  = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(swipBackView), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let backButton = UIBarButtonItem(customView: button)
        return backButton
     }()
    
    
    //Mark : View controller lifecyle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        navigationController?.navigationBar.tintColor = .black
       //inject the the Article view model into the controller and parse in the datasource
        articleViewModel = ArticleViewModel(controller: self, datasource: datsource)
    }
    
    // Mark : Action for backButton, dismisses the view controller
     @objc private func swipBackView (){
        self.dismiss(animated: true, completion: nil)
    }
  
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


