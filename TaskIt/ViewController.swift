//
//  ViewController.swift
//  TaskIt
//
//  Created by John Nguyen on 7/10/2014.
//  Copyright (c) 2014 John Nguyen. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// ------------------------------------------------------------------
	//	MARK:               PROPERTIES & OUTLETS
	// ------------------------------------------------------------------
	
	@IBOutlet weak var tableView: UITableView!
	
	var baseArray: [[TaskModel]] = []
	
	// ------------------------------------------------------------------
	//	MARK:					LIFE CYCLE
	// ------------------------------------------------------------------
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		// sort array with closure (oldest task to newest)
		baseArray[0] = baseArray[0].sorted{ (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
			return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
		}
		
		// NOT ACTUALLY NEEDED, iOS8 auto reloads data
		tableView.reloadData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// ------------------------------------------------------------------
	//	MARK:					NAVIGATION
	// ------------------------------------------------------------------
	
	//
	// PREPARE FOR SEQUE
	//
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "showTaskDetail" {
			
			let targetVC = segue.destinationViewController as TaskDetailViewController
			let indexPath = tableView.indexPathForSelectedRow()
			targetVC.detailTaskModel = baseArray[indexPath!.section][indexPath!.row]
			targetVC.mainVC = self
			
		} else if segue.identifier == "showTaskAdd" {
			
			let targetVC = segue.destinationViewController as AddTaskViewController
			targetVC.mainVC = self
		}
	}
	
	// ------------------------------------------------------------------
	//	MARK:               TABLE VIEW DATA SOURCE
	// ------------------------------------------------------------------
	
	//
	// NUMBER OF SECTIONS
	//
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		
		return baseArray.count
	}
	
	//
	// NUMBER OF ROWS
	//
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return baseArray[section].count
	}
	
	//
	// CELL FOR ROW
	//
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
		
		let currentTask = baseArray[indexPath.section][indexPath.row]
		
		cell.taskLabel.text = currentTask.task
		cell.descriptionLabel.text = currentTask.subtask
		cell.dateLabel.text = Date.toString(date: currentTask.date)
		
		return cell
	}
	
	// ------------------------------------------------------------------
	//	MARK:               TABLE VIEW DELEGATE
	// ------------------------------------------------------------------
	
	//
	// HEIGHT FOR HEADER
	//
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		
		return 25
	}

	//
	// TITLE FOR HEADER
	//
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		if section == 0 {
			return "To Do"
		} else {
			return "Completed"
		}
	}
	
	//
	// DID SELECT ROW
	//
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		performSegueWithIdentifier("showTaskDetail", sender: self)
	}
	
	//
	// COMMIT EDITING STYLE - allows row swiping. Completing tasks here
	//
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		
		let thisTask = baseArray[indexPath.section][indexPath.row]
		
		// allow completing (via swiping) for uncompleted tasks only
		if indexPath.section == 0 {
			// complete task
			var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: true)
			// add to "completed"
			baseArray[1].append(newTask)
			
		} else {
			// else, uncomplete and move back to "to do" section
			var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: false)
			baseArray[0].append(newTask)
		}
		
		// remove task from old array & reload data
		baseArray[indexPath.section].removeAtIndex(indexPath.row)
		tableView.reloadData()
	}
	
	// ------------------------------------------------------------------
	//	MARK:					ACTIONS
	// ------------------------------------------------------------------
	
	//
	// ADD BUTTON
	//
	@IBAction func addButtonPressed(sender: UIBarButtonItem) {
		
		self.performSegueWithIdentifier("showTaskAdd", sender: self)
	}
	
	// ------------------------------------------------------------------
	//	MARK:					HELPERS
	// ------------------------------------------------------------------
	
	//
	// SORT DATE
	//
	
	
}

