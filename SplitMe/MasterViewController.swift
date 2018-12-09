//
//  MasterViewController.swift
//  SplitMe
//
//  Created by TA Trung Thanh on 08/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UISplitViewControllerDelegate {
    
    private let b1 = UIButton(type: .system)
    private let b2 = UIButton(type: .system)
    private let b3 = UIButton(type: .system)
    var fullWatch = false
    
    var splitVC : UISplitViewController?
    var myDevice = SomeTypes.DeviceType.undefined
    var detailVC : DetailViewController?
    
    init(_ devType : SomeTypes.DeviceType, detail: DetailViewController, split: UISplitViewController) {
        super.init(nibName: nil, bundle: nil)
        splitVC = split
        detailVC = detail
        myDevice = devType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Master"
        self.view = UIView()
        self.view.backgroundColor = UIColor.white
        b1.setTitle("Yellow detail", for: .normal)
        b1.addTarget(self, action: #selector(doDetail(sender:)), for: .touchDown)
        self.view.addSubview(b1)
        b2.setTitle("Blue detail", for: .normal)
        b2.addTarget(self, action: #selector(doDetail(sender:)), for: .touchDown)
        self.view.addSubview(b2)
        switch myDevice {
        case .ipad97, .ipad105, .ipad127:
            b3.setTitle("Both together?", for: .normal)
            b3.addTarget(self, action: #selector(flipFlapSeeAll), for: .touchDown)
            self.view.addSubview(b3)
        default: ()
        }
        //fletching the width of the status bar
        let s = CGSize(width: ((self.navigationController?.navigationBar.frame.size.width)!), height: UIScreen.main.bounds.size.height)
        self.displayInFormat(size: s)
    }
    
    @objc func doDetail(sender: UIButton) {
        if sender === b1 {
            detailVC?.yellowView()
        } else {
            detailVC?.blueView()
        }
        splitVC?.showDetailViewController(detailVC!.navigationController!, sender: self)
    }
    
    @objc func flipFlapSeeAll() {
        fullWatch = !fullWatch
        if fullWatch {
            splitVC?.preferredDisplayMode = .allVisible
            b3.setTitle("Overlap?", for: .normal)
        } else {
            splitVC?.preferredDisplayMode = .primaryOverlay
            b3.setTitle("Both together?", for: .normal)
        }
    }
    func displayInFormat(size: CGSize) {
        b1.frame = CGRect(x: 10, y: 100, width: 120, height: 30)
        b2.frame = CGRect(x: 10, y: 150, width: 120, height: 30)
        b3.frame = CGRect(x: 10, y: 200, width: 120, height: 30)
        self.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
}
