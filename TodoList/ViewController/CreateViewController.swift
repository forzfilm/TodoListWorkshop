//
//  CreateViewController.swift
//  TodoList
//
//  Created by Film Pattaravadee on 11/3/2565 BE.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!

    private var onSaved: (String) -> Void = { _ in }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - User Interaction

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        guard let text = todoTextField.text, !text.isEmpty else { return }
        onSaved(text)
        dismiss(animated: true)
    }

    // MARK: - Helper

    func configure(onSaved: @escaping (String) -> Void) {
        self.onSaved = onSaved
    }
}
