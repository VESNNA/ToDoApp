//
//  String+Extensions.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 18.12.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "~!@#$%^&*()-+=[]\\{},./?<>").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}
