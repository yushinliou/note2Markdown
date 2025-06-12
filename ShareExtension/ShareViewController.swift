import UIKit
import Social

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        handleInput()
    }

    private func handleInput() {
        guard let item = extensionContext?.inputItems.first as? NSExtensionItem,
              let provider = item.attachments?.first else {
            return
        }

        if provider.hasItemConformingToTypeIdentifier("public.rtf") {
            provider.loadItem(forTypeIdentifier: "public.rtf", options: nil) { data, error in
                // TODO: convert RTF to Markdown
            }
        } else if provider.hasItemConformingToTypeIdentifier("public.html") {
            provider.loadItem(forTypeIdentifier: "public.html", options: nil) { data, error in
                // TODO: convert HTML to Markdown
            }
        }
    }
}
