//
//  NewBookViewController.swift
//  ReadMe
//
//  Created by 김호준 on 2020/09/06.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class NewBookViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var bookImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookImageView.layer.cornerRadius = 16
        
        titleTextField.delegate = self
        authorTextField.delegate = self
    }
    
    @IBAction func updateImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self //set this ViewController for UIImagePickerController's delegate
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}


extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        bookImageView.image = selectedImage
        bookImageView?.layer.cornerRadius = 16
        dismiss(animated: true, completion: nil)
    }
}

//Text Field에서 리턴을 누르면 다음 TextField로 이동하고
//마지막 TextField에서 리턴을 누르면 키보드가 내려간다.

extension NewBookViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Return버튼을 누를 때
        if textField == titleTextField {
            //titleTextField에서 리턴을 눌렀을때
            titleTextField.returnKeyType = .next
            return authorTextField.becomeFirstResponder()
        } else {
            //authorTextField에서 리턴을 눌렀을대
            authorTextField.returnKeyType = .done
            return textField.resignFirstResponder()
        }
    }
    //이후 Storyboard에서 각각 TextField에서 delegate를 지정해준다.
}
