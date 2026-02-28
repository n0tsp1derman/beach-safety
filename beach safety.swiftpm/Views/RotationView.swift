//
//  RotationView.swift
//  Alagamar
//
//  Created by Yasmin Salamon on 27/02/26.
//

import SwiftUI

struct RotationView: View {

    var body: some View {
        ZStack {
            Color(.darkbrown)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rotate your screen to landscape mode for a better experience")
                    .font(.custom("WinkySans-Regular_Bold", size: 44))
                    .foregroundStyle(Color(.brownborder))
                    .padding(40)
                
                Image(systemName: "rectangle.landscape.rotate")
                    .font(.system(size: 64))
                    .bold()
                    .foregroundStyle(Color(.brownborder))
                
                 Spacer()
                    .frame(height: 50)
                
                
                Spacer()
            }
            .frame(width: 450, height: 500)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.amarelo))
                .stroke(Color(.brownborder), lineWidth: 5))        }
    }
}
#Preview {
    RotationView()
}
