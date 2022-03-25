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
Let's start creating a new Swift file named CameraPicker and then creating a struct:
```
import SwiftUI

struct CameraPicker: UIViewControllerRepresentable {
 
    var sourceType: UIImagePickerController.SourceType = .camera
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraPicker>) -> UIImagePickerController {
 
        let cameraPicker = UIImagePickerController()
        cameraPicker.allowsEditing = false
        cameraPicker.sourceType = sourceType
 
        return cameraPicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraPicker>) {
    // No code needed here
    }
}
```
Next, you will have to create a CameraPicker struct in SwiftUI:
```
import SwiftUI
```

## Project Status
Project is: complete.
## Contact
