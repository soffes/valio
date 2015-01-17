//
//  ItemTableViewCell.swift
//  Valio
//
//  Created by Sam Soffes on 6/6/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit
import QuartzCore

class ItemTableViewCell: UITableViewCell {
	
	// MARK: - Properties

	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.setTranslatesAutoresizingMaskIntoConstraints(false)
		label.font = UIFont(name: "Avenir", size: 16)
		return label
	}()
	
	lazy var timeLabel: UILabel = {
		let label = UILabel()
		label.setTranslatesAutoresizingMaskIntoConstraints(false)
		label.font = UIFont(name: "Avenir-Light", size: 16)
		label.textColor = UIColor(red: 0.631, green: 0.651, blue: 0.678, alpha: 1)
		label.textAlignment = .Right
		return label
	}()
	
	lazy var lineView: UIView = {
		let view = UIView()
		view.setTranslatesAutoresizingMaskIntoConstraints(false)
		view.backgroundColor = UIColor(red: 0.906, green: 0.914, blue: 0.918, alpha: 1)
		return view
	}()
	
	lazy var circleView: UIView = {
		let view = UIView()
		view.setTranslatesAutoresizingMaskIntoConstraints(false)
		view.backgroundColor = UIColor.whiteColor()
		view.layer.borderWidth = 1
		view.layer.cornerRadius = 7
		return view
	}()
	
	var minor: Bool = false {
		didSet {
			titleLabel.textColor = minor ? timeLabel.textColor : UIColor(red: 0.227, green: 0.227, blue: 0.278, alpha: 1)
			circleView.layer.borderColor = minor ? UIColor(red: 0.839, green: 0.847, blue: 0.851, alpha: 1).CGColor : UIColor(red: 0.329, green: 0.831, blue: 0.690, alpha: 1).CGColor
		}
	}


	// MARK: - Initializers
	
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		selectionStyle = .None
		
		contentView.addSubview(titleLabel)
		contentView.addSubview(timeLabel)
		contentView.addSubview(lineView)
		contentView.addSubview(circleView)
		
		let views = [
			"timeLabel": timeLabel,
			"titleLabel": titleLabel,
			"lineView": lineView,
			"circleView": circleView
		]
		
		let metrics = [
			"margin": 12,
			"leftMargin": 16,
			"lineMargin": 14
		]
		
		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-(leftMargin)-[timeLabel(80)]-(lineMargin)-[lineView(2)]-(lineMargin)-[titleLabel]-|", options: nil, metrics: metrics, views: views))
		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(margin)-[titleLabel]-(margin)-|", options: nil, metrics: metrics, views: views))
		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[lineView]|", options: nil, metrics: metrics, views: views))
		contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: timeLabel, attribute: .CenterY, multiplier: 1, constant: 0))
		contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterX, relatedBy: .Equal, toItem: lineView, attribute: .CenterX, multiplier: 1, constant: 0))
		contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: titleLabel, attribute: .CenterY, multiplier: 1, constant: 0))
		contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 14))
		contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 14))
    }

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
