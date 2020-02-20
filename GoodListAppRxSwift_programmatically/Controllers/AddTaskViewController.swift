//  Created by Roman Cebula on 20/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import Foundation
import UIKit
import SnapKit
import RxSwift

class AddTaskViewController: UIViewController {
  
  let addTaskSegmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: ["High","Medium","Low"])
    segmentedControl.frame(forAlignmentRect: CGRect(x: 10, y: 150, width: 250, height: 30))
    segmentedControl.selectedSegmentIndex = 0
    return segmentedControl
  }()
  
  let textField: UITextField = {
    let textField = UITextField()
    textField.attributedPlaceholder = NSAttributedString(string: "Enter Text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    textField.tintColor = .white
    textField.backgroundColor = .lightGray
    textField.textColor = .white
    textField.borderStyle = .roundedRect
    return textField
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMainView()
    setupView()
  }
  
  private func setupMainView(){
    view.backgroundColor = .white
    title = "SecondVC"
    navigationController?.navigationBar.prefersLargeTitles = true
    let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    navigationItem.rightBarButtonItem = saveButton
  }
  
  @objc private func saveButtonTapped(){
    guard let priority = Priority(rawValue: self.addTaskSegmentedControl.selectedSegmentIndex),
      let title = self.textField.text else {
        return
    }
    
    let task = Task(title: title, priority: priority)
  }
  
  private func setupView(){
    view.addSubview(addTaskSegmentedControl)
    view.addSubview(textField)
    addTaskSegmentedControl.snp.makeConstraints { (make) in
      make.topMargin.equalTo(10)
      make.centerX.equalTo(view.center)
    }
    textField.snp.makeConstraints { (make) in
      make.centerX.equalTo(view)
      make.centerY.equalTo(view)
      make.width.equalTo(200)
    }
  }
  
  
}
