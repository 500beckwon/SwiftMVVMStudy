//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by ByungHoon Ann on 2019/12/11.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//
//MARK:- 출처: https://www.youtube.com/watch?v=Razy8HjxK7I
import UIKit
import TinyConstraints

class ViewController: UIViewController {
    
    var viewModel : RootViewModel! {
        didSet {
            view.backgroundColor = viewModel.user.backGroundColor
            navigationItem.title = viewModel.user.name
        }
    }
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Tap 'Fecth' to retreive the message"
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = .gray
        view.style = .medium
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigation()
        setupViews()
        
        let user = User(name: "Ann", age: 27, backGroundColor: .systemPink)
        viewModel = RootViewModel(user: user)
        
        viewModel.rootViewModelDelegate = self
    }
    
    fileprivate func setupNavigation() {
        
        let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonItem(_:)))
        let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(fetchBarButtonItem(_:)))
        
        navigationItem.setLeftBarButton(resetBarButtonItem, animated: true)
        navigationItem.setRightBarButton(fetchBarButtonItem, animated: true)
    }
    
    @objc fileprivate func resetBarButtonItem(_ sender: UIBarButtonItem) {
        label.text = "Tap 'Fetch' to retreive the message"
    }
    
    @objc fileprivate func fetchBarButtonItem(_ sender: UIBarButtonItem) {
        viewModel.fetchMessage()
    }
    
    fileprivate func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(activityIndicator)
        label.centerInSuperview()
        activityIndicator.topToBottom(of: label, offset: 12)
        activityIndicator.centerXToSuperview()
    }
    
}

extension ViewController : RootViewModelDelegate {
    func didStartFetchingMessage(_ message: String?){
        label.text = message
        activityIndicator.startAnimating()
    }
    
    func didFinishFetchingMessage(_ message: String?) {
        label.text = message
        activityIndicator.stopAnimating()
        
    }
}
