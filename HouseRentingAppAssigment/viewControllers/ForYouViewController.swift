//
//  ViewController.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit

class ForYouViewController: BaseViewController {

    @IBOutlet weak var tvHouse: UITableView!
    
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getHouseList()
        tvHouse.dataSource = self
        tvHouse.delegate = self
        tvHouse.registerForCell(strID: String(describing: HouseTableViewCell.self))
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tvHouse.addSubview(refreshControl)
    }

    @objc func onRefresh(){
        getHouseList()
    }
    private func getHouseList(){
        self.showProgress(message: "Loading")
        HouseModel.shared().apiGetHouseList(success: {
            self.hideProgress()
            self.refreshControl.endRefreshing()
            self.tvHouse.reloadData()
        }) { (err) in
            self.refreshControl.endRefreshing()
            self.hideProgress()
            print(err)
        }
    }

}

extension ForYouViewController:UITableViewDelegate{
    
}

extension ForYouViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HouseModel.shared().houseResponse.data?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HouseTableViewCell.self), for: indexPath) as! HouseTableViewCell
        cell.house = HouseModel.shared().houseResponse.data?[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}


extension ForYouViewController: HouseItemListDelegate{
    func onClickDetail(data: HouseVO) {
        let stroyboard = UIStoryboard(name: AppConstants.StoryBoards.SB_Main, bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: String(describing: HouseDetailViewController.self)) as! HouseDetailViewController
        vc.house = data
        self.present(vc,animated: true,completion: nil)
    }
}
