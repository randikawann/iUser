//
//  CommonTextField.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

struct CommonTextField: View {
    var hint: String = ""
    @Binding var value: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 1) {
            TextField(hint, text: $value)
            
        }.padding()
            .background(Color(.white))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    PreviewCommonTextField()
}

struct PreviewCommonTextField: View {
    
    var hint = "hint"
    @State private var value = "Example"
    
    var body: some View {
        CommonTextField(hint: hint, value: $value)
    }
}
