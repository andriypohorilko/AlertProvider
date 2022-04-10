//
//  AlertProvider.swift
//  AlertProvider
//
//  Created by Andriy Pohorilko on 09.04.2022.
//

import Foundation
import Combine

public class AlertProvider {
    public init() {}
    
    public struct Alert {
        let title: String
        let message: String
        let buttons: [AlertButtonModel]
        
        public init(
            title: String,
            message: String,
            buttons: [AlertButtonModel]
        ) {
            self.title = title
            self.message = message
            self.buttons = buttons
        }
    }
    
    private let alertSubject = CurrentValueSubject<Alert?, Never>(nil)
    internal var alertUpdateEvent: AnyPublisher<Alert?, Never> {
        alertSubject.eraseToAnyPublisher()
    }
    
    public var alert: Alert? {
        didSet { alertSubject.send(alert) }
    }
}
