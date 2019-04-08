//
//  ViewController.swift
//  iOS-best-practices
//
//  Created by Sir.DNT on 4/7/19.
//  Copyright © 2019 Sir.DNT. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tbvMain: UITableView!
    
    var listController = [ControllerInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listController = initData()
        tbvMain.delegate = self
        tbvMain.dataSource = self
    }
    
    func initData() -> Array<ControllerInfo> {
        let csvController = ControllerInfo(title: "CSV", desc: "Import & Export csv file", controller: CSVViewController(nibName: "CSVViewController", bundle: nil))
        return [csvController];
    }

}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listController[indexPath.row]
        self.present(item.controller!, animated: true, completion: nil)
    }
}

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listController.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! MainCell
        let item = listController[indexPath.row]
        cell.lbTitle.text = item.title
        cell.lbContent.text = item.desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
}

class ControllerInfo: NSObject {
    var title:String?
    var desc: String?
    var controller: UIViewController?
    
    init(title: String, desc: String, controller: UIViewController) {
        self.title = title
        self.desc = desc
        self.controller = controller
    }
}
