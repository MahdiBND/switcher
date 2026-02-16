//
//  SwitcherEnvironment.swift
//  Switcher
//
//  Created by Mahdi BND on 4/27/25.
//

import SwiftUI

public extension View {
    func switchItemBackgroundColor(_ color: Color) -> some View {
        environment(\.switchItemBackgroundColor, color)
    }

    func switchItemSelectedBackgroundColor(_ color: Color) -> some View {
        environment(\.switchItemSelectedBackgroundColor, color)
    }

    func switchItemForegroundColor(_ color: Color) -> some View {
        environment(\.switchItemForegroundColor, color)
    }

    func switchItemSelectedForegroundColor(_ color: Color) -> some View {
        environment(\.switchItemSelectedForegroundColor, color)
    }

    func switchItemBorderWidth(_ width: CGFloat) -> some View {
        environment(\.switchItemBorderWidth, width)
    }

    func switchItemSelectedBorderWidth(_ width: CGFloat) -> some View {
        environment(\.switchItemSelectedBorderWidth, width)
    }

    func switchItemBorderColor(_ color: Color) -> some View {
        environment(\.switchItemBorderColor, color)
    }

    func switchItemImageSize(_ size: CGFloat) -> some View {
        environment(\.switchItemImageSize, size)
    }
}
