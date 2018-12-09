//
//  DetailViewController.swift
//  SplitMe
//
//  Created by TA Trung Thanh on 08/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let v = UIView()
    private let l = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        l.textAlignment = .left
        l.frame = CGRect(x: 30, y: 100, width: 200, height: 20)
        v.addSubview(l)
        self.view = v
        self.navigationItem.title = "Detail"
    }
    func yellowView() {
        v.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1)
        l.text = "2nd view (yellow)"
        self.navigationItem.title = "Detail yellow"
    }
    func blueView() {
        v.backgroundColor = UIColor(red: 0.4, green: 0.7, blue: 0.9, alpha: 1)
        l.text = "2nd view (blue)"
        self.navigationItem.title = "Detail blue"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("Size 2nd = \(size)")
        self.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
}
