//
//  DetailViewController.swift
//  ReadMe
//
//  Created by 김호준 on 2020/09/05.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    let book: Book
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet var reviewTextView: UITextView!
    
    
    @IBAction func updateImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self //set this ViewController for UIImagePickerController's delegate
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookImageView?.image = book.image
        bookImageView?.layer.cornerRadius = 16
        titleLabel.text = book.title
        authorLabel.text = book.author
        
        if let review = book.review {
            reviewTextView.text = review
        }
        
        reviewTextView.addDoneButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This should never be called")
    }
    init?(coder: NSCoder, book: Book) {
        self.book = book
        super.init(coder: coder)
    }

}

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        bookImageView.image = selectedImage
        bookImageView?.layer.cornerRadius = 16
        Library.saveImage(selectedImage, forBook: book)
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
}

extension UITextView {
    func addDoneButton() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
        toolbar.items = [flexSpace, doneButton]
        self.inputAccessoryView = toolbar
    }
}
