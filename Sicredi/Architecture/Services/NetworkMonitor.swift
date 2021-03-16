//
//  NetworkMonitor.swift
//  Sicredi
//
//  Created by Renato Ferraz on 16/03/21.
//

import Foundation
import Network

final class NetworkMonitor {
    
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor : NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    public private(set) var connectionType : ConnectionTye = .unknown 
    
    enum ConnectionTye {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init(){
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            
            self?.isConnected = path.status == .satisfied
            self?.connectionType = .wifi
            self?.getConnectionType(path)
            
        }
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
    
    public func getConnectionType(_ path: NWPath){
        
        if path.usesInterfaceType(.wifi){
            connectionType = .wifi
        }else if path.usesInterfaceType(.cellular){
            connectionType = .cellular
        }else if path.usesInterfaceType(.wiredEthernet){
            connectionType = .ethernet
        }else{
            connectionType = .unknown
        }
        
    }
    
}
