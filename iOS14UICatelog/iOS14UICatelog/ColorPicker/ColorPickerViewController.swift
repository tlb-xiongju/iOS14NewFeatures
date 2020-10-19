//
//  ColorPickerViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    @IBOutlet private weak var colorPickerButton: UIButton!
    
    private lazy var colorPicker: UIColorPickerViewController = {
        let picker = UIColorPickerViewController()
        picker.supportsAlpha = true
        picker.selectedColor = view.backgroundColor ?? .white
        picker.delegate = self
        return picker
    }()

    @IBAction private func presentColorPicker(_: UIButton) {
        present(colorPicker, animated: true)
    }
}

extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        // when close button is tapped
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        view.backgroundColor = viewController.selectedColor
        
        Swift.debugPrint("\(viewController.selectedColor)")
    }
}
