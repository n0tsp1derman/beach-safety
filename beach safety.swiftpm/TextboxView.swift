//
//  TextboxView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 10/02/26.
//

import SwiftUI

struct TextboxView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Duda")
                .font(.custom("Winky", size: 48))
                .foregroundStyle(Color("boxbg"))
                .padding()
                .frame(maxWidth: 336, minHeight: 62, maxHeight: 62)
                .background(Color("brownborder"))
                .cornerRadius(30)
            
            Text("loremipsumdolorsitametloremipsumdolorsitametloremipsumdolorsitamet")
                .font(.custom("Winky", size: 48))
                .foregroundStyle(Color("brownborder"))
                .padding()
                .frame(maxWidth: 952, maxHeight: 156)
                .background(Color("boxbg"))


        }
        
    }
}

#Preview {
    TextboxView()
}
