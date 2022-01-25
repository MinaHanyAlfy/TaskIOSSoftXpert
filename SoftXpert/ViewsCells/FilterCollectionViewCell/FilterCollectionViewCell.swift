//
//  FilterCollectionViewCell.swift
//  SoftXpert
//
//  Created by John Doe on 2022-01-25.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.clipsToBounds = false
        mainView.layer.cornerRadius = 16
//        mainView.backgroundColor = .cyan
    }
    
    

}
