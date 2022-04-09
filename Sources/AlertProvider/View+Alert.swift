//
//  View+Alert.swift
//  AlertProvider
//
//  Created by Andriy Pohorilko on 09.04.2022.
//

import SwiftUI

public extension View {
    func alert(_ alertProvider: AlertProvider) -> some View {
        self.modifier(AlertView(alertProvider: alertProvider))
    }
}

private struct AlertView: ViewModifier {
    let alertProvider: AlertProvider
    @State private var show = false
    
    func body(content: Content) -> some View {
        content
            .alertInternal(alertProvider, show: $show)
            .onReceive(alertProvider.alertUpdateEvent) { alert in
                show = alert != nil
            }
            .onChange(of: show) { show in
                if !show {
                    alertProvider.alert = nil
                }
            }
    }
}

private extension View {
    func alertInternal(_ alertProvider: AlertProvider, show: Binding<Bool>) -> some View {
        let alert = alertProvider.alert
        
        return self.alert(
            alert?.title ?? "",
            isPresented: show,
            actions: {
                ForEach(alert?.buttons ?? []) {
                    Button($0.title, role: getButtonRole(for: $0.role), action: $0.action)
                }
            }, message: {
                Text(alert?.message ?? "")
            })
    }
    
    private func getButtonRole(for role: AlertButtonRole?) -> ButtonRole? {
        switch role {
        case .destructive:
            return ButtonRole.destructive
        case .cancel:
            return ButtonRole.cancel
        case .none:
            return nil
        }
    }
}
