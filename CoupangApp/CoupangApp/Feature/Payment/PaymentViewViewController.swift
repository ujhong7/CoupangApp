//
//  PaymentViewViewController.swift
//  CoupangApp
//
//  Created by yujaehong on 12/16/24.
//

import UIKit
import WebKit

final class PaymentViewViewController: UIViewController {
    
    private var webView: WKWebView?
    private var getMessageScriptName: String = "receiveMessage"
    
    
    override func loadView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: getMessageScriptName) // JavaScript 메시지 핸들러 등록
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 헤더,쿠키 ???
        loadWebView()
        setUserAgent()
//        webView?.load(URLRequest(url: URL(string: "https://google.co.kr")!))
    }
    
    private func loadWebView() {
        guard let htmlPath = Bundle.main.path(forResource: "test", ofType: "html") else { return }
        let url = URL(fileURLWithPath: htmlPath)
        var request = URLRequest(url: url)
        request.addValue("customValue", forHTTPHeaderField: "Header-Name")
        webView?.load(request)
    }
    
    private func setUserAgent() {
        webView?.customUserAgent = "Cproject/1.0.0/iOS"
    }
    
    private func setCookie() {
        guard let cookie = HTTPCookie(properties: [
            .domain: "",
            .path: "",
            .name: "myCookie",
            .value: "value",
            .secure: "FALSE",
            .expires: NSDate(timeIntervalSinceNow: 3600)
        ]) else { return }
        webView?.configuration.websiteDataStore.httpCookieStore.setCookie((cookie))
    }
    
    private func callJavaScript() {
        webView?.evaluateJavaScript("javaScriptFunction();") // 웹 페이지 내 JavaScript 함수를 실행
    }
    
}

extension PaymentViewViewController: WKScriptMessageHandler { // didReceive : iOS에서 자바스크립트로부터 메시지를 수신
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == getMessageScriptName {
            print("\(message.body)")
        }
    }
}

#Preview {
    PaymentViewViewController()
}

