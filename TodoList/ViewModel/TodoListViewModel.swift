//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Film Pattaravadee on 11/3/2565 BE.
//

import Foundation

protocol TodoListViewModelInputs {
    func addItem(todoModel: TodoModel)
    func checkOrUncheck(at index: Int)
}

protocol TodoListViewModelOutputs {
    func numberOfItem() -> Int
    func getItem(index: Int) -> TodoModel
}

class TodoListViewModel {
    var inputs: TodoListViewModelInputs { return self }
    var outputs: TodoListViewModelOutputs { return self }

    private var itemList: [TodoModel] = [TodoModel]()
}

extension TodoListViewModel: TodoListViewModelInputs {

    func addItem(todoModel: TodoModel) {
        itemList.append(todoModel)
    }

    func checkOrUncheck(at index: Int) {
        itemList[index].isChecked.toggle()
    }
}

extension TodoListViewModel: TodoListViewModelOutputs {

    func numberOfItem() -> Int {
        return itemList.count
    }

    func getItem(index: Int) -> TodoModel {
        return itemList[index]
    }
}
