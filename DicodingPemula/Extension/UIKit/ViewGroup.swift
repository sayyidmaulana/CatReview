//
//  ViewGroup.swift
//  DicodingPemula
//
//  Created by Sayyid Maulana Khakul Y on 14/04/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

extension UIButton {
    func setObject(completion: (UIButton) -> Void) {
        completion(self)
    }
}

extension UIImageView {
    func setObject(completion: (UIImageView) -> Void) {
        completion(self)
    }
}

extension UILabel {
    func setObject(completion: (UILabel) -> Void) {
        completion(self)
    }
}

extension UITextField {
    func setObject(completion: (UITextField) -> Void) {
        completion(self)
    }
}

extension UITextView {
    func setObject(completion: (UITextView) -> Void) {
        completion(self)
    }
}
