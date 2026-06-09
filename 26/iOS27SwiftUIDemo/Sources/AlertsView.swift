import SwiftUI

/// Data- and error-driven alerts, plus the prominent-tab destination.
///
/// NOTE ON ALERTS: iOS 27 adds shorthand overloads
/// `alert(error:actions:message:)` and `alert(_:item:actions:)`. I couldn't
/// verify their exact signatures against the iOS 27 SDK from here, so this
/// screen uses the **stable** `alert(_:isPresented:presenting:…)` form (works
/// on every SDK). The iOS 27 one-liners are shown in comments next to each —
/// swap them in once you confirm them with Xcode 27 autocomplete.
struct AlertsView: View {
    struct DemoError: LocalizedError {
        var errorDescription: String? { "The upload could not be completed." }
        var recoverySuggestion: String? { "Check your connection and try again." }
    }

    struct Confirmable: Identifiable {
        let id = UUID()
        let name: String
    }

    @State private var error: DemoError?
    @State private var showError = false

    @State private var itemToConfirm: Confirmable?
    @State private var showConfirm = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Button("Trigger error alert") {
                    error = DemoError()
                    showError = true
                }
                .buttonStyle(.glass) // Liquid Glass button (iOS 26+, refined iOS 27)

                Button("Confirm an item") {
                    itemToConfirm = Confirmable(name: "Project H7")
                    showConfirm = true
                }
                .buttonStyle(.glass)
            }
            .padding()
            .navigationTitle("Create")

            // Stable form (all SDKs).
            // iOS 27 shorthand:  .alert(error: error) { Button("OK"){} }
            .alert(
                "Upload failed",
                isPresented: $showError,
                presenting: error
            ) { _ in
                Button("OK", role: .cancel) {}
            } message: { err in
                Text(err.recoverySuggestion ?? err.localizedDescription)
            }

            // Stable form (all SDKs).
            // iOS 27 shorthand:  .alert("Delete?", item: $itemToConfirm) { item in … }
            .alert(
                "Delete \(itemToConfirm?.name ?? "")?",
                isPresented: $showConfirm,
                presenting: itemToConfirm
            ) { _ in
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}

#Preview {
    AlertsView()
}
