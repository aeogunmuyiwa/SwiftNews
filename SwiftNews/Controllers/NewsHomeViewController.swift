//
//  ViewController.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit


class NewsHomeViewController: UIViewController {

    // MARK: - Properties
    private  var refreshControl : UIRefreshControl?
    
    private lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = true
        tableView.separatorColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor.black
        tableView.register(DefaultNewsHomeTableViewCell.self, forCellReuseIdentifier: DefaultNewsHomeTableViewCelldentifer)
        return tableView
    }()
    
    //Mark : View Model
    private lazy var tableViewObject: NewsHomeDataSource = {
        var tableViewObject  = NewsHomeDataSource.init(controller: self, datasource: nil)
        return tableViewObject
    }()
    
    
    //Mark : View controller lifecyle method
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    //Mark : Initialze datasouce, tableview needs to connect with ViewMdoel
    @objc internal func refreshDataSource(_ sender: Any) {
        // Fetch Weather Data
        setDataSource(ViewController: self)
    }

    private func setDataSource(ViewController : UIViewController){
    
        apiManager.init(controller: ViewController).makeReqeust(apiKey: NewsListApiKey, objectType: NewsHomeDataModel.self, completionHandler: {[weak self] result in
            if let result  = result as? NewsHomeDataModel{
                self?.tableViewObject.datasource = result
                self?.tableView.dataSource = self?.tableViewObject
                self?.tableView.delegate = self?.tableViewObject
                self?.tableView.reloadData()
                self?.refreshControl?.endRefreshing()
            }
            
        }, errorHandler: { [weak self] error in
            switch error {
                case .cancel:
                    self?.refreshControl?.endRefreshing()
                   
            case .retry :
                self?.refreshDataSource(self)
            }
        
        })
       
    }
    
    //Initalize tableview and monitor network Connection
    func initTableView(){
        view.addSubview(tableView)
        tableView.pin(to: view)
        refreshControl = UIRefreshControl()
        if let refreshControl = refreshControl {
            
            refreshControl.backgroundColor = UIColor.clear
            refreshControl.tintColor = UIColor.clear
            self.tableView.addSubview(refreshControl)
            self.refreshControl?.addTarget(self, action: #selector(refreshDataSource(_:)), for: .valueChanged)
        }
      
        // Set automatic dimensions for row height
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        
        //Listen to network status and setdatasoruce if network is reachable
        Network.init(viewController: self).startMonitoring(reachableHandler: {
            self.setDataSource(ViewController: self)
        }, unreachableHandler: {
        })
    }

}






