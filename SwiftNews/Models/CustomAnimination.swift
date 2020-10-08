//
//  CustomAnimination.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit

class CustomAnimination {
   
    func Fadeout(view : UIView , completion :@escaping() -> Void){
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 0.5
        }, completion: {result in
            UIView.animate(withDuration: 0.5, animations: {
                view.alpha = 1
                completion()
            })
        })
    }
    
    
    
}
extension UIView {
    
  
    func startLoadingtAnimating(){
         //spinner activity indicator
        let spinnerView = UIView()
        spinnerView.tag = 1000
        if #available(iOS 13.0, *) {
            let spinner = UIActivityIndicatorView(style: .large)
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.color = .black
           
            spinnerView.addSubview(spinner)
            self.addSubview(spinnerView)
            spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
            spinnerView.pin(to: self)
            spinner.startAnimating()
        } else {
            // Fallback on earlier versions
        }
       
    }
    func stopsLoadingtAnimating(){
        let spinnerView = self.viewWithTag(1000)
        spinnerView?.removeFromSuperview()
        
    }
}
