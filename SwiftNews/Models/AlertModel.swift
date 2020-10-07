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
    case networkAlert
}
enum errorType {
    case retry
    case cancel
}
class AlertModel: NSObject {
    //Mark : Variable
    private var alert : UIAlertController
    
    override init() {
        alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
    }
    
    //Mark : Dimiss alert
    func stopPresenting(){
        alert.dismiss(animated: true, completion: nil)
    }
    
    //Mark : Present alert on view
    func presentAlert(contoller : UIViewController?, message : String, title : String, alertType :  AlertType , completionHandler : @escaping(errorType) -> Void){
        alert.message = message
        alert.title = title
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
            
        case .networkAlert :
            print("")
        }
        if let Maincontroller = contoller    {
            DispatchQueue.main.async {
                Maincontroller.present(self.alert, animated: true)
            }
            
        }
        
    }
}

