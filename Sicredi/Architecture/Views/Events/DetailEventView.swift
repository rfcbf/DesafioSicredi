//
//  DetailEventView.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import SwiftUI
import PartialSheet
import SDWebImageSwiftUI
import MapKit
import AlertToast

struct Pin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct DetailEventView: View {

    @ObservedObject var eventsVM : EventsViewModel
    
    var animation: Namespace.ID
    var event : Events
    @Binding var show : Bool
    
    @State private var region = MKCoordinateRegion.defaultRegion
    @State var annotation : [Pin] = [Pin(coordinate: .init(latitude: 0, longitude: 0))]
    @State var isShowShared : Bool = false
    @State private var showErrorLogin = false
    @State private var showErrorCheckin = false
    @State private var showCheckin = false
    
    private func setCurrentLocation() {
        region = MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude) , span: MKCoordinateSpan(
            latitudeDelta: 0.0075,
            longitudeDelta: 0.0075
        ))
    }


    var body: some View {
        
        ZStack {
            Background()
            
            VStack{
                
                ZStack {
                    WebImage(url: event.image)
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(Color.gray.opacity(0.5)).frame(width: 0, height: 0)
                        }
                        .placeholder(content: {
                            Image("sicredieventos").resizable().aspectRatio(contentMode: .fit)
                        })
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                        .cornerRadius(25)
                        .clipShape(Rectangle())
                }
                
                
                ScrollView{
                        VStack(alignment: .leading) {
                            Text(Utils().convertDateToString(event.date ?? Date()))
                                .font(.headline)
                                .foregroundColor(.secondary)

                            Text(event.title)
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                                .padding(.bottom, 20)
                            
                                
                            Text(event.description)
                                .font(.headline)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.secondary)
                            
                            Divider()

                            Map(coordinateRegion: $region, annotationItems: annotation) { pin in
                                MapPin(coordinate: pin.coordinate, tint: .green)
                            }
                            .frame(height: 300)
                            .cornerRadius(30)

                            Divider()

                            VStack(alignment: .trailing) {
                                HStack(alignment: .center){
                                    Spacer()
                                    Text("Custo do evento:")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                        .padding(.trailing, -10)
                                    Text( Utils().convertFloatToMoney(event.price) )
                                        .font(.body).bold()
                                        .foregroundColor(Color("font"))
                                        .frame(height: 40, alignment: .trailing)
                                        .padding()
                                }
                                .padding(.trailing)
                            }
                            .background(.white)
                            .cornerRadius(25)
                            .clipShape(Rectangle())
                            .shadow(radius: 3)

                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .layoutPriority(100)
                        .padding(.bottom, 60)
                        .padding()

                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Background()
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: event.id, in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            .padding(.all, 20)

            VStack{
                Spacer()
                HStack(alignment: .center, spacing: 30, content: {

                    Button(action: { isShowShared.toggle() }, label: {
                        
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("font"))
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                    .padding(.leading, 20)
                    
                    .actionSheet(isPresented: $isShowShared){
                        
                        return ActionSheet(title: Text("Compartilhamento"), message: Text("O que deseja compartilhar?"), buttons: [
                            
                            .default(Text("Dados do Evento")) {
                                sharedInfo()
                            },
                            .default(Text("Abrir localização do Apple Maps")){
                                openMaps(nameEvent: event.title, latitude: event.latitude, longitude: event.longitude)
                            },
                            .cancel()
                        ])
                        
                    }
                    
                    Spacer()

                    Button(action: {
                        
                        if (UserDefaults.standard[.nome] != "" || UserDefaults.standard[.email] != "") {

                            eventsVM.sendCheckin(id: event.id,
                                                 name: UserDefaults.standard[.nome],
                                                 email: UserDefaults.standard[.email],
                                                 
                                                 completion: { result in
                                                    if result {
                                                        showCheckin.toggle()
                                                    }else{
                                                        showErrorCheckin.toggle()
                                                    }
                                                 })
                        }else{
                            //nao tem o cadastro realizado
                            showErrorLogin.toggle()
                        }
                        
                        
                        
                        
                    }, label: {
                        
                        Image(systemName: "person.fill.checkmark")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("font"))
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })

                    Spacer()

                    Button(action: CloseView, label: {
                        
                        Image(systemName: "arrow.down")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("font"))
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                    .padding(.trailing, 20)

                })
            }

        }
        .onAppear(perform: {

            self.annotation.removeAll()
            self.annotation.append(Pin(coordinate: .init(latitude: event.latitude, longitude: event.longitude)))

            setCurrentLocation()

        })
        .toast(isPresenting: $showErrorLogin, duration: 3, tapToDismiss: true) { () -> AlertToast in
            AlertToast(displayMode: .hud, type: .systemImage("xmark", .white), title: "Dados de Usuário", subTitle: "Favor preencher Nome e Email do usuário", custom: .custom(backgroundColor: .red, titleColor: .white, subTitleColor: .white))
        }
        .toast(isPresenting: $showErrorCheckin, duration: 3, tapToDismiss: true) { () -> AlertToast in
            AlertToast(displayMode: .hud, type: .systemImage("xmark", .white), title: "Check-In", subTitle: "Não foi possível realizar o Check-In", custom: .custom(backgroundColor: .red, titleColor: .white, subTitleColor: .white))
        }
        .toast(isPresenting: $showCheckin, duration: 3, tapToDismiss: true) { () -> AlertToast in
            AlertToast(displayMode: .hud, type: .systemImage("checkmark", .white), title: "Check-In", subTitle: "Check-In realizado com sucesso.", custom: .custom(backgroundColor: .green, titleColor: .white, subTitleColor: .white))
        }

    }
    
    func openMaps(nameEvent: String, latitude: Double, longitude: Double){
        
        let coords = CLLocationCoordinate2DMake(latitude, longitude)
        let place = MKPlacemark(coordinate: coords)
        
        let mapItem = MKMapItem(placemark: place)
        mapItem.name = nameEvent
        mapItem.openInMaps(launchOptions: nil)
        
    }
    
    func sharedInfo() {
        let data = "\(Utils().convertDateToString(event.date ?? Date()))\n\(event.description)\n\(event.description)\n\(Utils().convertFloatToMoney(event.price))"
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    func CloseView(){
        
        withAnimation(.spring()){
            show.toggle()
        }
    }
}

struct DetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(eventsVM: EventsViewModel(eventService: EventService())).environmentObject(PartialSheetManager())
    }
}
