//
//  util.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit

var DefaultNewsHomeTableViewCelldentifer = "DefaultNewsHomeTableViewCelldentifer"


class DyanmicLabel {
    func height(constraintedWidth width: CGFloat, font: UIFont, text : String) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = text
        label.font = font
        label.sizeToFit()

        return label.frame.height
     }
    
}
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
