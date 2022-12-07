//
//  ReelsTableViewCell.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/29.
//

import UIKit
import SnapKit
import AVKit

class ReelsTableViewCell: UITableViewCell {
    var videoView: VideoPlayerView?
//    override init(frame: CGRect){
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    public func setupURL(_ urlStr: String){
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr )

        setupAttribute()
        setupLayout()
    }
    private func setupAttribute(){

    }
    private func setupLayout(){
        guard let videoView = videoView else {return}
        contentView.addSubview(videoView)
    videoView.snp.makeConstraints{ make in make.edges.equalToSuperview()}
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left:0, bottom: 2, right: 0))
    }
}
