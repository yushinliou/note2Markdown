import Foundation

enum ImageHandlingOption: String, CaseIterable, Codable {
    case ignore
    case saveLocal
    case customSubfolder

    var description: String {
        switch self {
        case .ignore: return "Ignore"
        case .saveLocal: return "Save as Local Files"
        case .customSubfolder: return "Customize subfolder"
        }
    }
}
