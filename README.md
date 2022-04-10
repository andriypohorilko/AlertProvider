# AlertProvider - Show Alerts in SwiftUI

AlertProvider adds missing functionality to SwiftUI Alert. 

<img src="https://user-images.githubusercontent.com/18321399/162604532-324bbfec-6aec-4e9b-84b6-f36daae7d5ba.png" alt="AlertProvider - Show Alerts in SwiftUI" height="400"/>

## Installation

dependencies: [
    .package(url: "https://github.com/andriypohorilko/AlertProvider.git", from: "0.0.1")
]

## Usage

```swift
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
```
