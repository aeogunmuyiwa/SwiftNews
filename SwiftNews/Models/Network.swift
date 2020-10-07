//
//  Socket.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-07.
//

import UIKit
import Alamofire


class Network {
    //Mark : Variable
    private var reachability: NetworkReachabilityManager?
    private  var viewController : UIViewController?
    init(viewController : UIViewController) {
        self.viewController = viewController
        reachability = NetworkReachabilityManager.default
    }
    
    //Mark : monitors the device networ connection for reachability, send callbacks depending on the status
    func startMonitoring(reachableHandler : @escaping() ->Void, unreachableHandler : @escaping() ->Void){
        let alert =  AlertModel.init()
        reachability?.startListening( onUpdatePerforming: { status in
            switch status {
                case .notReachable :
                    // Show error alert if change in network status
                    DispatchQueue.main.async { [weak self] in
                        alert.presentAlert(contoller: self?.viewController, message: "Error connecting to network. Check internet setting", title: "Network error", alertType: .networkAlert, completionHandler: { errorType in
                        })
                    }
            
                case .reachable(.cellular):
                    alert.stopPresenting()
                    reachableHandler()
                    
                case .reachable(.ethernetOrWiFi):
                    alert.stopPresenting()
                    reachableHandler()
                    
                case .unknown:
                    DispatchQueue.main.async {[weak self] in
                        AlertModel.init().presentAlert(contoller: self?.viewController, message: "Error connecting to network. Check internet setting", title: "Network error", alertType: .confirmation, completionHandler: {_ in
                            unreachableHandler()
                            
                        })
                    }
            }
        })
    }

}
