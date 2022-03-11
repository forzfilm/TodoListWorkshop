//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Film Pattaravadee on 11/3/2565 BE.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - User Interaction

    @IBAction func addButtonClicked(_ sender: UIButton) {
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        present(vc, animated: true)
    }

}
