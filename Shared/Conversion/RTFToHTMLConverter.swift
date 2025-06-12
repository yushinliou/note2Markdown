import Foundation
import UIKit

struct RTFToHTMLConverter {
    static func convert(data: Data) -> String? {
        guard let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil) else {
            return nil
        }
        let range = NSRange(location: 0, length: attributedString.length)
        let options: [NSAttributedString.DocumentAttributeKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html
        ]
        guard let htmlData = try? attributedString.data(from: range, documentAttributes: options) else {
            return nil
        }
        return String(data: htmlData, encoding: .utf8)
    }
}
