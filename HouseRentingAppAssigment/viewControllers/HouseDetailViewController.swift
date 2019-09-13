//
//  HouseDetailViewController.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblsqft: UILabel!
    @IBOutlet weak var lblFavourite: UILabel!
    @IBOutlet weak var lblBedroom: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var ivHouse: UIImageView!
    @IBOutlet weak var lblHouseTitle: UILabel!
    @IBOutlet weak var lblHouseDescription: UILabel!
    
    var house : HouseVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgLink = house?.houseImageUrl ?? ""
        ivHouse.sd_setImage(with: URL(string: imgLink), placeholderImage: UIImage(named: "placeholder"))
        lblPrice.text = "$\(String(describing: house?.address ?? ""))"
        lblsqft.text = "\(String(describing: house?.squareFeet ?? "")) sqft"
        lblHouseTitle.text = house?.name ?? "Single Family House"
        lblHouseDescription.text = house?.description ?? "Summer has come and passed The innocent can never last Wake me up when September ends  Like my fathers come to pass Seven years has gone so fast Wake me up when September ends Here comes the rain again Falling from the stars Drenched in my pain again Becoming who we are As my memory rests But never forgets what I lost Wake me up when September ends Summer has come and passed The innocent can never last Wake me up when September ends  Ring out the bells again Like we did when spring began Wake me up when September ends Here comes the rain again Falling from the stars Drenched in my pain again Becoming who we are As my memory rests But never forgets what I lost Wake me up when September ends Summer has come and passed The innocent can never last Wake me up when September ends Like my father's come to pass Twenty years has gone so fast Wake me up when September ends  Wake me up when September ends Wake me up when September ends"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
