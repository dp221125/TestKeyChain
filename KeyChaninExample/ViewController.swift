//
//  ViewController.swift
//  MKWrapper
//
//  Created by Seokho on 2020/01/11.
//  Copyright © 2020 Seokho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        self.view = view
        
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let saveButton = makeButton(stackView, "Save Item")
        saveButton.addTarget(self, action: #selector(saveID), for: .touchUpInside)
        
        let getButton = makeButton(stackView, "Print Item")
        getButton.addTarget(self, action: #selector(getID), for: .touchUpInside)
        
        let deleteButton = makeButton(stackView, "Delete Item")
        deleteButton.addTarget(self, action: #selector(deleteID), for: .touchUpInside)
    }
    
    func makeButton(_ stackView: UIStackView, _ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.label, for: .normal)
        stackView.addArrangedSubview(button)
        return button
    }
    
    @objc
    func saveID() {
        let int: Int = 1111
        let data = Data(from: int)
        KeyChain.save(key: "TestNumber", data: data)
        print("Complete")
    }
    
    @objc
    func getID() {
        if let receivedData = KeyChain.load(key: "TestNumber") {
            let result = receivedData.to(type: Int.self)
            print("result: ", result)
        }
    }
    
    @objc
    func deleteID() {
        KeyChain.remove(key: "TestNumber")
        print("Delete")
    }
}

