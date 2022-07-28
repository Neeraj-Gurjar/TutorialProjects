//
//  ViewController.swift
//  SnapkitDemo
//
//  Created by bitcot on 20/06/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var view1:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    var view2:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    var view3:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
    }
    
    //Chield
    func layout(){
            view.addSubview(view1)
            view1.snp.makeConstraints { make in
                make.width.equalTo(100)
                make.height.equalTo(100)
                make.centerX.equalToSuperview().offset(-50)
                make.centerY.equalToSuperview()
            }

            view.addSubview(view2)
            view2.snp.makeConstraints { make in
                make.width.equalTo(40)
                make.height.equalTo(40)
                make.left.equalTo(view1.snp.right)
                make.top.equalTo(view1.snp.top)
            }
    }
    
    //Cross Pattern
//    func layout(){
//        view.addSubview(view1)
//        view1.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        view.addSubview(view2)
//        view2.snp.makeConstraints { make in
//            make.height.equalTo(40)
//            make.centerY.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
//
//        view.addSubview(view3)
//        view3.snp.makeConstraints { make in
//            make.width.equalTo(40)
//            make.centerX.equalToSuperview()
//            make.top.bottom.equalToSuperview()
//        }
//    }
        
    //Responsive stack
//    func layout(){
//            view.addSubview(view1)
//            view1.snp.makeConstraints { make in
//                make.left.equalToSuperview()
//                make.height.equalTo(view1.snp.width)
//                make.centerY.equalToSuperview()
//            }
//
//            view.addSubview(view2)
//            view2.snp.makeConstraints { make in
//                make.left.equalTo(view1.snp.right)
//                make.height.equalTo(view2.snp.width)
//                make.width.equalTo(view1)
//                make.centerY.equalToSuperview()
//            }
//
//        view.addSubview(view3)
//        view3.snp.makeConstraints { make in
//            make.left.equalTo(view2.snp.right)
//            make.height.equalTo(view3.snp.width)
//            make.right.equalToSuperview()
//            make.width.equalTo(view2)
//            make.centerY.equalToSuperview()
//        }
//  }
    
    
    
}
