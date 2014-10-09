//
//  Date.swift
//  TaskIt
//
//  Created by John Nguyen on 8/10/2014.
//  Copyright (c) 2014 John Nguyen. All rights reserved.
//

import Foundation

class Date {
	
	class func from(#year: Int, month: Int, day: Int) -> NSDate {
		
		var components = NSDateComponents()
		components.year = year
		components.month = month
		components.day = day
		
		var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
		
		return gregorianCalendar.dateFromComponents(components)!
	}
	
	class func toString(#date: NSDate) -> String {
		
		let dateStringFormatter = NSDateFormatter()
		dateStringFormatter.dateFormat = "yyyy-MM-dd"
		return dateStringFormatter.stringFromDate(date)
	}
}