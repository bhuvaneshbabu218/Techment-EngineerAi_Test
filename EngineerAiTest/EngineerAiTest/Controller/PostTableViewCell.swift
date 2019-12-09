//
//  PostTableViewCell.swift
//  EngineerAiTest
//
//  Created by Techment bhuvan on 09/12/19.
//  Copyright © 2019 Techment bhuvan. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configCell (post: PostModel){
        titleLabel.text = post.title
        createAtLabel.text = post.createdAt
    }

}
