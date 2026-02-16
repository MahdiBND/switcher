//
//  SwitchItem.swift
//  Switcher
//
//  Created by Mahdi BND on 4/27/25.
//

import SwiftUI

public struct SwitchItem: View {
    public var animation: Namespace.ID

    public var item: any Switchable
    public var isSelected: Bool
    public var width: CGFloat = .infinity
    public var action: () -> Void

    private let backgroundID = "background"

    private var background: Color {
        isSelected ? .accentColor : .clear
    }
    
    private var foreground: Color {
        isSelected ? .primary : .secondary
    }
    
    private var borderWidth: CGFloat {
        isSelected ? 0 : 2
    }

    private let borderColor: Color = .gray
    private let imageSize: CGFloat = 18

    private var titleAnimation: Animation? {
        isSelected ? .smooth.delay(0.15) : nil
    }

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 4) {
                // Optional Image Maybe

                Text(item.switchTitle)
                    
                    .foregroundStyle(foreground)
                    .animation(titleAnimation, value: isSelected)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12.5)
            .fixedSize(horizontal: width == .infinity, vertical: true)
            .frame(maxWidth: width)
            .background(
                Capsule(style: .continuous)
                    .fill(background)
                    .matchedGeometryEffect(id: backgroundID, in: self.animation, isSource: isSelected)
//                    .transition(.stable)
                    .animation(.spring(duration: 0.25), value: isSelected)
            )
            .overlay(alignment: .bottom) {
                Capsule(style: .continuous)
                    .inset(by: 0.5)
                    .stroke(lineWidth: borderWidth)
                    .foregroundStyle(borderColor)
            }
        }
    }
}
