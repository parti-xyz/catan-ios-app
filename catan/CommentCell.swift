//
//  CommentCell.swift
//  catan
//
//  Created by Youngmin Kim on 2017. 11. 6..
//  Copyright © 2017년 Parti. All rights reserved.
//

import LBTAComponents

class CommentCell: DatasourceCell {
    static let heightCache = HeightCache()
    
    override var datasourceItem: Any? {
        didSet {
            guard let comment = datasourceItem as? Comment else { return }
            
            commentView.comment = comment
        }
    }
    
    override weak var controller: DatasourceController? {
        didSet {
            commentView.delegate = controller as? CommentViewDelegate
        }
    }
    
    let commentView: CommentView = {
        let view = CommentView()
        return view
    }()
    
    override func setupViews() {
        addSubview(commentView)
        commentView.forceWidth = frame.width
        commentView.fillSuperview()
    }
    
    static func height(_ comment: Comment, frame: CGRect) -> CGFloat {
        if let cached = heightCache.height(for: comment, onWidth: frame.width) {
            return cached
        }
        
        let result = CommentView.estimateHeight(comment: comment, width: frame.width)
        
        heightCache.setHeight(result, for: comment, onWidth: frame.width)
        return result
    }
}
