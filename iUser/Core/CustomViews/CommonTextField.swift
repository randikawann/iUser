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
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(hint, text: $value)
                .font(.system(size: 16))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
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
