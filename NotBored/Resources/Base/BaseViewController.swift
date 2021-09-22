//
//  BaseViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    var hidesNavigationBar: Bool = false
    var revertsNavigationBar: Bool = true
    
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(hidesNavigationBar, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if revertsNavigationBar {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    @objc func backHandler() {
        if self.isBeingPresented {
            self.dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
