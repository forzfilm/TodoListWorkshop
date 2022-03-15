//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Film Pattaravadee on 11/3/2565 BE.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var viewModel = TodoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TodoListViewCell.nib, forCellWithReuseIdentifier: TodoListViewCell.identifier)
    }

    // MARK: - User Interaction

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        vc.configure(onSaved: { [weak self] name in
            self?.viewModel.inputs.addItem(todoModel: TodoModel(name: name, isChecked: false))
            self?.collectionView.reloadData()
        })
        present(vc, animated: true)
    }
}

extension TodoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.outputs.numberOfItem()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoListViewCell.identifier, for: indexPath) as! TodoListViewCell
        let item = viewModel.outputs.getItem(index: indexPath.row)
        cell.configure(item: item)
        return cell
    }
}

extension TodoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 54)
    }
}
