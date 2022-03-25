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
Once created the CameraPicker, you will have to use it in your ContentView, like this:
```
struct ContentView: View {

    @State private var showCamera = false
    @State private var image = UIImage()

    var body: some View {
        VStack {

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 1 * UIScreen.main.bounds.width, height: 0.7 * UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            Button {
                showCamera = true
            } label: {
                Text("Camera Picker")
                .font(.title2)
                .padding()
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraPicker(sourceType: .camera)
                .ignoresSafeArea()
        }
    }
}
```

## Project Status
Project is: complete.
## Contact
