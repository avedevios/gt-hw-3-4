//
//  ViewController.swift
//  lesson4312
//
//  Created by ake11a on 2022-10-08.
//

import UIKit

enum messageStatus {
    case read
    case unread
}

struct MessageStruct {
    var text = String()
    var status: messageStatus = messageStatus.unread
}

class ViewController: UIViewController {

    var students = ["Nursultan", "Anton", "Zalkar", "Ian", "Sultan", "Nissi"]
    var studentsData = [
        MessageStruct(text: "Nursultan"),
        MessageStruct(text: "Anton"),
        MessageStruct(text: "Zalkar"),
        MessageStruct(text: "Ian")]
    
    @IBOutlet weak var studentsTableView: UITableView!
    
    var addCellButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "student_cell")
        
        addCellButton.backgroundColor = .blue
        addCellButton.setTitle("add", for: .normal)
        addCellButton.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        addCellButton.layer.cornerRadius = (view.frame.width / 4) / 2
        
        view.addSubview(addCellButton)
        addCellButton.translatesAutoresizingMaskIntoConstraints = false
        addCellButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addCellButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        addCellButton.widthAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        addCellButton.heightAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func addCell() {
        let newStudent = MessageStruct(text: "new student")
        studentsData.insert(newStudent, at: 0)
        
        studentsTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return studentsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "student_cell")
        cell.textLabel?.text = studentsData[indexPath.row].text
        cell.imageView?.image = UIImage(systemName: "person")
        
        if studentsData[indexPath.row].status == messageStatus.read {
            cell.tintColor = .green
        } else {
            cell.tintColor = .red
        }
        cell.textLabel?.textColor = cell.tintColor
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if studentsData[indexPath.row].status == messageStatus.read {
            return 100
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let infoViewController = storyboard!.instantiateViewController(withIdentifier: "info_vc") as! InfoViewController
        

        infoViewController.rowInfo = studentsData[indexPath.row].text
        studentsData[indexPath.row].status = messageStatus.read
        
        studentsTableView.reloadData()
        
        navigationController?.pushViewController(infoViewController, animated: false)
    }
}
