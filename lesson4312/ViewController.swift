//
//  ViewController.swift
//  lesson4312
//
//  Created by ake11a on 2022-10-08.
//

import UIKit

class ViewController: UIViewController {

    var students = ["Nursultan", "Anton", "Zalkar", "Ian", "Sultan", "Nissi"]
    
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
        students.insert("new student", at: 0)
        
        studentsTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "student_cell")
        cell.textLabel?.text = students[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "person")
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let infoViewController = storyboard!.instantiateViewController(withIdentifier: "info_vc") as! InfoViewController
        

        infoViewController.rowInfo = students[indexPath.row]
        
        navigationController?.pushViewController(infoViewController, animated: false)
    }
}
