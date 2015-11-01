import Foundation

// private : 같은 파일
// internal : 파일이 속한 동일 모듈 (선언 안하면 기본적으로 internal)
// public : 외부 공개용 API등을 만들때
// protected : 없음

protocol StarcraftUnit {
	
	var clan : String { get }
	var strength : Int { get set }

	func move()
	func attack()
}

protocol SteamPackDelegate {
	func attackWithSteamPack(marine: Marine)
}

class TerranUnit : StarcraftUnit {
	private let _clan : String = "Terran"
	private var _strength : Int = 0

	var clan : String { return _clan }
	
	var strength : Int {
		get { return _strength }
		set {
			if newValue < 0 {
				_strength = 0
			}
			else {
				_strength = newValue
			}
		}
	}
	
	func attack() {
		print("attack()")
	}
	
	func move() {
		print("move()")
	}
}


class Marine : TerranUnit {
	
	var delegate : SteamPackDelegate?
	
	private let _name : String = "Marine"
	var name : String { return _name }
	
	private var _unitCode : Int = 0
	var unitCode : Int { return _unitCode }
	
	var isSteamPackOn : Bool = false {
		willSet {
		}
		didSet {
			print("\(displayName)'s SteamPack hs turned on.")
		}
	}
	var displayName : String = ""
	
	init(unitCode: Int, strength: Int) {
		super.init()
		super.strength = strength
		_unitCode = unitCode
		
		displayName = _name + "_" + String(_unitCode)
		print("\(displayName) has been created.")
	}
	
	override func attack() {
		if (isSteamPackOn) {
			print("\(displayName) is attacking")
		}
		else {
			delegate?.attackWithSteamPack(self)
		}
	}
	
	override func move() {
		print("\(displayName) is moving")
	}
	
}

class SteamPackAttack : SteamPackDelegate {
	func attackWithSteamPack(marine: Marine) {
		print("\(marine.displayName) is attacking with SteamPack!!")
	}
}

class Firebat : TerranUnit {
	private let _name : String = "Firebat"
	var name : String { return _name }
	
	private var _unitCode : Int = 0
	var unitCode : Int { return _unitCode }
	
	var isSteamPackOn : Bool = false {
		willSet {
		}
		didSet {
			print("\(displayName)'s SteamPack has turned on.")
		}
	}
	var displayName : String = ""
	
	init(unitCode: Int, strength: Int) {
		super.init()
		super.strength = strength
		_unitCode = unitCode
		
		displayName = _name + "_" + String(_unitCode)
		print("\(displayName) has been created.")
	}
	
	override func attack() {
		print("\(displayName) is attacking")
	}
	
	override func move() {
		print("\(displayName) is moving")
	}
}

