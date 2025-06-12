import UIKit
import SwiftUI

struct MarkdownPreviewView: UIViewControllerRepresentable {
    let markdown: String

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [markdown], applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
