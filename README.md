# Camera Picker
#### How to create a camera picker in SwiftUI with UIImagePickerController
## Table of contents
* [General Info](#general-info)
* [Explanation](#explanation)
* [Project Status](#project-status)
* [Contact](#contact)
## General Info
The camera picker is still only available in UIKit, so if you're working on a SwiftUI app, you may need to allow your users to take photos, this project will show you how to integrate UIImagePickerController class into your SwiftUI view.
## Explanation
Let's start integrating UIImagePickerController in your project by wrapping the controller using the UIViewControllerRepresentable protocol and implement the required methods:

`struct ImagePicker: UIViewControllerRepresentable {
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    
    
 
        // Return an instance of UIImagePickerController
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
}`

## Project Status
Project is: complete.
## Contact
