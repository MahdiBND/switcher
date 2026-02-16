//
//  SwitcherEnvironment.swift
//  Switcher
//
//  Created by Mahdi BND on 4/27/25.
//

import SwiftUI

public extension View {
    func switchBackground(normal: Color, selected: Color) -> some View {
        self
            .environment(\.switchItemBackgroundColor, normal)
            .environment(\.switchItemSelectedBackgroundColor, selected)
    }

    func switchForeground(normal: Color, selected: Color) -> some View {
        self
            .environment(\.switchItemForegroundColor, normal)
            .environment(\.switchItemSelectedForegroundColor, selected)
    }

    func switchBorder(color: Color, width: CGFloat) -> some View {
        self
            .environment(\.switchItemBorderColor, color)
            .environment(\.switchItemBorderWidth, width)
    }

    func switchImageSize(_ size: CGFloat) -> some View {
        environment(\.switchItemImageSize, size)
    }
}
