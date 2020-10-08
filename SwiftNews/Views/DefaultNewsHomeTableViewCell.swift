//
//  DefaultNewsHomeTableViewCell.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-06.
//

import UIKit

class DefaultNewsHomeTableViewCell: UITableViewCell {
    var dataSource : Child?
    // MARK: - Properties
     lazy var Title : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.font = CustomFont.Title
        Title.textColor = CustomColors.textColour
        Title.textAlignment = .left
        Title.numberOfLines = 10
        //Title.sizeToFit()
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

    override func awakeFromNib() {
        super.awakeFromNib()
        basicContaints()
        // Initialization code
    }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Mark : Setup cell contraints
    func basicContaints(){
        self.contentView.backgroundColor = CustomColors.appbackground
        contentView.addSubview(Title)
        contentView.addSubview(Image)
        Image.isHidden = true
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            Title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            Title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            Image.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 10),
            Image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            Image.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
       
    }
    
    /*Mark : Download image from an address and set the imageview image.
     using kingfisher we have set up cache memeory by default, Images are only retrieved once and then retrived from cache.
    */
    func loadImage(url : String ){
        let url = URL(string: url)
        Image.kf.setImage(with: url, options: [.transition(.fade(0.2))  ,.cacheOriginalImage])
    }
    
    func setUpData(dataSource : Child){
           Title.text = dataSource.data?.title
        
        if let data = dataSource.data, let _ = data.thumbnailHeight, let _ = data.thumbnailWidth , let ImageUrl = data.thumbnail{
            Image.isHidden = false
            self.loadImage(url: ImageUrl)
        }else{
            Image.isHidden = true
        }
              
    }

}
