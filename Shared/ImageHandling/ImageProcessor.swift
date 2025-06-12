import UIKit

struct ImageProcessor {
    static func save(image: UIImage, name: String) -> URL? {
        guard let data = image.pngData() else { return nil }
        let url = StorageFileManager.shared.directory.appendingPathComponent(name)
        do {
            try data.write(to: url)
            return url
        } catch {
            return nil
        }
    }
}
