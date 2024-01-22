//
//  ScheduleTableViewCell.swift
//  Schedule
//
//  Created by Panchenko Oleg on 21.01.2024.
//

import UIKit
 
final class ScheduleTableViewCell: UITableViewCell {
    
    let taskName = UILabel(text: "", font: .avenirNextDemiBold20()!)
    let taskStartTime = UILabel(text: "", font: .avenirNextDemiBold20()!)
    let taskEndTime = UILabel(text: "", font: .avenirNextDemiBold20()!)
    let taskDescription = UILabel(text: "", font: .avenirNextDemiBold14()!)
    
    let timerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "timer")
        imageView.tintColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setConstraints()
        self.selectionStyle = .none
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ScheduleModel) {
            
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        taskName.text = model.taskName
        guard let startTime = model.taskBeginTime else { return }
        guard let endTime = model.taskEndTime else { return }
        taskStartTime.text = dateFormatter.string(from: startTime)
        taskEndTime.text = dateFormatter.string(from: endTime)
        taskDescription.text = model.taskDescription
        backgroundColor = UIColor().colorFromHex("\(model.taskColor)")
    }
    
}

extension ScheduleTableViewCell {
    
    func setConstraints() {
        
        self.addSubview(taskName)
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            taskName.widthAnchor.constraint(equalToConstant: 200),
            taskName.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        taskStartTime.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(taskStartTime)
        NSLayoutConstraint.activate([
            taskStartTime.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            taskStartTime.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            taskStartTime.widthAnchor.constraint(equalToConstant: 60),
            taskStartTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        taskEndTime.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerImage)
        NSLayoutConstraint.activate([
            timerImage.topAnchor.constraint(equalTo: taskStartTime.bottomAnchor),
            timerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            timerImage.widthAnchor.constraint(equalToConstant: 20),
            timerImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.addSubview(taskEndTime)
        NSLayoutConstraint.activate([
            taskEndTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            taskEndTime.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            taskEndTime.widthAnchor.constraint(equalToConstant: 60),
            taskEndTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(taskDescription)
        taskDescription.numberOfLines = 0
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            taskDescription.trailingAnchor.constraint(equalTo: taskEndTime.leadingAnchor, constant: -8),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
