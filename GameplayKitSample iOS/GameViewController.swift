//
//  GameViewController.swift
//  GameplayKitSample iOS
//
//  Created by haijian on 2019/06/18.
//  Copyright © 2019 haijian. All rights reserved.
//

import UIKit
import SpriteKit

// Our iOS specific view controller
class GameViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Create the game and its SpriteKit scene.
		let scene = SKScene()
		scene.scaleMode = .aspectFit
		
		// Present the scene and configure the SpriteKit view.
		guard let skView = view as? SKView else { return }
		skView.presentScene(scene)
		
		skView.ignoresSiblingOrder = true
		skView.showsFPS = true
		skView.showsNodeCount = true
	}
}

