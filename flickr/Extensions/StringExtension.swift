//
//  StringExtension.swift
//  flickr
//
//  Created by Victor Rendon on 2024-12-06.
//

import Foundation

// MARK: - Localizations

extension String {

    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
