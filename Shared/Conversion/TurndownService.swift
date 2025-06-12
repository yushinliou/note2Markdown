import Foundation

struct TurndownService {
    static func markdown(from html: String, completion: @escaping (String) -> Void) {
        let converter = MarkdownConverter()
        converter.convert(html: html) { markdown in
            completion(markdown)
        }
    }
}
