//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Film Pattaravadee on 11/3/2565 BE.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!

    let viewModel = TodoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TodoCell", bundle: nil), forCellReuseIdentifier: "TodoCell")
    }

    // MARK: - User Interaction

    @IBAction func addButtonClicked(_ sender: UIButton) {
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        vc.configure { [weak self] desc in
            self?.viewModel.inputs.addItem(todoModel: TodoModel(name: desc, isChecked: false))
            self?.tableView.reloadData()
        }
        present(vc, animated: true)
    }

}

extension TodoListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.inputs.updateItem(index: indexPath.row)
        tableView.reloadData()
    }

}

extension TodoListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.outputs.numberOfItem()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        cell.configure(data: viewModel.outputs.getItem(index: indexPath.row))
        cell.selectionStyle = .none
        return cell
    }

}
