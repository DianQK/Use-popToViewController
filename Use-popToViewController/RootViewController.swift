//
//  RootViewController.swift
//  Use-popToViewController
//
//  Created by DianQK on 2017/6/29.
//  Copyright © 2017年 DianQK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RootViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我是 Root"

        let modifyPasswordButton = UIButton()
        modifyPasswordButton.setTitle("去修改手机号", for: .normal)
        modifyPasswordButton.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(modifyPasswordButton)
        modifyPasswordButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }

//        modifyPasswordButton.rx.tap
//            .subscribe(onNext: { [unowned self] in
//                let verifyCurrentMobileNumberViewController = VerifyCurrentMobileNumberViewController()
//                self.show(verifyCurrentMobileNumberViewController, sender: nil)
//            })
//            .disposed(by: disposeBag)

        modifyPasswordButton.rx.tap
            .flatMap { [unowned self] () -> Observable<()> in
                let verifyCurrentMobileNumberViewController = VerifyCurrentMobileNumberViewController()
                self.show(verifyCurrentMobileNumberViewController, sender: nil)
                return verifyCurrentMobileNumberViewController.nextTap
            }
            .flatMap { [unowned self] () -> Observable<()> in
                let setNewMobileNumberViewController = SetNewMobileNumberViewController()
                self.show(setNewMobileNumberViewController, sender: nil)
                return setNewMobileNumberViewController.saveTap
            }
            .subscribe(onNext: { [unowned self] in
                self.navigationController?.popToViewController(self, animated: true)
            })
            .disposed(by: disposeBag)

    }

}

