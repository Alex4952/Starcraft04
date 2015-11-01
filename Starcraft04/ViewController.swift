//
//  ViewController.swift
//  Starcraft04
//
//  Created by GIJU HONG on 11/1/15.
//  Copyright © 2015 GIJU HONG. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	var unitCode : Int = 101

	func gameStart() {
//		var terranUnits: Array<TerranUnit> = Array()
		var terranUnits = [TerranUnit]()
		
		let marine1 = Marine(unitCode: unitCode++, strength: 10)
		terranUnits.append(marine1)
		
		let firebat1 = Firebat(unitCode: unitCode++, strength: 15)
		terranUnits.append(firebat1)
		
		for unit in terranUnits {
			unit.attack()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("+++++ Game Start +++++")
		gameStart()
	}
	
}

