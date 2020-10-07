//
//  ArticleView.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit
import Kingfisher

class ArticleView: UIView {
    // MARK: - Properties
    private lazy var contentViewSize : CGFloat = 0
    var datasource : Child?
    var width : CGFloat  = 0
    private var labelCotentViewsize : CGFloat = 0
     private lazy var Title : UITextView = {
        let Title = UITextView()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.font = CustomFont.Title
        Title.backgroundColor = CustomColors.appbackground
        Title.textColor = .black
        Title.isSelectable = false
        Title.isEditable = false
        Title.textAlignment = .center
        Title.isScrollEnabled = false
        return Title
        
     }()
    private lazy var body : UITextView = {
       let body = UITextView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.textAlignment = .left
        body.backgroundColor = CustomColors.appbackground
        body.textColor = .black
        body.font = CustomFont.subTitle
        Title.isSelectable = false
        Title.isEditable = false
        Title.isScrollEnabled = false
        return body
    }()
    
    private lazy var Image : UIImageView = {
        let Image = UIImageView()
        Image.translatesAutoresizingMaskIntoConstraints = false
        Image.layer.masksToBounds = true
        Image.clipsToBounds = true
        return Image
         
     }()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
     }
   
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    func setUpConstraints(){
        self.addSubview(Title)
        self.addSubview(body)
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            Title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            Title.heightAnchor.constraint(equalToConstant: contentViewSize + 40 ),
            
            body.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 5),
            body.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            body.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            body.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    func setUpConstraintsWithImage(){
        self.addSubview(Title)
        self.addSubview(Image)
        self.addSubview(body)
       
        NSLayoutConstraint.activate([
            Image.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            Image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            Image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            Image.heightAnchor.constraint(equalToConstant: 300 ),
            
            Title.topAnchor.constraint(equalTo: Image.bottomAnchor, constant: 0),
            Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            Title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            Title.heightAnchor.constraint(equalToConstant: contentViewSize + 40),
            
            body.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 5),
            body.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            body.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            body.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
           // Title.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
    }
  
  
    
    //determain if the datasource has a thumbnail image base by its width and heigh
    func determineImagePreset(dataSource : Child){
        self.datasource = dataSource
        Title.text = datasource?.data?.title
        body.text = datasource?.data?.selftext
        
        contentViewSize = DyanmicLabel.init().height(constraintedWidth: width, font: CustomFont.Title, text:Title.text )
        if datasource?.data?.thumbnailHeight == nil && datasource?.data?.thumbnailHeight ==  nil {
            setUpConstraints()
        }else{
                setUpConstraintsWithImage()
                if let thumbnail = datasource?.data?.thumbnail , let imageUrl = URL(string: thumbnail){
                    DispatchQueue.main.async{ [weak self] in
                        self?.Image.kf.setImage(with: imageUrl, options: [.transition(.fade(0.2))])
                    }
                }
        }
        
    
       
    }
}
extension UIImage {


    /// Scales an image to fit within a bounds with a size governed by the passed size. Also keeps the aspect ratio.
    /// Switch MIN to MAX for aspect fill instead of fit.
    ///
    /// - parameter newSize: newSize the size of the bounds the image must fit within.
    ///
    /// - returns: a new scaled image.
    func scaleImageToSize(newSize: CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero

        let aspectWidth = newSize.width/size.width
        let aspectheight = newSize.height/size.height

        let aspectRatio = max(aspectWidth, aspectheight)

        scaledImageRect.size.width = size.width * aspectRatio;
        scaledImageRect.size.height = size.height * aspectRatio;
        scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0;
        scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0;

        UIGraphicsBeginImageContext(newSize)
        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return scaledImage!
    }
}

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
