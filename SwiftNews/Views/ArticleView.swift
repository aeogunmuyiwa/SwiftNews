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
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.bounces = true
        return scrollView
    }()
    private lazy var body : UITextView = {
       let body = UITextView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.textAlignment = .center
        body.backgroundColor = CustomColors.appbackground
        body.textColor = .black
        body.font = CustomFont.subTitle
        body.isSelectable = false
        body.isEditable = false
        body.isScrollEnabled = false
        return body
    }()
    
    private lazy var Image : UIImageView = {
        let Image = UIImageView()
        Image.translatesAutoresizingMaskIntoConstraints = false
        Image.contentMode = .scaleAspectFit
        return Image
         
     }()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
     }
   
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    func setUpConstraints(){
        scrollView.addSubview(body)
        NSLayoutConstraint.activate([
            
       
            body.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            body.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            body.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            body.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
    
    func setUpConstraintsWithImage(height : CGFloat){
        scrollView.addSubview(body)
        scrollView.addSubview(Image)
        //self.addSubview(body)
       
        NSLayoutConstraint.activate([
            Image.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            Image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            Image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            Image.heightAnchor.constraint(equalToConstant: height ),
            
            
            body.topAnchor.constraint(equalTo: Image.bottomAnchor, constant: 5),
            body.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            body.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            body.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
  
  
    
    //determain if the datasource has a thumbnail image base by its width and heigh
    func determineImagePreset(dataSource : Child){
        self.addSubview(scrollView)
        scrollView.pin(to: self)
        self.datasource = dataSource
        body.text = datasource?.data?.selftext

        if datasource?.data?.thumbnailHeight == nil && datasource?.data?.thumbnailWidth ==  nil {
            setUpConstraints()
        }else{
            if  let Imageheight = datasource?.data?.thumbnailHeight{
                setUpConstraintsWithImage(height : CGFloat(Imageheight) )
            }
            
            if let thumbnail = datasource?.data?.thumbnail , let imageUrl = URL(string: thumbnail){
                DispatchQueue.main.async{ [weak self] in
                    self?.Image.kf.setImage(with: imageUrl, options: [.transition(.fade(0.2))])
                }
            }
        }
    }
}


