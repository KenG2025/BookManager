//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/5/25.
//

import SwiftUI

struct CustomCapsule: View {
    // Props go right here
    var text: String
    var color = Color.accentColor // This prop has a defailt value, so its optional
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
