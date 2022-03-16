//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Film Pattaravadee on 11/3/2565 BE.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    let viewModel = TodoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - User Interaction

    @IBAction func addButtonClicked(_ sender: UIButton) {
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        vc.configure(onSaved: { [weak self] name in
            let model = TodoModel(name: name, isChecked: false)
            self?.viewModel.inputs.addItem(todoModel: model)

            self?.tableView.reloadData()
        })
        present(vc, animated: true)
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.inputs.checkOrUncheck(at: indexPath.row)

        tableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.outputs.numberOfItem()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as! TodoCell
        let model = viewModel.outputs.getItem(index: indexPath.row)

        cell.configure(model: model)

        return cell
    }


}
