//
//  StoryTableViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/28.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    //(1) tableviewcell안에 collectionview 연결
    @IBOutlet weak var collectionView: UICollectionView!
    
    //(2) 이 함수를 HomeViewController에 갔다 쓸 계획
    func setCollectionView(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int){
        collectionView.dataSource = dataSourceDelegate
        collectionView.delegate = dataSourceDelegate
        collectionView.tag = row
        
        //(7)collectionviewcell 만든것 등록
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        
        //(8)collectionviewcell 레이아웃 가로 스크롤
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowlayout.minimumLineSpacing = 12
        collectionView.collectionViewLayout = flowlayout
        
        
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
