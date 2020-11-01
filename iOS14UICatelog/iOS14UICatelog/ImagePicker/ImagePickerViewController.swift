//
//  ImagePickerViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit
import PhotosUI

class ImagePickerViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    private lazy var PHPicker: PHPickerViewController = {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 2
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        return picker
    }()
    
    private lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.mediaTypes = ["public.image"]
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBAction private func presentImagePicker(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }
    @IBAction private func presentPHImagePicker(_ sender: UIButton) {
        present(PHPicker, animated: true)
    }

}

extension ImagePickerViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let result = results.first,
              result.itemProvider.canLoadObject(ofClass: UIImage.self)
              else { return }
        
        result.itemProvider.loadObject(ofClass: UIImage.self) { [self] image, error in
            DispatchQueue.main.async {
                self.imageView.image = image as? UIImage
            }
        }
    }
}

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true)
    }
}
