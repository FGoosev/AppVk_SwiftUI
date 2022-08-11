//
//  SearchTextField.swift
//  AppVk
//
//  Created by Alexandr Gusev on 11.08.2022.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var search: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
                .padding(.leading, 5)
            TextField("Найти", text: $search)
        }
        .frame(height: 35)
        .background(Color.gray.opacity(0.2))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5))
        .padding(.bottom, 10)
        .padding(.top, 10)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(search: .constant(""))
    }
}
