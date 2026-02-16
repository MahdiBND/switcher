//
//  File.swift
//  Switcher
//
//  Created by Mahdi BND on 2/16/26.
//

import SwiftUI

public extension EnvironmentValues {
    var switchItemBackgroundColor: Color {
        get { self[SwitchItemBackgroundColorKey.self] }
        set { self[SwitchItemBackgroundColorKey.self] = newValue }
    }

    var switchItemSelectedBackgroundColor: Color {
        get { self[SwitchItemSelectedBackgroundColorKey.self] }
        set { self[SwitchItemSelectedBackgroundColorKey.self] = newValue }
    }

    var switchItemForegroundColor: Color {
        get { self[SwitchItemForegroundColorKey.self] }
        set { self[SwitchItemForegroundColorKey.self] = newValue }
    }

    var switchItemSelectedForegroundColor: Color {
        get { self[SwitchItemSelectedForegroundColorKey.self] }
        set { self[SwitchItemSelectedForegroundColorKey.self] = newValue }
    }

    var switchItemBorderWidth: CGFloat {
        get { self[SwitchItemBorderWidthKey.self] }
        set { self[SwitchItemBorderWidthKey.self] = newValue }
    }

    var switchItemBorderColor: Color {
        get { self[SwitchItemBorderColorKey.self] }
        set { self[SwitchItemBorderColorKey.self] = newValue }
    }

    var switchItemImageSize: CGFloat {
        get { self[SwitchItemImageSizeKey.self] }
        set { self[SwitchItemImageSizeKey.self] = newValue }
    }
}
