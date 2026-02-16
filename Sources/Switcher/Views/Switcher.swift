//
//  Switcher.swift
//  Switcher
//
//  Created by Mahdi BND on 4/27/25.
//

import SwiftUI

public struct CategorySwitch<Item: Switchable>: View {
    @Namespace private var animation

    public var items: [Item]
    @Binding public var selectedSwitch: Item?
    public var itemWidth: CGFloat = .infinity
    public var scrollEnabled = true
    public var itemAction: (Item) -> Void = { _ in }

    private func getWidth(from proxy: GeometryProxy) -> CGFloat? {
        if itemWidth == .infinity {
            return proxy.size.width
        } else {
            return nil
        }
    }

    public var body: some View {
        Group {
            if scrollEnabled {
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(items) { item in
                                SwitchItem(
                                    animation: animation,
                                    item: item,
                                    isSelected: selectedSwitch == item,
                                    width: itemWidth,
                                    action: { select(item, scrollProxy: scrollProxy) }
                                )
                                .id(item.id)
                            }
                        }
                        .padding(.horizontal)
                        .id("switcher")
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            self.scroll(to: selectedSwitch, scrollProxy: scrollProxy)
                        }
                    }
                }
            } else {
                GeometryReader { proxy in
                    HStack {
                        ForEach(items) { item in
                            SwitchItem(
                                animation: animation,
                                item: item,
                                isSelected: selectedSwitch == item,
                                width: itemWidth,
                                action: { select(item) }
                            )
                        }
                    }
                    .frame(height: proxy.size.height)
                }
            }
        }
        .frame(height: 52)
    }

    private func select(_ item: Item, scrollProxy: ScrollViewProxy? = nil) {
        DispatchQueue.main.async {
            if self.selectedSwitch != item {
                self.selectedSwitch = item

//                Feedback.send(style: .soft)

                itemAction(item)

                if let scrollProxy {
                    scroll(to: item, scrollProxy: scrollProxy)
                }
            }
        }
    }

    private func scroll(to item: Item?, scrollProxy: ScrollViewProxy) {
        guard let item else { return }

        withAnimation(.smooth) {
            scrollProxy.scrollTo(item.id, anchor: .center)
        }
    }
}
