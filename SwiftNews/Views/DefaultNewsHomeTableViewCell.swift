//
//  DefaultNewsHomeTableViewCell.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-06.
//

import UIKit

class DefaultNewsHomeTableViewCell: UITableViewCell {

    // MARK: - Properties
     lazy var Title : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.font = CustomFont.Title
        Title.textColor = CustomColors.textColour
        Title.textAlignment = .justified
        Title.numberOfLines = 10
        Title.sizeToFit()
        return Title
         
     }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Mark : Setup cell contraints
    func setUpConstraints(){
        self.contentView.backgroundColor = CustomColors.appbackground

        contentView.addSubview(Title)
        NSLayoutConstraint.activate([
            Title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            Title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            Title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            Title.heightAnchor.constraint(equalToConstant: 100),
        ])
        
    }

}
