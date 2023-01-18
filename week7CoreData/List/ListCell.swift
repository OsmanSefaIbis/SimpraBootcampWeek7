//
//  ListCell.swift
//  week7CoreData
//
//  Created by Sefa İbiş on 17.01.2023.
//

import UIKit
import Kingfisher

class ListCell: UITableViewCell {
    
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet private weak var nameTitleLabel: UILabel!
    @IBOutlet private weak var nameValueLabel: UILabel!
    @IBOutlet private weak var genderTitleLabel: UILabel!
    @IBOutlet private weak var genderValueLabel: UILabel!
    @IBOutlet private weak var statusTitleLabel: UILabel!
    @IBOutlet private weak var statusValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model : ListCellModel){
        contentImageView.kf.setImage(with: URL.init(string: model.imageUrl))
        nameValueLabel.text = model.name
        genderValueLabel.text = model.gender
        statusValueLabel.text = model.status
    }

}

private extension ListCell{
    private func setupUI(){
        nameTitleLabel.text = "Name"
        genderTitleLabel.text = "Gender"
        statusTitleLabel.text = "Status"
    }
}

struct ListCellModel{
    let imageUrl: String
    let name: String
    let status: String
    let gender: String
}
