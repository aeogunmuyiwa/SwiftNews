//
//  NewsHomeCollectionViewCell.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit
import Kingfisher

class NewsHomeTableViewCell: UITableViewCell {
    // MARK: - Properties
    private var Title : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.font = CustomFont.Title
        //Title.backgroundColor = CustomColors.textBackgroundColor
        Title.textAlignment = .left
        Title.numberOfLines = 10
        Title.sizeToFit()
        Title.textColor = CustomColors.textColour
         return Title
         
     }()
   
    private var Image : UIImageView = {
        let Image = UIImageView()
        Image.translatesAutoresizingMaskIntoConstraints = false
       // Image.layer.masksToBounds = true
       // Image.clipsToBounds = true
        Image.contentMode = .scaleAspectFit
         return Image
         
     }()

    // Mark : Initialization code
     override func awakeFromNib() {
         super.awakeFromNib()
        setUpConstraints()
        self.contentView.backgroundColor = CustomColors.appbackground
     }
    
    //Mark : Set cell properties from datasource
    func customInit(dataSource : Child, textHeight : CGFloat){
         awakeFromNib()
         DispatchQueue.main.async { [weak self] in
            self?.Title.text = dataSource.data?.title
            if let thumbnail = dataSource.data?.thumbnail {
                self?.loadImage(url: thumbnail)
            }
         }
        
     }

    
    /*Mark : Download image from an address and set the imageview image.
     using kingfisher we have set up cache memeory by default, Images are only retrieved once and then retrived from cache.
    */
    func loadImage(url : String ){
        let url = URL(string: url)
        Image.kf.setImage(with: url, options: [.transition(.fade(0.2))  ,.cacheOriginalImage])
    }
    
    
    //Mark : Setup cell contraints
    func setUpConstraints() {
        contentView.addSubview(Title)
        contentView.addSubview(Image)
        
         NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            Title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            Title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
      
            Image.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 10),
            Image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            Image.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
         ])
     }
    

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }
}
