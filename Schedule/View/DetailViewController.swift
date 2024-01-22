//
//  DetailViewController.swift
//  Schedule
//
//  Created by Panchenko Oleg on 22.01.2024.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    private let taskName: UILabel = {
        var label = UILabel(text: "", font: .avenirNextDemiBold34()!)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let taskDuration: UILabel = {
        var label = UILabel(text: "", font: .avenirNextDemiBold20()!)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let taskDescription: UILabel = {
        var description = UILabel(text: "", font: .avenirNextDemiBold20()!)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .center
        description.numberOfLines = 0
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
    
    public func configure(model: ScheduleModel) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        self.taskName.text = model.taskName
        guard let startTime = model.taskBeginTime else { return }
        guard let endTime = model.taskEndTime else { return }
        let startTimeText = dateFormatter.string(from: startTime)
        let endTimeText = dateFormatter.string(from: endTime)
        self.taskDuration.text = "\(startTimeText) - \(endTimeText)"
        self.taskDescription.text = model.taskDescription
    }
}

extension DetailViewController {
    
    func setConstraints() {
        view.addSubview(taskName)
        view.addSubview(taskDuration)
        view.addSubview(taskDescription)
        
        NSLayoutConstraint.activate([
            taskName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            taskName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskName.heightAnchor.constraint(equalToConstant: 40),
            taskName.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            taskDuration.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 10),
            taskDuration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskDuration.heightAnchor.constraint(equalToConstant: 30),
            taskDuration.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskDuration.bottomAnchor),
            taskDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskDescription.heightAnchor.constraint(equalToConstant: 60),
            taskDescription.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
