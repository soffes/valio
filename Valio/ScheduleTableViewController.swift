//
//  ScheduleTableViewController.swift
//  Valio
//
//  Created by Sam Soffes on 6/5/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {

	lazy var 📅: NSArray = {
		let path = NSBundle.mainBundle().pathForResource("valio", ofType: "json")!
		let data = NSData(contentsOfFile: path, options: nil, error: nil)!
		return NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSArray
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		navigationItem.titleView = UIImageView(image: UIImage(named: "Valio"))
		
		tableView.registerClass(ItemTableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.separatorStyle = .None
    }
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 📅.count
	}

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
		let day = 📅[section] as! NSDictionary
		let items = day["items"] as! NSArray
		return items.count
    }

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ItemTableViewCell
		let day = 📅[indexPath.section] as! NSDictionary
		let items = day["items"] as! NSArray
		let item = items[indexPath.row] as! NSDictionary
		
		cell.titleLabel.text = item["title"] as? String
		cell.timeLabel.text = item["time"] as? String
		
		if let minor = item["minor"] as? Bool {
			cell.minor = minor
		} else {
			cell.minor = false
		}

		return cell
    }
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let day = 📅[section] as! NSDictionary
		return day["title"] as? String
	}
	
	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let day = 📅[section] as! NSDictionary
		let view = SectionHeaderView()
		view.titleLabel.text = (day["title"] as! String).uppercaseString
		return view
	}
	
	override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 45
	}
}
