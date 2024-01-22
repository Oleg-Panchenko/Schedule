//
//  RealmModel.swift
//  Schedule
//
//  Created by Panchenko Oleg on 21.01.2024.
//

import RealmSwift
import Foundation

final class ScheduleModel: Object {
    @Persisted var taskDate: Date?
    @Persisted var taskBeginTime: Date?
    @Persisted var taskEndTime: Date?
    @Persisted var taskName: String = "Unknown"
    @Persisted var taskDescription: String = "Unknown"
    @Persisted var taskColor: String = "1A1679"
    @Persisted var scheduleWeekday: Int = 1
}
