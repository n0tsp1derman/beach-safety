//
//  CreditsView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 25/02/26.
//

import SwiftUI

struct CreditsView: View {
    
    var onClose:(() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                HStack (alignment: .top){
                    Button {
                        if let onClose = onClose {
                            onClose()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(.brownborder))
                            .font(.largeTitle)
                            .bold()
                    Spacer()
                    }
                    .padding()
                }
                Text("About")
                    .font(.custom("WinkySans-Regular_Bold", size: 48))
                    .foregroundStyle(Color(.brownborder))
                
                 Spacer()
                    .frame(height: 10)
                
                ScrollView {
                    VStack (spacing: 20){
                        
                        Text("Dedicated to all the children with a head in the clouds.")
                            .font(.custom("WinkySans-Regular", size: 24))
                            .padding()
                        
                        Text("**Alagamar** is a regional word in brazilian portuguese for the phenomenon of the rip current, also known as riptide. This app was designed to teach children how to behave when caught in a riptide, in a fun and intuitive way.")
                            .font(.custom("WinkySans-Regular", size: 24))
                        
                        Text("Script, art, design and coding by **Yasmin Salamon**, with the help of many lovely friends. Thank you for your attention.")
                            .font(.custom("WinkySans-Regular", size: 24))
                        
                        Text("**SOUND EFFECTS**")
                            .font(.custom("WinkySans-Regular", size: 24))
                        
                        Text("""
All sound effects are free for personal use, credited below.

**Ocean Waves:** DRAGON-STUDIO on Pixabay
**Minimalist Button Hover Sound Effect:** Lesiakower on Pixabay
**DR Dubby Move Snare 4:** by deadrobotmusic on Freesound
**SPLASH (by blaukreuz):** freesound_community on Pixabay
**Success:** by UpdatePelgo on Pixabay
""")
                            .font(.custom("WinkySans-Regular", size: 24))
                        
                    }
                    Spacer()
                        .frame(height: 50)
                }
                .padding(.horizontal, 30)
                Spacer()
            }
            .frame(width: 450, height: 550)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.amarelo))
                .stroke(Color(.brownborder), lineWidth: 5)) 
        }
    }
}

#Preview (traits: .landscapeLeft){
    CreditsView()
}
