//
//  QuestionView.swift
//  TaylorSwiftGuess
//
//  Created by Clarissa Velásquez Magaña on 08/04/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var selectedSong: Bool
    var question = QuestionModel()
    @State private var quote: String = ""
    @State private var song: String = ""
    @State private var album: String = ""
    @State private var userInput: String = ""
    @State private var showResult: Bool = false
    @State private var disableTextField = false

    
    var body: some View {
        ZStack {
            Color(red: 0.08, green: 0.12, blue: 0.17)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Card()
                    .frame(width: 310, height: 230)
                    .clipped()
                    .cornerRadius(25)
                    .overlay() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(red: 0.75, green: 0.67, blue: 0.84, opacity: 0.5))
                            .frame(width: 300, height: 220)
                            .overlay() {
                                Text(quote)
                                    .font (
                                        .system(size: 25)
                                        .italic()
                                        )
                                        //.foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.17))
                                        .minimumScaleFactor(0.01)
                                        .foregroundColor(.white)
                                        .padding()
                                
                            }
                    }
                Spacer()
                
           
                if verifyAnswer(input: userInput, answer: selectedSong ? song : album) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .opacity(showResult ? 1 : 0)
                            Text("Correct")
                                .foregroundColor(.green)
                                .opacity(showResult ? 1 : 0)
                        }
                        .offset(y:-40)
                    } else {
                        HStack {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.red)
                                .opacity(showResult ? 1 : 0)
                            Text("Incorrect")
                                .foregroundColor(.red)
                                .opacity(showResult ? 1 : 0)
                        }
                        .offset(y:-40)
                    }
                
                
                TextField(selectedSong ? "Song" : "Album", text: $userInput)
                    .frame(width: 230, height: 30)
                    .padding(10)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.17))
                    .background() {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                            
                    }
                    .disabled(disableTextField)
                    .onSubmit {
                        showResult = true
                        disableTextField = true
                    }
                    
                Spacer()
                Button {
                    
                    var questionToDisplay: Question?
                    Task {
                        questionToDisplay = await question.fetch()
                        quote = questionToDisplay?.quote ?? "Error at fetching data"
                        song = questionToDisplay?.song ?? "Error at fetching data"
                        album = questionToDisplay?.album ?? "Error at fetching data"
                    }
                    showResult = false
                    userInput = ""
                    disableTextField = false
                    
                } label: {
                    Text("Next")
                        .frame(maxWidth: 80)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
                    .cornerRadius(10)
                    .tint(Color(red: 0.58, green: 0.52, blue: 0.30, opacity: 0.7))
                Spacer()
                    
                
                    
            }
            .onAppear() {
                
                var questionToDisplay: Question?
                Task {
                    questionToDisplay = await question.fetch()
                    quote = questionToDisplay?.quote ?? "Error at fetching data"
                    song = questionToDisplay?.song ?? "Error at fetching data"
                    album = questionToDisplay?.album ?? "Error at fetching data"
                }
                
            }
            
        }
        
    }
}

func verifyAnswer(input : String, answer : String) -> Bool {
    if input.lowercased() == answer.lowercased() {
        return true
    }
    return false
}

struct Card: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red: 0.52, green: 0.63, blue: 0.65))
                .blur(radius: 10)
                .offset(x: animate ? 10 : 130, y: animate ? 20 : 160)
                .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.58, green: 0.52, blue: 0.30))
                .blur(radius: 20)
                .offset(x: animate ? -120 : 10, y: animate ? -100 : 20)
                .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
            Rectangle()
                .fill(Color(red: 0.58, green: 0.52, blue: 0.30))
                .blur(radius: 30)
                .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
            
            Capsule()
                .fill(Color(red: 0.43, green: 0.25, blue: 0.25))
                .blur(radius: 40)
                .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
            
            Circle()
                .fill(Color(red: 0.08, green: 0.12, blue: 0.17))
                .blur(radius: 50)
                .offset(x: animate ? 90 : -10,y: animate ? -90 : 40)
                .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.02, green: 0.15, blue: 0.25))
                .blur(radius: 60)
                .offset(x: animate ? -200 : 40, y: animate ? 200 : -20)
                .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
            
            Capsule()
                .fill(Color(red: 0.58, green: 0.52, blue: 0.30, opacity: 0.8))
                .blur(radius: 70)
                .offset(x: animate ? 10 : 170 ,y: animate ? 0 : -150)
                .opacity(0.4)
                 .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
        }
        .onAppear() {
            withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                    animate.toggle()
            }
        }
        
    }
        
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(selectedSong: .constant(true))
    }
}
