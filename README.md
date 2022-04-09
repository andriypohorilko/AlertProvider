# AlertProvider - Show Alerts in SwiftUI

AlertProvider adds missing functionality to SwiftUI Alert. 

## Installation

dependencies: [
    .package(url: "https://github.com/andriypohorilko/AlertProvider.git", from: "0.0.1")
]

## Using

class YourViewmodel: ObservableObject {
    let alertProvider = AlertProvider()

    func onShouldShowAlert() {
        alertProvider.alert = AlertProvider.Alert(
            title: "Save changes?",
            message: "Do you want save changes and close Editing View?",
            buttons: [
                AlertButtonModel(title: "Save", role: nil, action: saveEvent),
                AlertButtonModel(title: "Discard", role: .destructive, action: resetChanges),
                AlertButtonModel(title: "Cancel", role: .cancel, action: {}),
            ])
    }
}

class ContentView: View {
    var body: some View {
        Text("hello world")
            .alert(viewModel.alertProvider)
    }
}
