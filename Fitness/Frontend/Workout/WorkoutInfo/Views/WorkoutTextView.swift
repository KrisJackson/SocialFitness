//
//  WorkoutTextView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/30/20.
//

import UIKit

class WorkoutInfoTextView: UITextView {
    
    var txtColor: UIColor? = .black
    var placeholderText = "Placeholder"
    lazy var isEmpty = self.isPlaceholder
    
    private var isPlaceholder = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.textColor = .placeholderText
        self.autocapitalizationType = .words
        self.font = .systemFont(ofSize: 18, weight: .medium)
        self.reloadInputViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func text() -> String {
        return self.isPlaceholder ? "" : self.text
    }
}

extension WorkoutInfoTextView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.isPlaceholder {
            self.selectedTextRange = self.textRange(from: self.beginningOfDocument, to: self.endOfDocument)
        }
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.isPlaceholder {
            self.selectedTextRange = self.textRange(from: self.beginningOfDocument, to: self.beginningOfDocument)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if self.isPlaceholder && !text.isEmpty {
            if !text.isEmpty {
                textView.text = text
                self.isPlaceholder = false
                self.textColor = self.txtColor
                self.selectedTextRange = self.textRange(from: self.endOfDocument, to: self.endOfDocument)
            }
            return false
        }

        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if self.text.isEmpty {
            self.isPlaceholder = true
            self.text = self.placeholderText
            self.textColor = .placeholderText
            self.selectedTextRange = self.textRange(from: self.beginningOfDocument, to: self.beginningOfDocument)
        }
    }
    
}
