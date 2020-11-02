//
//  IntentHandler.swift
//  BirdsViewerIntentHandler
//
//  Created by 熊 炬 on 2020/11/02.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    
    func provideCutyOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Cuty>?, Error?) -> Void) {
        
        let cuties: [Cuty] = Bird.all.map {
            Cuty(identifier: $0.name, display: $0.name)
        }
        
        print("cuties: \(cuties.description)")
        
        completion(INObjectCollection(items: cuties), nil)
        
    }
    
    override func handler(for intent: INIntent) -> Any {
        return self
    }
    
}
