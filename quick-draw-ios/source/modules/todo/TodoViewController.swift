//
//  TodoViewController.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import UIKit

class TodoViewController: UIViewController {

    // MARK: - Variables
    var presenter: TodoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }

}

// MARK : - Todo View Protocol
extension TodoViewController: TodoViewProtocol {
    
}
