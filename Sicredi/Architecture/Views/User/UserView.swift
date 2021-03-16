//
//  UserView.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import SwiftUI
import AlertToast
import SwiftUIX

struct UserView: View {
    
    @State var nome: String = ""
    @State var email: String = ""
    @State private var showError = false
    
    var body: some View {
        
        ZStack(){
            Background()
            
            GeometryReader(){ geo in
                VStack{
                    
                    Image("sicredi")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: geo.size.width / 2)
                        .padding()
                    
                    Text("Eventos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("font"))
                        .multilineTextAlignment(.center)
                        .padding(.top, -20)
                    
                    Spacer()
                    
                    VisualEffectBlurView(blurStyle: .light){
                        
                        VStack(alignment: .center, spacing: 20, content: {
                            Spacer()
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
                                
                                let eventsService = EventService()
                                let vm = EventsViewModel(eventService: eventsService)
                                
                                if (self.nome != "" && self.email != ""){
                                    
                                    UserDefaults.standard[.nome] = self.nome
                                    UserDefaults.standard[.email] = self.email
                                    
                                    UIApplication.shared.windows.first?.rootViewController =
                                        UIHostingController(rootView: EventsView(eventsVM: vm))
                                }else{
                                    //campos obrigatorios
                                    showError.toggle()
                                }
                                
                            }, label: {
                                Text("Continuar")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .background(Color("back"))
                                    .clipShape(Capsule())
                            })
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            
                            Spacer()
                            
                        })
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300 , alignment: .center)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.white, lineWidth: 0.5))
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 10)
                    .padding()
                    
                }.padding()
            }
        }
        .toast(isPresenting: $showError, duration: 3, tapToDismiss: true) { () -> AlertToast in
            AlertToast(displayMode: .hud, type: .systemImage("xmark", .white), title: "Campos Obrigatórios", subTitle: "Favor preencher Nome e Email", custom: .custom(backgroundColor: .red, titleColor: .white, subTitleColor: .white))
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
