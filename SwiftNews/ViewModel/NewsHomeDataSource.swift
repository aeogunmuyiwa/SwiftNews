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
            return count.count / 2
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let datasource = datasource,  let count = datasource.data?.children {
//            return count.count
//        }
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
        let cellType = DetermainCellType(index: indexPath.section)
        
        if cellType.0 == true{
            if let datasource = datasource , let data = datasource.data?.children {
                if let cell = tableView.dequeueReusableCell(withIdentifier: GlobalNewsHomeTableViewCellIdentifer, for: indexPath) as? NewsHomeTableViewCell{
                    cell.awakeFromNib()
                    cell.customInit(dataSource: data[indexPath.section], textHeight: cellType.1)
                    return cell
                }
            }
        }else{
            if let datasource = datasource , let data = datasource.data?.children {
                if let cell = tableView.dequeueReusableCell(withIdentifier: DefaultNewsHomeTableViewCelldentifer, for: indexPath) as? DefaultNewsHomeTableViewCell{
                    cell.Title.text = data[indexPath.section].data?.title
                    return cell
                }
            }
        }
        return UITableViewCell()
        
    }
    
    //Mark : check to determain if a cell has an image by looking at its image height and width and height
    func DetermainCellType(index : Int) -> (Bool, CGFloat){
        if let datasource = datasource , let data = datasource.data?.children,let text = data[index].data?.title {
            if data[index].data?.thumbnailWidth == nil && data[index].data?.thumbnailHeight == nil{
                let textHeight = DyanmicLabel.init().height(constraintedWidth: UIScreen.main.bounds.width, font: CustomFont.Title, text: text)
                return (false, textHeight + 20) // return calculated text height + padding
            }else{
                let textHeight = DyanmicLabel.init().height(constraintedWidth: UIScreen.main.bounds.width, font: CustomFont.Title, text: text)
                return (true, textHeight )
            }
        }
        return (false, 60) //return a set default height, worse case
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //calculate dynamic height
        let cellType =  DetermainCellType(index: indexPath.section)
        if cellType.0 == true{
            if let datasource = datasource , let data = datasource.data?.children , let height = data[indexPath.row].data?.thumbnailHeight{
                
                return cellType.1 + CGFloat(height) + 100
            }
            return 400
        }else{
            return cellType.1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tableView = tableView.cellForRow(at: indexPath){
            CustomAnimination.init().Fadeout(view: tableView, completion: { [weak self] in
                if let datasource = self?.datasource, let data = datasource.data?.children{
                    self?.ViewNavigation(withIdentifier: "ArticleViewController", datasource: data[indexPath.section])
                }
            })
        }
    }
    func ViewNavigation(withIdentifier : String , datasource : Child){
        DispatchQueue.main.async { [weak self] in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateVC(withIdentifier: withIdentifier)  as? ArticleViewController
            if let viewController = vc  {
                
                viewController.datsource = datasource
                viewController.modalPresentationStyle = .fullScreen
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.modalPresentationStyle = .fullScreen
                //self?.MainController?.navigationController?.show(navigationController, sender: self)
                self?.MainController?.navigationController?.present(navigationController, animated: true, completion: nil)
                
            }
        }
    }
    
    
    
    
}

