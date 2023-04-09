//
//  QuestionModel.swift
//  TaylorSwiftGuess
//
//  Created by Clarissa Velásquez Magaña on 09/04/23.
//

import SwiftUI

class QuestionModel: ObservableObject {
    
    func fetch() async -> Question?  {
        guard let url = URL(string: "https://taylorswiftapi.onrender.com/get") else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Question.self, from: data) {
                return decodedResponse.self
                
            }
        } catch {
            print("Invalid data")
            return nil
        }
        
        return nil
    }
}
