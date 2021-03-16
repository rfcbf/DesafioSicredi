//
//  ContentView.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI
import SwiftUIX
import SDWebImageSwiftUI
import PartialSheet
import AlertToast

struct EventsView: View {
    
    @ObservedObject var eventsVM : EventsViewModel
    @Namespace var animation
    @State var showDetail = false
    @State var selected: Events?
    
    let sheetManager: PartialSheetManager = PartialSheetManager()
    let sheetStyle = PartialSheetStyle(background: .blur(.light),
                                       handlerBarColor: Color(UIColor.systemGray2),
                                       enableCover: true,
                                       coverColor: Color.black.opacity(0.4),
                                       blurEffectStyle: nil,
                                       cornerRadius: 10,
                                       minTopDistance: UIScreen.screenHeight / 1.8
    )
    
    var body: some View {
        
        ZStack(){
            Background()
            
            VStack{
                barTitle.padding()
                content
            }
            
            if showDetail {
                DetailEventView(eventsVM: eventsVM, animation: animation, event: selected!, show: $showDetail)
            }
            
        }
        .addPartialSheet(style: self.sheetStyle)
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(self.sheetManager)
        .onAppear{
            eventsVM.getAll()
        }
        
    }
    
    var barTitle: some View {
        
        VStack{
            HStack(alignment: .center, spacing: 5, content: {
                Text("Lista de Eventos")
                    .font(.title).bold()
                
                Spacer()
                
                Button(action: {
                    self.sheetManager.showPartialSheet({
                        print("Fechou perfil")
                    }) {
                        SheetUserView()
                    }
                    
                }, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                })
                
            })
            .frame(height: 30)
        }
        .padding(10)
    }
    
    var content: some View {
        
        
        ScrollView(.vertical, showsIndicators: false, content: {
            ForEach(eventsVM.events) { event in
                CardView(event: event)
                    .background(Color(.white))
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.black, lineWidth: 0.5))
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 10)
                    .padding(.all, 10)
                    .onTapGesture {
                        withAnimation(.spring()){
                            
                            selected = event
                            showDetail.toggle()
                            
                        }
                    }
                    .matchedGeometryEffect(id: event.id, in: animation)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(eventsVM: EventsViewModel(eventService: EventService())).environmentObject(PartialSheetManager())
    }
}
