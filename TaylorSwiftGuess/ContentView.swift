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
//            Rectangle()
//                    .foregroundColor(.clear)
//                    .background(RadialGradient(gradient: Gradient(colors: [Color(red: 0.21, green: 0.30, blue: 0.33), Color(red: 0.91, green: 0.91, blue: 0.88)]), center: .center, startRadius: 170, endRadius: 650))
            
            FloatingClouds()
            
            ZStack {
                VStack {
                    Text("Taylor Swift")
                        .font (
                            .system(size: 50, weight: .semibold)
                        )
                        .padding(.bottom, 50)
                        .overlay {
                                LinearGradient(
                                    colors: [Color(red: 0.26, green: 0.32, blue: 0.50), Color(red: 0.39, green: 0.51, blue: 0.58), Color(red: 0.52, green: 0.63, blue: 0.65)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .mask(
                                    Text("Taylor Swift")
                                        .font (
                                            .system(size: 50, weight: .semibold)
                                        )
                                        .padding(.bottom, 50)
                                )
                            }
                    
                    Text("Guess the...")
                        .font (
                            .system (
                                .title
                            )
                            .weight(.light)
                        )
                        .italic()
                        .foregroundColor(Color(red: 0.58, green: 0.52, blue: 0.30))
                    
                    Button {
                        
                    } label: {
                        Text("Song")
                            .frame(maxWidth: 180)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(50)
                    .tint(Color(red: 0.27, green: 0.33, blue: 0.30))
                    .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                        )
                    .padding(15)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Album")
                            .frame(maxWidth: 180)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(50)
                    .tint(Color(red: 0.43, green: 0.25, blue: 0.25))
                    .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                        )
                    
                        
                }
            }
            
        }
    }
}

struct Cloud: View {
    @StateObject var provider = CloudProvider()
    @State var move = false
    let alignment: Alignment
    let proxy: GeometryProxy
    let color: Color
    let rotationStart: Double
    let duration: Double
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(height: proxy.size.height / provider.frameHeightRatio)
            .offset(provider.offset)
            .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360))
            .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .opacity(0.8)
            .onAppear {
                move.toggle()
            }
    }
}

class CloudProvider: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat
    init() {
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150), height: CGFloat.random(in: -150 ..< 150))
    }
}

struct FloatingClouds: View {
    let blur: CGFloat = 60
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(red: 0.08, green: 0.12, blue: 0.17)
                ZStack {
                    Cloud(alignment: .topLeading,
                          proxy: proxy,
                          color: Color(red: 0.35, green: 0.46, blue: 0.57, opacity: 0.5),
                          rotationStart: 240,
                          duration: 50)
                    Cloud(alignment: .topTrailing,
                          proxy: proxy,
                          color: Color(red: 0.30, green: 0.21, blue: 0.24, opacity: 0.61),
                          rotationStart: 180,
                          duration: 70)
                    Cloud(alignment: .bottomLeading,
                          proxy: proxy,
                          color: Color(red: 0.20, green: 0.29, blue: 0.33, opacity: 0.5),
                          rotationStart: 120,
                          duration: 80
                    )
                    Cloud(alignment: .bottomTrailing,
                          proxy: proxy,
                          color: Color(red: 0.51, green: 0.47, blue: 0.53, opacity: 0.5),
                          rotationStart: 0,
                          duration: 60)
                }
                .blur(radius: blur)
            }
            .ignoresSafeArea()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
