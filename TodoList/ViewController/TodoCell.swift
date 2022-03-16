//
//  TodoCell.swift
//  TodoList
//
//  Created by Bank Thanakorn on 16/3/2565 BE.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var checkBoxLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: TodoModel) {
        nameLabel.text = model.name
        checkBoxLabel.text = model.isChecked ? "✅" : "☑️"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
