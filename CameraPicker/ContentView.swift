//
//  ContentView.swift
//  CameraPicker
//
//  Created by Fabrizio Petrellese on 23/03/22.
//

import SwiftUI

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
            CameraPicker(sourceType: .camera, selectedImage: $image)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
