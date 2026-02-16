//
//  SwitchItem.swift
//  Switcher
//
//  Created by Mahdi BND on 4/27/25.
//

import SwiftUI

internal struct SwitchItem: View {
    @Environment(\.switchItemBackgroundColor) private var envBackground
    @Environment(\.switchItemSelectedBackgroundColor) private var envSelectedBackground
    @Environment(\.switchItemForegroundColor) private var envForeground
    @Environment(\.switchItemSelectedForegroundColor) private var envSelectedForeground
    @Environment(\.switchItemBorderWidth) private var envBorderWidth
    @Environment(\.switchItemSelectedBorderWidth) private var envSelectedBorderWidth
    @Environment(\.switchItemBorderColor) private var envBorderColor
    @Environment(\.switchItemImageSize) private var envImageSize

    // Inputs
    public var animation: Namespace.ID
    public var item: any Switchable
    public var isSelected: Bool
    public var width: CGFloat = .infinity
    public var action: () -> Void

    private let backgroundID = "background"

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 4) {
                // Optional Image Maybe
                // Example usage of imageSize if/when an image is added:
                // Image(systemName: "circle.fill")
                //     .resizable()
                //     .frame(width: imageSize, height: imageSize)

                Text(item.switchTitle)
                    .foregroundStyle(foreground)
                    .animation(titleAnimation, value: isSelected)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12.5)
            .fixedSize(horizontal: width == .infinity, vertical: true)
            .frame(maxWidth: width)
            .background(backgroundShape)
            .overlay(alignment: .bottom) { borderShape }
        }
    }
}

private extension SwitchItem {
    var backgroundShape: some View {
        Capsule(style: .continuous)
            .fill(background)
            .matchedGeometryEffect(id: backgroundID, in: self.animation, isSource: isSelected)
            .animation(.spring(duration: 0.25), value: isSelected)
    }

    var borderShape: some View {
        Capsule(style: .continuous)
            .inset(by: 0.5)
            .stroke(lineWidth: borderWidth)
            .foregroundStyle(borderColor)
    }
}

private extension SwitchItem {
    var background: Color {
        isSelected ? envSelectedBackground : envBackground
    }

    var foreground: Color {
        isSelected ? envSelectedForeground : envForeground
    }

    var borderWidth: CGFloat {
        isSelected ? envSelectedBorderWidth : envBorderWidth
    }

    var borderColor: Color {
        envBorderColor
    }

    var imageSize: CGFloat {
        envImageSize
    }

    var titleAnimation: Animation? {
        isSelected ? .smooth.delay(0.15) : nil
    }
}
