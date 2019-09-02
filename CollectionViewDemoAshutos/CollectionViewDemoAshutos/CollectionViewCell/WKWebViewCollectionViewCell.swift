//
//  WKWebViewCollectionViewCell.swift
//  CollectionViewDemoAshutos
//
//  Created by Ashutos on 01/09/19.
//  Copyright © 2019 Ashutos. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var webView: WKWebView!
    private var loaderView = AshutosLoaderView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.webView.navigationDelegate = self
        loaderView.showLoaderOn(view: self.contentView)
        // Initialization code
    }

}

extension WKWebViewCollectionViewCell: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaderView.hideLoader()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.loaderView.hideLoader()
    }
}
