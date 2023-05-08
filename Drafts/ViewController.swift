//
//  ViewController.swift
//  Drafts
//
//  Created by 于晓鹏 on 2023/5/8.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
        
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webViewConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: view.bounds, configuration: webViewConfig)
        webView.navigationDelegate = self
        view.addSubview(webView)
        let myURL = URL(string: "https://www.w3schools.com/html/html5_video.asp")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
        
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        detectVideo()
    }
 
    func detectVideo() {
        // detect <video> tag
        webView.evaluateJavaScript("document.getElementsByTagName('video').length") { (result, error) in
            if let count = result as? Int, count > 0 {
                print("find \(count) video tag")
            } else {
                print("video tag not found")
            }
        }
    }
}
