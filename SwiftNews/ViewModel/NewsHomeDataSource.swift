//
//  NewsHomeDataSource.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit

class NewsHomeDataSource: NSObject {
    // MARK:  Variables
    private weak var MainController : UIViewController?
    internal var datasource: NewsHomeDataModel?
    
    init(controller: UIViewController , datasource : NewsHomeDataModel?){
        self.MainController = controller
        self.datasource = datasource
    }
    
}

//Mark : TableView datasource and delegates
extension NewsHomeDataSource : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let datasource = datasource,  let count = datasource.data?.children {
            return count.count  
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    /*DetermainCellType returns true if the datasource has an image
     use NewsHomeTableViewCell if the datasource has an image  else use
     DefaultNewsHomeTableViewCell if the datasource does not have an image
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: DefaultNewsHomeTableViewCelldentifer, for: indexPath) as! DefaultNewsHomeTableViewCell
        cell.awakeFromNib()
            if let datasource = datasource , let data = datasource.data?.children {
                
                cell.setUpData(dataSource: data[indexPath.section])
            }
           return cell
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tableView = tableView.cellForRow(at: indexPath){
            CustomAnimination.init().Fadeout(view: tableView, completion: { [weak self] in
                if let datasource = self?.datasource, let data = datasource.data?.children{
                    self?.ViewNavigation(withIdentifier: "ArticleViewNavigation", datasource: data[indexPath.section])
                }
            })
        }
    }
    
    // UITableViewAutomaticDimension calculates height of label contents/text
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let datasource = datasource?.data?.children , let data = datasource[indexPath.section].data, let text = data.title {
            let height =   DyanmicLabel.init().height(constraintedWidth:UIScreen.main.bounds.width , font: CustomFont.Title, text: text)
            
            //Image avaiable
            if  let ImageHeight = data.thumbnailHeight{
                return  CGFloat(ImageHeight) + height + 60
            }
            
            return height + 30
        }
        return UITableView.automaticDimension
    }

    
    func ViewNavigation(withIdentifier : String , datasource : Child){
        DispatchQueue.main.async { [weak self] in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateVC(withIdentifier: withIdentifier)  as? UINavigationController
            if let viewController = vc  {
                if let articleVC = viewController.topViewController as? ArticleViewController{
                    articleVC.datsource = datasource
                    self?.MainController?.show(viewController, sender: self)
                }
                
                
            }
        }
    }
    
    
    
    
}

