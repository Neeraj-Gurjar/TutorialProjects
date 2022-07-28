//
//  SecondViewController.swift
//  SnapkitDemo
//
//  Created by bitcot on 21/06/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var viewContainer = UIView()
    var loginView = UIView()
    var viewTop = UIView()
    var lblTitle = UILabel()
    var txtEmail = UITextField()
    var txtPassword = UITextField()
    var viewBottom = UIView()
    var btnConnect = UIButton(type: .custom)
    var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    var timer: Timer?
    
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerView()
        setupTitle()
        setupTextfields()
        setupBottomView()
        setupActivityIndicator()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        view.addSubview(loginView)
        loginView.snp.makeConstraints { (make) in
           
            make.edges.equalTo(self.view)
        }
    }
    
    func setupContainerView() {
        
        
        view.addSubview(viewContainer)
        
        viewContainer.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.center.equalTo(view)
            make.height.equalTo(192)
            viewContainer.backgroundColor = UIColor.lightGray
            viewContainer.layer.cornerRadius = 8.0
            viewContainer.clipsToBounds = true
        }
    }
    
    func setupTitle() {
        
        viewContainer.addSubview(viewTop)
        
        viewTop.backgroundColor = UIColor.darkGray
        viewTop.snp.makeConstraints { (make) in
            make.left.equalTo(viewContainer)
            make.top.equalTo(viewContainer)
            make.right.equalTo(viewContainer)
            make.height.equalTo(30)
        }
        
        
        viewTop.addSubview(lblTitle)
        lblTitle.text = "LOGIN"
        lblTitle.textColor = UIColor.white
        lblTitle.backgroundColor = UIColor.clear
        lblTitle.font = UIFont(name: "Futura-Bold", size: 17.0)
        lblTitle.snp.makeConstraints { (make) in
            make.edges.equalTo(viewTop).inset(UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0))
        }
    }
    
    func setupTextfields() {
        
        viewContainer.addSubview(txtEmail)
        txtEmail.placeholder = "Email"
        txtEmail.delegate = self
        txtEmail.borderStyle = .none
        txtEmail.backgroundColor = UIColor.white
        txtEmail.keyboardType = .emailAddress
        txtEmail.returnKeyType = .next
        txtEmail.autocapitalizationType = .none
        txtEmail.snp.makeConstraints { (make) in
                make.top.equalTo(viewTop.snp.bottom).offset(16)
                make.left.equalTo(viewContainer).offset(8)
                make.right.equalTo(viewContainer).offset(-8)
                make.height.equalTo(40)
            }
        
        
            viewContainer.addSubview(txtPassword)
            txtPassword.placeholder = "Password"
        txtPassword.delegate = self
            txtPassword.borderStyle = .none
            txtPassword.backgroundColor = UIColor.white
            txtPassword.autocapitalizationType = .none
            txtPassword.returnKeyType = .done
            txtPassword.isSecureTextEntry = true
        txtPassword.snp.makeConstraints { (make) in
                make.top.equalTo(txtEmail.snp.bottom).offset(8.0)
                make.left.equalTo(txtEmail)
                make.right.equalTo(txtEmail)
                make.height.equalTo(40)
            }
    }
    func setupBottomView() {
        
        viewContainer.addSubview(viewBottom)
        viewBottom.backgroundColor = UIColor.darkGray
        viewBottom.snp.makeConstraints { (make) in
                make.left.equalTo(viewContainer)
                make.right.equalTo(viewContainer)
                make.bottom.equalTo(viewContainer)
                make.height.equalTo(50)
            }
        
        
           viewBottom.addSubview(btnConnect)
           btnConnect.setTitle("Connect", for: .normal)
           btnConnect.setTitleColor(UIColor.white, for: .normal)
           btnConnect.setTitleColor(UIColor.lightGray, for: .highlighted)
           btnConnect.backgroundColor = UIColor.orange
          // btnConnect.titleLabel?.font = UIFont(name: "Futura", size: 15.0)
        btnConnect.addTarget(self, action: #selector(self.connect), for: .touchUpInside)
        btnConnect.snp.makeConstraints { (make) in
                make.top.equalTo(viewBottom)
                make.right.equalTo(viewBottom)
                make.bottom.equalTo(viewBottom)
                make.width.equalTo(100)
            
    }

  }
    
    
    func setupActivityIndicator() {
        viewContainer.addSubview(activityIndicator)
     
        activityIndicator.color = UIColor.orange
     //   activityIndicator.startAnimating()
        activityIndicator.snp.makeConstraints { (make) in
                make.centerX.equalTo(viewContainer)
                make.centerY.equalTo(viewContainer)  //.offset(-containerViewHeight/2 - 20)
                make.width.equalTo(40)
                make.height.equalTo(self.activityIndicator.snp.width)
            }
    }
    
//    @objc func handleKeyboardWillShow(notification: Notification) {
//        if let userInfo = notification.userInfo as? Dictionary<String, Any> {
//            if let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                if containerViewOriginPlusHeight > keyboardFrameValue.cgRectValue.origin.y {
//                    let overlappedSpace = containerViewOriginPlusHeight - keyboardFrame.origin.y
//
//                    centerYConstraint.update(offset: -overlappedSpace)
//                    self.setNeedsLayout()
//
//                    UIView.animate(withDuration: 0.4, animations: {
//                        self.layoutIfNeeded()
//                    })
//                }
//            }
//        }
//    }
//
//
//    @objc func handleKeyboardDidHide(notification: Notification) {
//        centerYConstraint.update(offset: 0.0)
//        self.setNeedsLayout()
//
//        UIView.animate(withDuration: 0.4, animations: {
//            self.layoutIfNeeded()
//        })
//    }

    
    @objc func connect() {
        

        if isAnimating {
            return
        }
        
        txtEmail.snp.remakeConstraints { (make) in
                make.top.equalTo(viewTop.snp.bottom).offset(16)
                make.left.equalTo(viewContainer.snp.right)
                make.width.equalTo(txtEmail.snp.width)
                make.height.equalTo(50)
            }
         
            txtPassword.snp.remakeConstraints { (make) in
                make.right.equalTo(viewContainer.snp.left)
                make.top.equalTo(txtEmail.snp.bottom).offset(8.0)
                make.width.equalTo(txtPassword.snp.width)
                make.height.equalTo(50)
            }
        activityIndicator.snp.updateConstraints { (make) in
               make.centerY.equalTo(viewContainer)
           }
        UIView.animate(withDuration: 0.5, animations: {
           }) { (finished) in
               if finished {
                   self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.revertLoginView), userInfo: nil, repeats: false)
                       }
           }
        isAnimating = true
    }
    
    @objc func revertLoginView() {
        txtEmail.snp.remakeConstraints { (make) in
            make.top.equalTo(viewTop.snp.bottom).offset(16)
            make.left.equalTo(viewContainer).offset(8)
            make.right.equalTo(viewContainer).offset(-8)
            make.height.equalTo(50)
        }

        txtPassword.snp.remakeConstraints { (make) in
            make.top.equalTo(txtEmail.snp.bottom).offset(8.0)
            make.left.equalTo(txtEmail)
            make.right.equalTo(txtEmail)
            make.height.equalTo(50)
        }

        activityIndicator.snp.updateConstraints { (make) in
            make.centerY.equalTo(viewContainer)  //.offset(-containerViewHeight/2 - 20)
        }


        UIView.animate(withDuration: 0.5, animations: {
        }) { (finished) in
            if finished {
                self.timer!.invalidate()
                self.timer = nil

                self.isAnimating = false
            }
        }
    }
}


extension SecondViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        }
        else {
            txtPassword.resignFirstResponder()
        }

        return true
    }
}
