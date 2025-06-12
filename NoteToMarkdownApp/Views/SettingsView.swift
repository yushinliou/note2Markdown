import SwiftUI

struct SettingsView: View {
    @State private var imageOption: ImageHandlingOption = .ignore

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Images")) {
                    Picker("Handling", selection: $imageOption) {
                        ForEach(ImageHandlingOption.allCases, id: \.self) { option in
                            Text(option.description).tag(option)
                        }
                    }
                }
                Section(header: Text("Front Matter")) {
                    Text("Configure fields")
                    // TODO: front matter configuration
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
