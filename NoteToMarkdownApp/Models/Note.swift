import Foundation

struct Note: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var markdown: String
    var createdAt: Date = Date()
}

extension Note {
    static var example: Note {
        Note(title: "Example", markdown: "# Example\nThis is a sample note.")
    }
}
