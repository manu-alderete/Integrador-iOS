//
//  SplashViewController.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            NavigationHelper.setRoot(InitialViewController())
        }
    }

}
