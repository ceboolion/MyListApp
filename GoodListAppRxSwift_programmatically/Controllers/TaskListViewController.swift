//  Created by Roman Cebula on 19/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import Foundation
import UIKit
import SnapKit

class TaskListViewController: UIViewController {
  
  let cell = "TaskTableViewCell"
  
  let segmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: ["All","High","Medium","Low"])
    segmentedControl.frame = CGRect(x: 10, y: 150, width: 300, height: 30)
    segmentedControl.selectedSegmentIndex = 0
    return segmentedControl
  }()
  
  let tableVIew: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMainView()
    setupItemsView()
  }
  
  private func setupMainView(){
    view.backgroundColor = .white
    title = "GoodList"
    navigationController?.navigationBar.prefersLargeTitles = true
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    navigationItem.rightBarButtonItem = addButton
  }
  
  @objc private func addButtonPressed(){
    let taskVC = AddTaskViewController()
    let navVC = UINavigationController(rootViewController: taskVC)
    present(navVC, animated: true, completion: nil)
  }
  
  private func setupItemsView(){
    view.addSubview(segmentedControl)
    view.addSubview(tableVIew)
    segmentedControl.snp.makeConstraints { (make) in
      make.centerX.equalTo(view)
      make.topMargin.equalTo(10)
    }
    tableVIew.snp.makeConstraints { (make) in
      make.top.equalTo(segmentedControl).offset(35)
      make.leading.equalTo(view)
      make.trailing.equalTo(view)
      make.bottom.equalTo(view)
    }
  }
  
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: self.cell, for: indexPath)
    return cell
  }
  
  
}
