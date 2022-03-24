//
//  ContentView.swift
//  ImagePicker
//
//  Created by Fabrizio Petrellese on 23/03/22.
//

import SwiftUI
import PhotosUI

//struct ContentView: View {
//    @State var isPresented = false
//
//    var body: some View {
//        VStack {
//
//            Button {
//                isPresented.toggle()
//            } label: {
//                Text("Present Picker")
//            }
//        }
//        .sheet(isPresented: $isPresented) {
//            ImagePicker(sourceType: .photoLibrary)
//        }
//
//    }
//}

//struct ContentView: View {
//    @State private var isPresented = false
//
//    var body: some View {
//        Button {
//            isPresented.toggle()
//        } label: {
//            Text("Present Picker")
//        }
//        .sheet(isPresented: $isPresented) {
//            let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
//            PhotoPicker(configuration: configuration, isPresented: $isPresented)
//        }
//    }
//}

struct ContentView: View {

    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()

    var body: some View {
        VStack {

            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 500)
                .frame(width: 1 * UIScreen.main.bounds.width, height: 0.7 * UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                HStack {
//                    Image(systemName: "photo")
//                        .font(.system(size: 20))

                    Text("Camera Picker")
                        .font(.headline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
//                .background(Color.blue)
                .foregroundColor(.blue)
//                .cornerRadius(20)
                .padding(.horizontal)
                .padding()
            }
        }
        .fullScreenCover(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .camera, selectedImage: self.$image)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
