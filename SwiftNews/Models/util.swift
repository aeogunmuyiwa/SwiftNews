//
//  util.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit

     var GlobalNewsHomeTableViewCellIdentifer = "GloablNewsHomeTableViewCellIdentifer"
     var DefaultNewsHomeTableViewCelldentifer = "DefaultNewsHomeTableViewCelldentifer"


extension UIStoryboard {
    /* check if an identifier exist in the storyboard*/
    func instantiateVC(withIdentifier identifier: String) -> UIViewController? {
        // "identifierToNibNameMap" – dont change it. It is a key for searching IDs
        if let identifiersList = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
           
            if identifiersList[identifier] != nil {
                    return self.instantiateViewController(withIdentifier: identifier)
            }
        }
        return nil
    }
}

extension UIView {
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
}
