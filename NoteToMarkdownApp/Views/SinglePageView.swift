import SwiftUI

struct SinglePageView: View {
    var note: Note
    @State private var showSettings = false

    var body: some View {
        VStack {
            ScrollView {
                Text(note.markdown)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            HStack {
                Button(action: export) {
                    Label("Export", systemImage: "square.and.arrow.up")
                }
                Spacer()
                Button(action: copyToClipboard) {
                    Label("Copy", systemImage: "doc.on.doc")
                }
            }
            .padding()
        }
        .navigationTitle(note.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showSettings.toggle() }) {
                    Image(systemName: "gearshape")
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }

    func export() {
        // TODO: export markdown
    }

    func copyToClipboard() {
        UIPasteboard.general.string = note.markdown
    }
}

struct SinglePageView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePageView(note: Note.example)
    }
}
