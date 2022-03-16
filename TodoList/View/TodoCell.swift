//
//  TodoCell.swift
//  TodoList
//
//  Created by Sattra on 3/15/22.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var checkedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Helper

    func configure(data: TodoModel) {
        descLabel?.text = data.name
        checkedImage?.isHidden = !data.isChecked
    }
    
}
