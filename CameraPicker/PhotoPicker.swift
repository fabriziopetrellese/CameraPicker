//
//  PhotoPicker.swift
//  ImagePicker
//
//  Created by Fabrizio Petrellese on 24/03/22.
//

//import SwiftUI
//import PhotosUI
//
//struct PhotoPicker: UIViewControllerRepresentable {
//    let configuration: PHPickerConfiguration
//    @Binding var isPresented: Bool
//    @Environment(\.presentationMode) private var presentationMode
//
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        let controller = PHPickerViewController(configuration: configuration)
//        controller.delegate = context.coordinator
//        return controller
//    }
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    //coordinator act as your PHPickerViewControllerDelegate
//    class Coordinator: PHPickerViewControllerDelegate {
//
//        private let parent: PhotoPicker
//
//        init(_ parent: PhotoPicker) {
//            self.parent = parent
//        }
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            parent.isPresented = false //false because picking has finished
//        }
//    }
//}
