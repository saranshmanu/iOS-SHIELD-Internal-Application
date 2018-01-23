//
//  MembersViewController.swift
//  SHIELD
//
//  Created by Saransh Mittal on 07/01/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var registrationNumberLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var membersTableView: UITableView!
    
    var i = 0
    @IBAction func statusToggle(_ sender: Any) {
        if i%2 == 0{
            availableLabel.isHidden = true
        } else {
            availableLabel.isHidden = false
        }
        i = i + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.members.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = membersTableView.dequeueReusableCell(withIdentifier: "members", for: indexPath as IndexPath) as! MembersTableViewCell
        cell.status.backgroundColor = UIColor.clear
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        membersTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        membersTableView.delegate = self
        membersTableView.dataSource = self
        nameLabel.text = Data.name
        departmentLabel.text = Data.findDepartmentName(departmentCode: Data.departmentCode) + " Department"
        registrationNumberLabel.text = Data.registrationNumber
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//        @IBOutlet weak var animation: UIView!
//        let animationView = LOTAnimationView(name: "data")
//        animationView?.frame = CGRect(x: -65, y: -77, width: 200, height: 200)
////        animationView?.center = self.animation.center
//        animationView?.contentMode = .scaleAspectFill
//        animationView?.loopAnimation = true
//        animation.addSubview(animationView!)
//        animationView?.play()
