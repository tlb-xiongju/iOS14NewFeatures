//
//  DatePickerViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter
    }()
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(DatePickerViewController.updateDate), for: .valueChanged)
    }
    
    
    @objc
    func updateDate() {
        dateLabel.text = dateFormatter.string(from: datePicker.date)
    }
}
