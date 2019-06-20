//
//  GameScene.swift
//  GameplayKitSample
//
//  Created by haijian on 2019/06/19.
//  Copyright © 2019 haijian. All rights reserved.
//

import GameplayKit

class GameScene: SKScene, SKSceneDelegate {
	
	var componentSystem = [GKComponentSystem<GKComponent>]()
	var player: GKEntity?
	var previousUpdateTime: TimeInterval?
	
	var random: GKRandomSource?  // Random source shared by various game mechanics.
	
	override func didMove(to view: SKView) {
		
		componentSystem.append(GKComponentSystem(componentClass: ControllerComponent.self))
		
		// Setup player entity with display and control components.
		player = GKEntity()
		player?.addComponent(GKSKNodeComponent())
		player?.addComponent(ControllerComponent())
		
		componentSystem.first?.addComponent(foundIn: player!)
		
		// Setup scene delegate to implement scene behavior
		scene?.delegate = self  // delegate
		
		// Scene settings
		scene?.scaleMode = .resizeFill  // scale mode
		scene?.backgroundColor = SKColor.blue  // background color

		// Add player entity to scene.
		
		let sprite = SKSpriteNode(texture: nil, color: SKColor.white, size: CGSize(width: 10, height: 10))
		sprite.position = CGPoint(x: 20, y: 20)
		scene?.addChild(sprite)
		
		let playerSpriteComponent = player?.component(ofType: SpriteComponent.self)
		playerSpriteComponent?.spriteNode = sprite
	}
	
	func update(_ currentTime: TimeInterval, for scene: SKScene) {
		// Track delta time since the last update
		var deltaTime: TimeInterval = 0
		if let lastTime = previousUpdateTime { deltaTime = currentTime - lastTime }
		previousUpdateTime = currentTime
		
		componentSystem.first?.update(deltaTime: deltaTime)
	}
}
