//
//  WebViewController.swift
//  evrmore-poc
//
//  Created by Prakash Mali on 10/23/21.
//  Copyright © 2021 Bitcot Technologies. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class WebViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var vwBackgroundView:UIView!
    
    var wkWebView = WKWebView()
    var activiyIndicatorView =  UIActivityIndicatorView()
    var webURL: URL!
    var nyResolution = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitials()
        loadWebRequest(url: webURL)
        activiyIndicatorView.style = .medium
        activiyIndicatorView.color = .purple
    }
    
    func loadInitials(){
        vwBackgroundView.addSubview(wkWebView)
        vwBackgroundView.addSubview(activiyIndicatorView)
        
        wkWebView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        activiyIndicatorView.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalToSuperview()
        }
    }
    
    func loadWebRequest(url: URL) {
        activiyIndicatorView.startAnimating()
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 2400)
        wkWebView.navigationDelegate = self
        wkWebView.load(request)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   
    @IBAction func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }
    
}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activiyIndicatorView.stopAnimating()
        print("failed launching")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activiyIndicatorView.stopAnimating()
        print("Finished launching")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webViewDidFinishLoad(webView: WKWebView) {
        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 2.0
    }
}
