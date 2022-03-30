//
//  GenericWebViewController.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 29/3/22.
//

import UIKit
import WebKit

protocol GenericWebViewPresenterOutputProtocol {
    
}

class GenericWebViewController: UIViewController {
    
    // MARK: - ID
    var presenter: GenericWebViewPresenterInputProtocol?

    // MARK: - Variables globales
    var myWebViewInContainer: WKWebView!
    let appDelegate = Utils.appDelegate
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentWebView: UIView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionWebView()
        self.loadWebView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.appDelegate.canRotate = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.appDelegate.canRotate = false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //Actualizo el frame de la webView (esto soluciona el problema del tamaño del frame al girar la pantalla)
        DispatchQueue.main.async() {
            self.myWebViewInContainer.frame = self.contentWebView.bounds
          }
    }
    
    private func configuracionWebView() {
        self.title = "Cice Music Web"
        self.myActivityIndicator.isHidden = false
        self.myActivityIndicator.startAnimating()
        
        let contentWebView = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        
        preferences.allowsContentJavaScript = true
        self.myWebViewInContainer = WKWebView(frame: self.contentWebView.bounds, configuration: config)
        self.myWebViewInContainer.configuration.userContentController = contentWebView
        self.myWebViewInContainer.navigationDelegate = self
        
        self.contentWebView.addSubview(self.myWebViewInContainer)
    }
    
    private func loadWebView() {
        guard let urlUnw = URL(string: "http://www.icologic.co") else { return }
        self.myWebViewInContainer.load(URLRequest(url: urlUnw))
    }
    
}

extension GenericWebViewController: GenericWebViewPresenterOutputProtocol{
    
}

extension GenericWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        self.myActivityIndicator.stopAnimating()
        self.myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView,
                 didFailProvisionalNavigation navigation: WKNavigation!,
                 withError error: Error) {
        
    }
}
