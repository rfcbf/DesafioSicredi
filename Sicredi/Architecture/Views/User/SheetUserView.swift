//
//  SheetUserView.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import SwiftUI

struct SheetUserView: View {
    
    @State var nome: String = UserDefaults.standard[.nome]
    @State var email: String = UserDefaults.standard[.email]
    @State private var showError = false
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 5)
        {
            
            Fields(field: self.$nome,
                   placeHolder: "Nome Completo",
                   fieldValidor: .init(condition: self.nome.count >= 2, errorMessage: "Mínimo de dois caracteres para o Nome"),
                   keyboardType: .default,
                   capitalization: .sentences)
                .padding(.horizontal, 20)
            
            Fields(field: self.$email,
                   placeHolder: "Email",
                   fieldValidor: .init(condition: self.email.isValid(.email), errorMessage: "Email inválido"),
                   keyboardType: .emailAddress,
                   capitalization: .none)
                .padding(.horizontal, 20)
            
            Button(action: {
                
                if (self.nome != "" && self.email != ""){
                    UserDefaults.standard[.nome]  = self.nome
                    UserDefaults.standard[.email] = self.email
                }
                
            }, label: {
                Text("Confirmar")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background( (nome == "" || email == "") ? Color(.gray).opacity(0.5) : Color("back"))
                    .clipShape(Capsule())
            })
            .disabled(nome == "" || email == "")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 10)
            .padding()
            
        }
    }
}

struct SheetUserView_Previews: PreviewProvider {
    static var previews: some View {
        SheetUserView()
    }
}
