//
//  GridViewContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI

// GridViewContentView

enum GridType: CaseIterable {
    case single
    case double
    case triple
    case adaptive
    
    var colums: [GridItem] {
        switch self {
        case .single:
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())]
        case .adaptive:
            return [GridItem(.adaptive(minimum: 90))]
        }
    }
}

struct GridViewContentView: View {
    
    @State private var selectedGridType: GridType = .single
    
    var items = DogItem.dummyData
    
    var body: some View {
        
        VStack {
            GridTypePicker(gridType: $selectedGridType)
            
            ScrollView{
                LazyVGrid(columns: selectedGridType.colums) {
                    ForEach(items) { item in
                        
                        switch selectedGridType {
                        case .single:
                            SingleRow(item: item)
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .animation(.default)
            }
        }
        
    }
}

struct GridTypePicker: View {
    @Binding var gridType: GridType
    
    var body: some View {
        Picker("Grid Type", selection: $gridType) {
            ForEach(GridType.allCases, id: \.self) { type in
                switch type {
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                case .double:
                    Image(systemName: "square.grid.2x2")
                case .triple:
                    Image(systemName: "square.grid.3x2")
                case .adaptive:
                    Image(systemName: "square.grid.4x3.fill")
                }
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct GridViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridViewContentView()
    }
}
