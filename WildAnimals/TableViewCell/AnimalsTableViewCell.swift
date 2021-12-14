//
//  AnimalsTableViewCell.swift
//  WildAnimals
//
//  Created by Apple user on 23/11/21.
//

import UIKit

class AnimalsTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var infoLabel = UILabel()
    var animalImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(infoLabel)
        addSubview(animalImage)
        confi()
        Constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(animals: Animals) {
        titleLabel.text = animals.title
        infoLabel.text = animals.infotext
        animalImage.image = animals.image
    }
    
    func confi(){
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont.systemFont(ofSize: 15)
        
        animalImage.contentMode = .scaleAspectFill
        animalImage.clipsToBounds = true
    }
    
    func Constraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        animalImage.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(animalImage.snp.width).multipliedBy(0.8)
            make.bottom.equalTo(-15)
        }
    }
    
}
