//
//  ScheduleOptionsTableViewController.swift
//  Schedule
//
//  Created by Panchenko Oleg on 21.01.2024.
//

import UIKit

final class ScheduleOptionsTableViewController: UITableViewController {
    
    private let idOptionsScheduleCell = "idOptionsScheduleCell"
    private let idOptionsScheduleHeader = "idOptionsScheduleHeader"
        
    let headerNameArray = ["DATE AND TIME", "TASK", "COLOR"]
    
    var cellNameArray = [["Date", "Start Time", "End Time"],
                         ["Task Name", "Task Description"],
                         [""]]
    
    var hexColorCell = "1A1679"
    
    //ScheduleModel
    var scheduleModel = ScheduleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Schedule"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))

    }
    
    @objc private func saveButtonTapped() {
        
        if scheduleModel.taskDate == nil || scheduleModel.taskBeginTime == nil || scheduleModel.taskName == "Unknown" {
            saveAlert(title: "Warning!", message: "Fill DATE, TIME, TASK NAME fields")
        } else {
            scheduleModel.taskColor = hexColorCell
            RealmManager.shared.saveScheduleModel(model: scheduleModel)
            scheduleModel = ScheduleModel()
            saveAlert(title: "Success", message: nil)
            hexColorCell = "1A1679"
            tableView.reloadData()
            print(hexColorCell)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 2
        case 2: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as! OptionsTableViewCell
        cell.cellScheduleConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        switch indexPath {
        case [0,0]: dateAlert(label: cell.nameCellLabel) { (numberWeekday, date) in
            self.scheduleModel.taskDate = date
            self.scheduleModel.scheduleWeekday = numberWeekday
        }
        case [0,1]: timeAlert(label: cell.nameCellLabel) { (timeSchedule) in
            self.scheduleModel.taskBeginTime = timeSchedule
        }
        case [0,2]: timeAlert(label: cell.nameCellLabel) { (timeSchedule) in
            self.scheduleModel.taskEndTime = timeSchedule
        }

        case [1,0]: cellNameAlert(label: cell.nameCellLabel, name: "Task Name", placeholder: "Enter task name") { name in
            self.scheduleModel.taskName = name
        }
        case [1,1]: cellNameAlert(label: cell.nameCellLabel, name: "Task description", placeholder: "Enter description") { description in
            self.scheduleModel.taskDescription = description
        }
        case [2,0]: pushControllers(vc: ScheduleColorsViewController())
        default: print("Tap OptionsTableView")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}
