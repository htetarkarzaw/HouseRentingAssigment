//
//  HouseTableViewCell.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit
import SDWebImage

class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivHouse: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSqft: UILabel!
    @IBOutlet weak var lblNoBed: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnViewDetail: CardView!
    var delegate : HouseItemListDelegate?
    
    var house : HouseVO? {
        didSet{
            if let houseVo = house{
                let imgLink = houseVo.houseImageUrl ?? ""
                ivHouse.sd_setImage(with: URL(string: imgLink), placeholderImage: UIImage(named: "placeholder"))
                lblPrice.text = "$\(String(describing: houseVo.address ?? ""))"
                lblSqft.text = "\(String(describing: houseVo.squareFeet ?? 0)) sqft"
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        ivHouse.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        ivHouse.layer.cornerRadius = 5
        initGestureRecognizer()
    }
    
    func initGestureRecognizer(){
        let tagGesture = UITapGestureRecognizer(target: self, action: #selector(onClickDetail))
        btnViewDetail.isUserInteractionEnabled = true
        btnViewDetail.addGestureRecognizer(tagGesture)
    }
    
    @objc func onClickDetail(){
        delegate?.onClickDetail(data: house ?? HouseVO())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
