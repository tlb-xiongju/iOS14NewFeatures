//
//  FontPickerViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit

class FontPickerViewController: UIViewController {
    
    @IBOutlet private weak var fontPickerButton: UIButton!
    @IBOutlet private weak var englishLabel: UILabel!
    @IBOutlet private weak var japaneseLabel: UILabel!
    
    private lazy var fontPicker: UIFontPickerViewController = {
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = true
        config.displayUsingSystemFont = false
        
        let picker = UIFontPickerViewController(configuration:config)
        picker.delegate = self
        return picker
    }()

    @IBAction private func presentFontPicker(_ sender: UIButton) {
        present(fontPicker, animated: true)
    }
}

extension FontPickerViewController: UIFontPickerViewControllerDelegate {
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let fontDescriptor = viewController.selectedFontDescriptor else { return }
        let font = UIFont(descriptor: fontDescriptor, size: 24.0)
        
        japaneseLabel.font = font
        englishLabel.font = font
        
        Swift.debugPrint("Chosen font: \(font)")
    }
}
