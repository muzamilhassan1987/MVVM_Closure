//
//  ProductCell.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 25/01/2021.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var viewShadow: UIView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblName: UILabel!
    var product: Product! {
        didSet {
            lblPrice.text = String(product.price)
            lblDescription.text = product.description
            lblName.text = product.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewShadow.layer.shadowColor = UIColor.lightGray.cgColor
        viewShadow.layer.shadowOpacity = 1
        viewShadow.layer.shadowOffset = .zero
        viewShadow.layer.shadowRadius = 3
        viewShadow.layer.cornerRadius = 5;
        //viewShadow.layer.masksToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
