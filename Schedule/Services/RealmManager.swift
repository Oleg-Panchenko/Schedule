//
//  RealmManager.swift
//  Schedule
//
//  Created by Panchenko Oleg on 21.01.2024.
//

import RealmSwift
import SwiftUI

final class RealmManager {
    static var shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    
    //ScheduleModel
    func saveScheduleModel(model: ScheduleModel) {
        
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteScheduleModel(model: ScheduleModel) {

        try! localRealm.write {
            localRealm.delete(model)
        }
    }
}
