import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @State private var notes: [Note] = []

    var body: some View {
        NavigationView {
            VStack {
                if notes.isEmpty {
                    Spacer()
                    Text("No notes yet. Share a note from Apple Notes or paste one.")
                        .multilineTextAlignment(.center)
                        .padding()
                    Button("Paste") {
                        // TODO: handle paste
                    }
                    Spacer()
                } else {
                    List(filteredNotes) { note in
                        NavigationLink(destination: SinglePageView(note: note)) {
                            Text(note.title)
                        }
                    }
                    .searchable(text: $searchText)
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Import") {
                        // TODO: open Apple Notes
                    }
                }
            }
        }
    }

    var filteredNotes: [Note] {
        if searchText.isEmpty { return notes }
        return notes.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
