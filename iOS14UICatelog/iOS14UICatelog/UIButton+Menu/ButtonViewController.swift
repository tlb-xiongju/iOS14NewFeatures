//
//  ButtonViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet private weak var tapMenuButton: UIButton!
    @IBOutlet private weak var longPressMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        longPressMenuButton.menu = .init(title: "Choose",options: .destructive, children: [
            UIAction(title: "Item1") { _ in Swift.debugPrint("Item1") },
            UIAction(title: "Item2") { _ in Swift.debugPrint("Item2") },
            UIAction(title: "Item3") { _ in Swift.debugPrint("Item3") },
            UIAction(title: "Item4") { _ in Swift.debugPrint("Item4") },
            UIAction(title: "Item5") { _ in Swift.debugPrint("Item5") }
        ])
        
        tapMenuButton.menu = .init(title: "Choose",options: .destructive, children: [
            UIAction(title: "Item1") { _ in Swift.debugPrint("Item1") },
            UIAction(title: "Item2") { _ in Swift.debugPrint("Item2") },
            UIAction(title: "Item3") { _ in Swift.debugPrint("Item3") },
            UIAction(title: "Item4") { _ in Swift.debugPrint("Item4") },
            UIAction(title: "Item5") { _ in Swift.debugPrint("Item5") }
        ])
        tapMenuButton.showsMenuAsPrimaryAction = true
    }
}
