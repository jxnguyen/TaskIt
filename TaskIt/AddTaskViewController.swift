//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by John Nguyen on 8/10/2014.
//  Copyright (c) 2014 John Nguyen. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
	
	// ------------------------------------------------------------------
	//	MARK:               PROPERTIES & OUTLETS
	// ------------------------------------------------------------------
	
	var mainVC: ViewController!
	
	@IBOutlet weak var taskTextField: UITextField!
	@IBOutlet weak var subtaskTextField: UITextField!
	@IBOutlet weak var dueDatePicker: UIDatePicker!
	
	
	// ------------------------------------------------------------------
	//	MARK:					LIFE CYCLE
	// ------------------------------------------------------------------
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	// ------------------------------------------------------------------
	//	MARK:					ACTIONS
	// ------------------------------------------------------------------
	
	//
	// CANCEL BUTTON
	//
	@IBAction func cancelButtonPressed(sender: UIButton) {
		
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	//
	// ADD TASK BUTTON
	//
	@IBAction func addTaskButtonPressed(sender: UIButton) {
		
		var task = TaskModel(task: taskTextField.text, subtask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
		mainVC.baseArray[0].append(task)
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}
