//
//  BaseViewController.swift
//  Use-popToViewController
//
//  Created by DianQK on 2017/6/29.
//  Copyright © 2017年 DianQK. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }

}
