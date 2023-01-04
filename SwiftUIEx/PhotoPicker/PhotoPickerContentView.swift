//
//  PhotoPickerContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2023/01/04.
//

import SwiftUI
import PhotosUI

// PhotoPickerContentView

struct PhotoPickerContentView: View {
    
    @State var isPresentPicker = false
    @State var images = [UIImage]()
    
    var body: some View {
        
        VStack {
            Button("Select Image") {
                isPresentPicker = true
            }
            
            List {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width, height: 200)
                        .listRowInsets(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                }
            }
        }.sheet(isPresented: $isPresentPicker) {
            // Picker
            
            ImagePicker(isPresent: $isPresentPicker, images: $images)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    @Binding var images: [UIImage]
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(picker: self) // 구조체 자체를 추가해줘야 한다.
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = context.coordinator // delegate 연결이 UIKit과는 다르다.
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
     
    class Coordinator: PHPickerViewControllerDelegate {
        
        var picker: ImagePicker
        
        init(picker: ImagePicker) {
            self.picker = picker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            self.picker.isPresent = false
            
            // Add Image
            for img in results {
                if img.itemProvider.canLoadObject(ofClass: UIImage.self) { // 이미지로 불러올수 있는 여부 확인
                    
                    img.itemProvider.loadObject(ofClass: UIImage.self) { loadedImage, error in
                        
                        guard let loadedImage else {
                            print("empty Image - ", error)
                            return
                        }
                        
                        self.picker.images.removeAll()
                        self.picker.images.append(loadedImage as! UIImage)
                    }
                } else {
                    print("fail loading image")
                }
            }
        }
    }
    
}

struct PhotoPickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
