//
//  PeriodicList.swift
//  PeriodicTable-iOS
//
//  Created by Sami Saleh on 6/5/22.
//

import UIKit
import CoreData

class PeriodicListVC: UIViewController {


    @IBOutlet var tableview: UITableView!

    var element : [PeriodicModel] = []

    var parse = ParseClass()

    override func viewDidLoad() {
        super.viewDidLoad()

        element = parse.parseToModel(file_string: "periodic_table")

        tableview.register(UINib(nibName: ElementTVCell.NibString(), bundle: nil), forCellReuseIdentifier: ElementTVCell.IdentifierString())
        tableview.delegate = self
        tableview.dataSource = self

    }



}


extension PeriodicListVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return element.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ElementTVCell.IdentifierString()) as! ElementTVCell

        cell.SetName(str: element[indexPath.row].name)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        self.performSegue(withIdentifier: "ViewControllerToElementViewer", sender: nil)
    }
}
