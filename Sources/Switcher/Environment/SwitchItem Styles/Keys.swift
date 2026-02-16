//
//  SwitchItemKeys.swift
//  Switcher
//
//  Created by Mahdi BND on 2/16/26.
//

import SwiftUI

internal struct SwitchItemBackgroundColorKey: EnvironmentKey {
    static let defaultValue: Color = .clear
}

internal struct SwitchItemSelectedBackgroundColorKey: EnvironmentKey {
    static let defaultValue: Color = .accentColor
}

internal struct SwitchItemForegroundColorKey: EnvironmentKey {
    static let defaultValue: Color = .secondary
}

internal struct SwitchItemSelectedForegroundColorKey: EnvironmentKey {
    static let defaultValue: Color = .primary
}

internal struct SwitchItemBorderWidthKey: EnvironmentKey {
    static let defaultValue: CGFloat = 2
}

internal struct SwitchItemBorderColorKey: EnvironmentKey {
    static let defaultValue: Color = .gray
}

internal struct SwitchItemImageSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 18
}
