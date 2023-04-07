//
//  ContentView.swift
//  TaylorSwiftGuess
//
//  Created by Clarissa Velásquez Magaña on 06/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("taylor_home")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, Color(red: 0.96, green: 0.74, blue: 0.86)]), startPoint: .center, endPoint: .bottom))
            
            ZStack {
                VStack {
                    Text("Guess the...")
                        .font (
                            .system (
                                .title
                            )
                            .weight(.light)
                        )
                        .italic()
                        .foregroundColor(Color(red: 1.00, green: 0.95, blue: 0.39))
                        .padding(.bottom, 15)
                    
                    Button {
                        
                    } label: {
                        Text("Song")
                            .frame(maxWidth: 180)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(50)
                    .tint(Color(red: 0.72, green: 0.24, blue: 0.42))
                    .padding(15)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Album")
                            .frame(maxWidth: 180)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(50)
                    .tint(Color(red: 0.44, green: 0.58, blue: 0.71))
                        
                }
                .padding(.top, 440)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
