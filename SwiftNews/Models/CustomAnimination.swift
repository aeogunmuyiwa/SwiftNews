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
    
    
    func startAnimating(){
        
    }
}
extension UIView {
    
   func startLoadingtAnimating(){
         //spinner activity indicator
         var spinnerView = UIView()
    spinnerView.tag = 1000
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .red
       
        spinnerView.addSubview(spinner)
        self.addSubview(spinnerView)
        spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
        spinnerView.pin(to: self)
    spinner.startAnimating()
    }
    func stopsLoadingtAnimating(){
        let spinnerView = self.viewWithTag(1000)
        spinnerView?.removeFromSuperview()
        
    }
}
class spinnerAnimation {
    //Mark : Variable
    private var spinnerView = UIView() // Spinner view container
    private var spinner = UIActivityIndicatorView(style: .large) //spinner activity indicator
    private var superView : UIView?
    init(superView : UIView) {
        self.superView = superView
        
    }
 
        func startActivityIndicator (){
            spinnerView.backgroundColor = .lightGray
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.color = .red
           
            spinnerView.addSubview(spinner)
            spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
            
            DispatchQueue.main.async { [self] in
                self.spinner.startAnimating()
                if  let superView = self.superView{
                    superView.addSubview(spinnerView)
                    superView.bringSubviewToFront(spinnerView)
                    spinnerView.translatesAutoresizingMaskIntoConstraints = false
                    spinnerView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
                    spinnerView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
                }
               
                
            }
        
        }
    func stopAnimating(){
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
            self.spinnerView.removeFromSuperview()
        
      
    }
    
    
}
