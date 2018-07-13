//
//  AvatarCell.swift
//  smack-app
//
//  Created by Raul Ernesto Villarreal Sigala on 7/13/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
