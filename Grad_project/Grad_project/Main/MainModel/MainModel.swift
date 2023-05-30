//
//  MainModel.swift
//  Grad_project
//
//  Created by Amalie Morch on 02/05/2023.
//

import Foundation

struct WorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    var environment: Bool
    let title: String
    let interval: String
    let BPM: String
    let time: String
    let notes: String
    let goal: String
}

struct MiniWorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let interval: String
//    let BPM: Int
    let time: String
    var liked: Bool
}

struct SavedWorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    let environment: String
    let interval: String
    let BPM: String
    let time: String
    var liked: Bool
}

struct AddWorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    let environment: String
    let date: Date
    let interval: String
    let BPM: String
    let time: String
    let notes: String
    let goal: String
    var goalCompleted: Bool
}

struct MiniRecentWorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    let environment: String
    let BPM: String
    let time: String
    let distance: String
    let goal: String
    var goalCompleted: Bool
}

struct SummaryWorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let BPM: String
    let time: String
    let distance: String
    let goal: String
}

struct ChallengeWorkoutModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let time: String
    let description: String
}
