//
//  GameScene.swift
//  Spherez
//
//  Created by Tiffany on 10/8/19.
//  Copyright © 2019 Tiffany. All rights reserved.
//

import SpriteKit
import GameplayKit


    

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var touchBeganInBall = false
    var ballDragStartPoint = CGPoint()
    var ballDragEndPoint = CGPoint()
    var invisLine = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.black
        
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        
        invisLine.position = CGPoint(x: 0, y: -500)
        
        
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        borderBody.restitution = 1
        self.physicsBody = borderBody
      
        
    }
   

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        if ball.contains(touch.location(in: self)) {
            touchBeganInBall = true
//            print("touch began", touch.location(in: self))
            ballDragStartPoint = touch.location(in: self)
        }
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if touchBeganInBall {
//            print("touch moving", touch.location(in: self))
        }
    }
//
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if touchBeganInBall {
//            print("touch ended", touch.location(in: self))
            ballDragEndPoint = touch.location(in: self)
            let angle = atan2f(Float(ballDragStartPoint.x - ballDragEndPoint.x), Float(ballDragStartPoint.y - ballDragEndPoint.y))
            let angleX = ballDragStartPoint.x - ballDragEndPoint.x
            let angleY = ballDragStartPoint.y - ballDragEndPoint.y
//            print("angle is", angle * 100)

            ball.physicsBody?.applyImpulse(CGVector(dx: angleX * 1, dy: angleY * 1))
        }
        touchBeganInBall = false
        
        
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
       
        let minY = invisLine.position.y
        let maxY = invisLine.position.y
        if ball.position.y > minY && ball.position.y < maxY {
            
            ball.position = CGPoint(x: 0, y: -590)

        }
    }
}
