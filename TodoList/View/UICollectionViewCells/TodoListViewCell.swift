//
//  TodoListViewCell.swift
//  TodoList
//
//  Created by Den Seksan on 14/3/2565 BE.
//

import UIKit

class TodoListViewCell: UICollectionViewCell {

    static let identifier = "todoListViewCell"
    static let nib = UINib(nibName: "TodoListViewCell", bundle: nil)

    @IBOutlet weak var todoListTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Helper
    
    func configure(item: TodoModel) {
        todoListTitleLabel.text = item.name
    }
}
