//
//  Array+Filtering.swift
//  opdracht
//
//  Created by Tim Hoogstrate on 29/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    func removeDuplicates(_ elements: [Element]) -> [Element] {
        var seen = Set<Element>()
        return elements.filter{ seen.insert($0).inserted }
    }
}
