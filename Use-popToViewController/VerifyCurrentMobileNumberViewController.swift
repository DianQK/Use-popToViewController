//
//  VerifyCurrentMobileNumberViewController.swift
//  Use-popToViewController
//
//  Created by DianQK on 2017/6/29.
//  Copyright © 2017年 DianQK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class VerifyCurrentMobileNumberViewController: BaseViewController {

    let nextBarButtonItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "手机绑定"
        nextBarButtonItem.title = "下一步"
        self.navigationItem.rightBarButtonItem = nextBarButtonItem

//        nextBarButtonItem.rx.tap
//            .subscribe(onNext: { [weak self] in
//                let setNewMobileNumberViewController = SetNewMobileNumberViewController()
//                self?.show(setNewMobileNumberViewController, sender: nil)
//            })
//            .disposed(by: disposeBag)

    }

    var nextTap: Observable<()> {
        return nextBarButtonItem.rx.tap.asObservable() // 这里可以添加手机号验证逻辑
    }

}
