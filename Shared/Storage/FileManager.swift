import Foundation

struct StorageFileManager {
    static let shared = StorageFileManager()
    let directory: URL

    init() {
        let fm = FileManager.default
        let groupId = "group.com.example.note2markdown"
        directory = fm.containerURL(forSecurityApplicationGroupIdentifier: groupId) ?? fm.temporaryDirectory
    }

    func save(markdown: String, fileName: String) -> URL? {
        let url = directory.appendingPathComponent(fileName)
        do {
            try markdown.write(to: url, atomically: true, encoding: .utf8)
            return url
        } catch {
            return nil
        }
    }
}
