//
//  MyCell.swift
//  collectionView@
//
//  Created by Apple user on 22/11/21.
//

import UIKit
import SnapKit

class MyCell: UICollectionViewCell {
    
     var titelLabel = UILabel()
    var image1 = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       // titelLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image1)
        contentView.addSubview(titelLabel)
        image1.contentMode = .scaleAspectFill
        image1.clipsToBounds = true
        
        
        contentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        titelLabel.textAlignment = .center
        titelLabel.textColor = .white
        
        Con()
    }
    
    func Con() {
    titelLabel.snp.makeConstraints { make in
        make.top.equalTo(5)
        make.centerX.equalToSuperview()
        //make.leading.trailing.equalTo(10)
    }
        
        image1.snp.makeConstraints { make in
            make.top.equalTo(titelLabel.snp.bottom).offset(5)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
        
    
    }
    
    func set(model: Model) {
        titelLabel.text = model.title
        image1.image = model.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
