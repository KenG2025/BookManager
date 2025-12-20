//
//  ImageField.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/13/25.
//

import SwiftUI
import PhotosUI

struct ImageField: View {
    @Binding var image: UIImage?
    @State private var photoPicker: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(
            selection: $photoPicker,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Image(uiImage: image ?? UIImage(resource: .myBooks))//Change eto actual default
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 100)
        }.onChange(of: photoPicker){
            Task {
                            //
                            if let photoPicker,
                               let imageData = try? await photoPicker.loadTransferable(type: Data.self) {
                                if let image = UIImage(data: imageData) {
                                    self.image = image
                                }
                            }
                        }
        }
    }
}
