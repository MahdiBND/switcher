//
//  Switchable.swift
//  Switcher
//
//  Created by Mahdi BND on 4/27/25.
//

import SwiftUI

public protocol Switchable: Identifiable, Hashable {
    var id: Int { get }
    var switchTitle: String { get }
}
