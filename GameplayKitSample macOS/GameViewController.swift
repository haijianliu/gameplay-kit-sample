//
//  GameViewController.swift
//  GameplayKitSample macOS
//
//  Created by haijian on 2019/06/18.
//  Copyright © 2019 haijian. All rights reserved.
//

import Cocoa
import SpriteKit

// Our macOS specific view controller
class GameViewController: NSViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Create a game scene which is SpriteKit scene.
		let scene = GameScene()
		
		// Present the scene and configure the SpriteKit view.
		guard let skView = view as? SKView else { return }
		skView.presentScene(scene)
		skView.ignoresSiblingOrder = true
		skView.showsFPS = true
		skView.showsNodeCount = true
	}
}

