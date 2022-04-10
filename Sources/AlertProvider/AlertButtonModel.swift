//
//  AlertButtonModel.swift
//  AlertProvider
//
//  Created by Andriy Pohorilko on 09.04.2022.
//

import Foundation

public struct AlertButtonModel: Identifiable {
    public let title: String
    public let role: AlertButtonRole?
    public let action: () -> Void
    
    public init(
        title: String,
        role: AlertButtonRole?,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.role = role
        self.action = action
    }
    
    public var id: UUID {
        return UUID()
    }
}
