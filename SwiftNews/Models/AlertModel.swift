//
//  AlertModel.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit
enum AlertType {
    case confirmation
    case error
}
enum errorType {
    case retry
    case cancel
}
class AlertModel: NSObject {
 
    func presentAlert(contoller : UIViewController?, message : String, title : String, alertType :  AlertType , completionHandler : @escaping(errorType) -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        switch alertType {
            case .confirmation:
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            case.error :
                alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: {_ in
                    completionHandler(.retry)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in 
                    completionHandler(.cancel)
                }))
            
        }

      

        if let Maincontroller = contoller {
            Maincontroller.present(alert, animated: true)
        }
        
    }
}

