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
Right now, when you are going to take a photo, the app will just dismiss the camera and go back to the main screen, without saving the photo, so, in order to avoid this, you will have to follow the next 2 steps:
* 1: Go back to CameraPicker.swift, and declare these 2 var:
```
@Binding var selectedImage: UIImage
@Environment(\.presentationMode) private var presentationMode
```
* 2: Staying in CameraPicker, create the Coordinator class:
```
final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: CameraPicker

        init(_ parent: CameraPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
```
After this, the next 2 steps you will have to do are:
* Creating the makeCoordinator method and return an instance of Coordinator:
```
func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
```
* Assign the coordinator as the delegate of UIImagePickerController in the makeUIViewController:
```
cameraPicker.delegate = context.coordinator
```
So, update the .fullScreenCover modifier:
```
.fullScreenCover(isPresented: $showCamera) {
            CameraPicker(sourceType: .camera, selectedImage: $image)
                .ignoresSafeArea()
        }
```
## Project Status
Project is: complete.
## Contact
