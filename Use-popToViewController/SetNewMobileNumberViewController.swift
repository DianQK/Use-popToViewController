//
//  SetNewMobileNumberViewController.swift
//  Use-popToViewController
//
//  Created by DianQK on 2017/6/29.
//  Copyright © 2017年 DianQK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SetNewMobileNumberViewController: BaseViewController {

    let saveBarButtonItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "修改绑定"
        saveBarButtonItem.title = "保存"
        self.navigationItem.rightBarButtonItem = saveBarButtonItem

//        saveBarButtonItem.rx.tap
//            .subscribe(onNext: { [unowned self] in
//                let destinationViewController = self.navigationController!.viewControllers.first(where: { $0 is RootViewController })!
//                self.navigationController?.popToViewController(destinationViewController, animated: true)
//            })
//            .disposed(by: disposeBag)

    }

    var saveTap: Observable<()> {
        return saveBarButtonItem.rx.tap.asObservable() // 这里可以添加验证码验证逻辑
    }

}
