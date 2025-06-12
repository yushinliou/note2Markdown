import Foundation
import WebKit

final class MarkdownConverter: NSObject {
    private var webView: WKWebView!
    private var completion: ((String) -> Void)?

    override init() {
        super.init()
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
    }

    func convert(html: String, completion: @escaping (String) -> Void) {
        self.completion = completion
        let htmlString = """
        <html><head><script src='turndown.js'></script></head><body>\(html)</body></html>
        """
        webView.loadHTMLString(htmlString, baseURL: Bundle.main.resourceURL)
    }
}

extension MarkdownConverter: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "new TurndownService().turndown(document.body.innerHTML);"
        webView.evaluateJavaScript(js) { result, error in
            if let markdown = result as? String {
                self.completion?(markdown)
            } else {
                self.completion?("")
            }
        }
    }
}
