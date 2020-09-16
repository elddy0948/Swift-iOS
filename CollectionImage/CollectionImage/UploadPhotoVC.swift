//
//  UploadPhotoVC.swift
//  CollectionImage
//
//  Created by 김호준 on 2020/09/16.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class UploadPhotoVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var pickedImage: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imagePicker의 delegate 지정
        imagePicker.delegate = self

    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        print("Pressed Button!")
        // 라이브러리에서 선택 vs 카메라에서 선택
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 라이브러리 선택
        alert.addAction(UIAlertAction(title: "Library", style: .default, handler: { (button) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        // 카메라 선
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (button) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

extension UploadPhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 이미지를 선택했을 시
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {return}
        
        pickedImage = pickImage
        imageView.image = pickedImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 이미지 선택을 취소 했을 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
