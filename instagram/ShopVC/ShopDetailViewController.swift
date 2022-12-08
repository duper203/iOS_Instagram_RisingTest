//
//  ShopDetailViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/12/08.
//

import Foundation
import UIKit
import SnapKit

class ShopDetailViewController: UIViewController{

    //DataManager
    lazy var dataManager: ShopDetailDataManager = ShopDetailDataManager()
    var shopDetailData: ShopDetailResult = ShopDetailResult()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var dismiss: UIBarButtonItem!
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        let priceString = shopDetailData.price!
        price.text = "₩ \(String(describing: priceString))"
        
        let nameString = shopDetailData.name!
        name.text = "\(String(describing: nameString))"
        
        let urlString = shopDetailData.url!
        let url = URL(string: urlString)
        imageView.kf.setImage(with: url)

    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        dataManager.ShopDetailItem(vc: self, shopIndex: shopIndex!)
        navigationController?.isNavigationBarHidden = true
        
        

    }
}
extension ShopDetailViewController{
    func SuccessShopDetail(_ result: ShopDetailResponse) {
        print("shop 디테일 화면 정보 가져오기 성공!\(result.message!)")
        
        print(result.result)
        shopDetailData = result.result
        
    }
    
    func failedToShopDetail(message: String) {
        print("\(message)")
    }
}

