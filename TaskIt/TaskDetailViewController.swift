//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by John Nguyen on 8/10/2014.
//  Copyright (c) 2014 John Nguyen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
	
	// ------------------------------------------------------------------
	//	MARK:               PROPERTIES & OUTLETS
	// ------------------------------------------------------------------
	
	var mainVC: ViewController!
	
	@IBOutlet weak var taskTextField: UITextField!
	@IBOutlet weak var subtaskTextField: UITextField!
	@IBOutlet weak var dueDatePicker: UIDatePicker!
	
	var detailTaskModel: TaskModel!
	
	// ------------------------------------------------------------------
	//	MARK:					LIFE CYCLE
	// ------------------------------------------------------------------
	
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTextField.text = detailTaskModel.task
		subtaskTextField.text = detailTaskModel.subtask
		dueDatePicker.date = detailTaskModel.date
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	// ------------------------------------------------------------------
	//	MARK:					ACTIONS
	// ------------------------------------------------------------------
	
	//
	// CANCEL BUTTON
	//
	@IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
		
		self.navigationController?.popViewControllerAnimated(true)
	}
	
	//
	// DONE BUTTON
	//
	@IBAction func doneButtonPressed(sender: UIBarButtonItem) {
		
		var task = TaskModel(task: taskTextField.text, subtask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
		mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
		navigationController?.popViewControllerAnimated(true)
	}
}
