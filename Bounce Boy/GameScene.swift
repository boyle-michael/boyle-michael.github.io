//
//  GameScene.swift
//  Bounce Boy_The Final Push
//
//  Created by Michael Boyle on 7/25/15.
//  Copyright (c) 2015 Michael Boyle. All rights reserved.
//

import SpriteKit
import StoreKit

var highscore = 0
var currentScore = NSInteger()
var scoreLableNode1 = SKLabelNode()
var hscoreLableNode = SKLabelNode()
var bg = SKSpriteNode()
var sc = SKSpriteNode()
var scoreLableFinal = SKLabelNode()
var scHighScore = SKLabelNode()
var instructions = SKLabelNode()
var instructions2 = SKLabelNode()
let retryButton = SKSpriteNode(imageNamed: "retry")
let homeButton = SKSpriteNode(imageNamed: "retry")
let characterChoiceButton = SKSpriteNode(imageNamed: "characterButton")
let characterChoiceScreen = SKSpriteNode(imageNamed: "characterScreen")
let normalChoice = SKSpriteNode(imageNamed: "hero_")
let blackChoice = SKSpriteNode(imageNamed: "hero_Black")
let redChoice = SKSpriteNode(imageNamed: "hero_Red")
let orangeChoice = SKSpriteNode(imageNamed: "hero_Orange")
let yellowChoice = SKSpriteNode(imageNamed: "hero_Yellow")
let greenChoice = SKSpriteNode(imageNamed: "hero_Green")
let blueChoice = SKSpriteNode(imageNamed: "hero_Blue")
let purpleChoice = SKSpriteNode(imageNamed: "hero_Purple")
let pinkChoice = SKSpriteNode(imageNamed: "hero_Pink")

var characterSelection = ""
var heroTexture1 = SKTexture(imageNamed: "hero_armsUp_\(characterSelection)")
var heroTexture2 = SKTexture(imageNamed: "hero_\(characterSelection)")
var heroTexture3 = SKTexture(imageNamed: "hero_armsDown_\(characterSelection)")
var heroTexture4 = SKTexture(imageNamed: "hero_\(characterSelection)")
var heroTextureDead = SKTexture(imageNamed: "hero_dead_\(characterSelection)")
let groundTexture = SKTexture(imageNamed: "ground")
let ballTexture = SKTexture(imageNamed: "ball")
let bgTexture = SKTexture(imageNamed: "background")
let bgTexture2 = SKTexture(imageNamed: "background2")
let scTexture = SKTexture(imageNamed: "scoreCard")
var heroTextures = [heroTexture1, heroTexture2, heroTexture3, heroTexture4]
var animation = SKAction.animate(with: [heroTextures[0], heroTextures[1], heroTextures[2], heroTextures[3]], timePerFrame: 0.1)
var makeHeroMove = SKAction.repeatForever(animation)

let defaults = UserDefaults()
let highScore = defaults.integer(forKey: "highScore")
var showHighScore = defaults.integer(forKey: "highScore")
var areAdsRemoved = defaults.bool(forKey: "ads")

var isFingerOnBall = false
var isGameOver = false
var gravity:CGFloat = -10
var impulse:CGFloat = 40

class GameScene: SKScene, SKPhysicsContactDelegate/* ,SKProductsRequestDelegate, SKPaymentTransactionObserver*/ {
    
    var hero = SKSpriteNode(texture: heroTexture1)
    let ground = SKSpriteNode(texture: groundTexture)
    let ball = SKSpriteNode(texture: ballTexture)
    
    enum BodyType:UInt32 {
        
        case hero = 1
        case ground = 2
        case ball = 4
    }
    
    override func didMove(to view: SKView) {
        
        /*Set IAPS
        if SKPaymentQueue.canMakePayments() {
        print("IAP is enabled, loading")
        let productID:NSSet = NSSet(object: "BounceBoyRemoveAds")
        let request:SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
        request.delegate = self
        request.start()
        } else {
        print("please enable IAPS")
        } */
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: gravity)
        let physicsBody = SKPhysicsBody (edgeLoopFrom: self.frame)
        self.physicsBody = physicsBody
        physicsWorld.contactDelegate = self
        
        //Background
        bg = SKSpriteNode(texture: bgTexture)
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.zPosition = -50
        bg.size.height = self.frame.height
        bg.size.width = self.frame.width
        
        //character selections
        characterChoiceButton.size = CGSize(width: characterChoiceButton.size.width * 2, height: characterChoiceButton.size.height * 2)
        characterChoiceButton.position = CGPoint(x: self.frame.maxX - characterChoiceButton.size.width * 0.5, y: self.frame.maxY - characterChoiceButton.size.height * 0.5 - 70)
        
        characterChoiceScreen.size = CGSize(width: self.frame.width, height: self.frame.height)
        characterChoiceScreen.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        characterChoiceScreen.zPosition = -49
        
        //character choices
        normalChoice.size.width = self.frame.size.width * 0.1
        normalChoice.size.height = self.frame.size.height * 0.1
        normalChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 0.5) + 10, y: self.frame.midY)
        blackChoice.size.width = self.frame.size.width * 0.1
        blackChoice.size.height = self.frame.size.height * 0.1
        blackChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 1.5) + 10, y: self.frame.midY)
        redChoice.size.width = self.frame.size.width * 0.1
        redChoice.size.height = self.frame.size.height * 0.1
        redChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 2.5) + 10, y: self.frame.midY)
        orangeChoice.size.width = self.frame.size.width * 0.1
        orangeChoice.size.height = self.frame.size.height * 0.1
        orangeChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 3.5) + 10, y: self.frame.midY)
        yellowChoice.size.width = self.frame.size.width * 0.1
        yellowChoice.size.height = self.frame.size.height * 0.1
        yellowChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 4.5) + 10, y: self.frame.midY)
        greenChoice.size.width = self.frame.size.width * 0.1
        greenChoice.size.height = self.frame.size.height * 0.1
        greenChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 5.5) + 10, y: self.frame.midY)
        blueChoice.size.width = self.frame.size.width * 0.1
        blueChoice.size.height = self.frame.size.height * 0.1
        blueChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 6.5) + 10, y: self.frame.midY)
        purpleChoice.size.width = self.frame.size.width * 0.1
        purpleChoice.size.height = self.frame.size.height * 0.1
        purpleChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 7.5) + 10, y: self.frame.midY)
        pinkChoice.size.width = self.frame.size.width * 0.1
        pinkChoice.size.height = self.frame.size.height * 0.1
        pinkChoice.position = CGPoint(x: self.frame.minX + (normalChoice.size.width * 8.5) + 10, y: self.frame.midY)
        
        //instructions
        instructions.fontName = "Helvetica"
        instructions.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 60)
        instructions.fontSize = 20
        instructions.alpha = 1
        instructions.fontColor = SKColor.black
        instructions.zPosition = -30
        instructions.text = ("Move the ball to play")
        
        //instructions part 2
        instructions2.fontName = "Helvetica"
        instructions2.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 60)
        instructions2.fontSize = 20
        instructions2.alpha = 1
        instructions2.fontColor = SKColor.black
        instructions2.zPosition = -30
        instructions2.text = ("Tap to reset")
        
        //current score
        currentScore = 0
        scoreLableNode1.fontName = "Helvetica"
        scoreLableNode1.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 200)
        scoreLableNode1.fontSize = 30
        scoreLableNode1.alpha = 1
        scoreLableNode1.fontColor = UIColor.black
        scoreLableNode1.zPosition = -30
        scoreLableNode1.text = ("0")
        
        //high score
        hscoreLableNode.fontName = "Helvetica"
        hscoreLableNode.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY - 70)
        hscoreLableNode.fontSize = 20
        hscoreLableNode.alpha = 1
        hscoreLableNode.fontColor = UIColor.black
        hscoreLableNode.zPosition = -30
        hscoreLableNode.text = ("Highscore: \(showHighScore)")
        
        //hero info
        self.hero.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 1.5 * self.hero.size.height)
        let heroSize = CGSize(width: self.frame.size.width / 13, height: self.frame.size.height / 12)
        self.hero.size = heroSize
        self.hero.physicsBody = SKPhysicsBody(rectangleOf: heroSize)
        self.hero.physicsBody?.mass = 0.08
        self.hero.physicsBody?.isDynamic = false
        self.hero.physicsBody?.categoryBitMask = BodyType.hero.rawValue
        self.hero.physicsBody?.contactTestBitMask = BodyType.ball.rawValue
        hero.physicsBody?.restitution = 0.6
        hero.physicsBody?.usesPreciseCollisionDetection = true
        hero.physicsBody?.angularDamping = 1
        if isGameOver {
            hero.texture = heroTextureDead
        } else {
            hero.run(makeHeroMove)
        }
        
        //ground info
        let groundSize = CGSize(width: self.frame.size.width * 3, height: self.frame.size.height / 12)
        self.ground.size = groundSize
        self.ground.physicsBody = SKPhysicsBody(rectangleOf: groundSize)
        self.ground.position = CGPoint(x: self.frame.midX, y: self.frame.minY + ground.size.height / 2)
        self.ground.physicsBody?.isDynamic = false
        self.ground.physicsBody?.categoryBitMask = BodyType.ground.rawValue
        self.ground.physicsBody?.contactTestBitMask = BodyType.hero.rawValue
        
        //ball info
        let ballSize = CGSize(width: self.frame.size.width / 6, height: self.frame.size.width / 6)
        self.ball.size = ballSize
        self.ball.physicsBody = SKPhysicsBody(circleOfRadius: self.ball.size.width / 2)
        self.ball.position = CGPoint(x: self.frame.midX + self.ball.size.width / 150, y: self.frame.minY + ground.size.height)
        self.ball.zPosition = 50
        self.ball.physicsBody?.isDynamic = false
        self.ball.physicsBody?.categoryBitMask = BodyType.ball.rawValue
        //self.ball.xScale = 0.7
        //self.ball.yScale = 0.7
        self.ball.physicsBody?.restitution = 0.5
        self.ball.physicsBody?.usesPreciseCollisionDetection = true
        
        //adding childs
        self.addChild(bg)
        self.addChild(characterChoiceButton)
        self.addChild(hero)
        self.addChild(ground)
        self.addChild(ball)
        self.addChild(scoreLableNode1)
        self.addChild(hscoreLableNode)
        self.addChild(instructions)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch (contactMask) {
        case BodyType.ground.rawValue | BodyType.hero.rawValue:
            if !isGameOver {
                isGameOver = true
                let defaults = UserDefaults()
                let highScore = defaults.integer(forKey: "highScore")
                if (currentScore > highScore) {
                    defaults.set(currentScore, forKey: "highScore")
                }
                showHighScore = defaults.integer(forKey: "highScore")
                addChild(instructions2)
            }
        case BodyType.ball.rawValue | BodyType.hero.rawValue:
            currentScore += 1
            scoreLableNode1.text = ("\(currentScore)")
            gravity -= 0.25
            impulse += 0.75
            self.hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: impulse))
            physicsWorld.gravity = CGVector(dx: 0, dy: gravity)
        default:
            return
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            if self.atPoint(location) == self.ball {
                isFingerOnBall = true
                hero.physicsBody?.isDynamic = true
                instructions.removeFromParent()
            } else if self.atPoint(location) == normalChoice {
                characterSelection = ""
                changeHero()
            } else if self.atPoint(location) == redChoice {
                if highScore >= 5 {
                    characterSelection = "Red"
                    changeHero()
                }
            } else if self.atPoint(location) == blackChoice {
                if highScore >= 10 {
                    characterSelection = "Black"
                    changeHero()
                }
            } else if self.atPoint(location) == orangeChoice {
                if highScore >= 20 {
                    characterSelection = "Orange"
                    changeHero()
                }
            } else if self.atPoint(location) == yellowChoice {
                if highScore >= 30 {
                    characterSelection = "Yellow"
                    changeHero()
                }
            } else if self.atPoint(location) == greenChoice {
                if highScore >= 40 {
                    characterSelection = "Green"
                    changeHero()
                }
            } else if self.atPoint(location) == blueChoice {
                if highScore >= 50 {
                    characterSelection = "Blue"
                    changeHero()
                }
            } else if self.atPoint(location) == purpleChoice {
                if highScore >= 60 {
                    characterSelection = "Purple"
                    changeHero()
                }
            } else if self.atPoint(location) == pinkChoice {
                if highScore >= 70 {
                    characterSelection = "Pink"
                    changeHero()
                }
            } else if self.atPoint(location) == characterChoiceButton {
                removeAllChildren()
                self.removeAllChildren()
                addChild(characterChoiceScreen)
                addChild(normalChoice)
                addChild(redChoice)
                addChild(blackChoice)
                addChild(orangeChoice)
                addChild(yellowChoice)
                addChild(greenChoice)
                addChild(blueChoice)
                addChild(purpleChoice)
                addChild(pinkChoice)
            } else {
                if isGameOver {
                    resetGame()
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isGameOver {
            if isFingerOnBall {
                let touch = touches.first as UITouch!
                let touchLocation = touch!.location(in: self)
                let previousLocation = touch!.previousLocation(in: self)
                
                var ballX = ball.position.x + (touchLocation.x - previousLocation.x)
                
                ballX = max(ballX, ball.size.width/2)
                ballX = min(ballX, size.width - ball.size.width/2)
                
                ball.position = CGPoint(x: ballX, y: ball.position.y)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnBall = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func changeHero() {
        heroTexture1 = SKTexture(imageNamed: "hero_armsUp_\(characterSelection)")
        heroTexture2 = SKTexture(imageNamed: "hero_\(characterSelection)")
        heroTexture3 = SKTexture(imageNamed: "hero_armsDown_\(characterSelection)")
        heroTexture4 = SKTexture(imageNamed: "hero_\(characterSelection)")
        heroTextureDead = SKTexture(imageNamed: "hero_dead_\(characterSelection)")
        heroTextures = [heroTexture1, heroTexture2, heroTexture3, heroTexture4]
        self.hero.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 1.5 * self.hero.size.height)
        let heroSize = CGSize(width: self.frame.size.width / 13, height: self.frame.size.height / 12)
        self.hero.size = heroSize
        self.hero.physicsBody = SKPhysicsBody(rectangleOf: heroSize)
        self.hero.physicsBody?.mass = 0.08
        self.hero.physicsBody?.isDynamic = false
        self.hero.physicsBody?.categoryBitMask = BodyType.hero.rawValue
        self.hero.physicsBody?.contactTestBitMask = BodyType.ball.rawValue
        hero.physicsBody?.restitution = 0.6
        hero.physicsBody?.usesPreciseCollisionDetection = true
        hero.physicsBody?.angularDamping = 1
        if isGameOver {
            hero.texture = heroTextureDead
        } else {
            hero.run(makeHeroMove)
        }
        animation = SKAction.animate(with: [heroTextures[0], heroTextures[1], heroTextures[2], heroTextures[3]], timePerFrame: 0.1)
        makeHeroMove = SKAction.repeatForever(animation)
        hero.texture = heroTexture1
        removeAllChildren()
        self.addChild(bg)
        self.addChild(characterChoiceButton)
        self.addChild(hero)
        self.addChild(ground)
        self.addChild(ball)
        self.addChild(scoreLableNode1)
        self.addChild(hscoreLableNode)
        self.addChild(instructions)
        resetGame()
        heroTexture1 = SKTexture(imageNamed: "hero_armsUp_\(characterSelection)")
        heroTexture2 = SKTexture(imageNamed: "hero_\(characterSelection)")
        heroTexture3 = SKTexture(imageNamed: "hero_armsDown_\(characterSelection)")
        heroTexture4 = SKTexture(imageNamed: "hero_\(characterSelection)")
        heroTextureDead = SKTexture(imageNamed: "hero_dead_\(characterSelection)")
        heroTextures = [heroTexture1, heroTexture2, heroTexture3, heroTexture4]
        self.hero.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 1.5 * self.hero.size.height)
        self.hero.size = heroSize
        //self.hero.physicsBody = SKPhysicsBody(rectangleOfSize: heroSize)
        self.hero.physicsBody = SKPhysicsBody(texture: hero.texture!, size: (hero.texture?.size())!)
        self.hero.physicsBody?.mass = 0.08
        self.hero.physicsBody?.isDynamic = false
        self.hero.physicsBody?.categoryBitMask = BodyType.hero.rawValue
        self.hero.physicsBody?.contactTestBitMask = BodyType.ball.rawValue
        hero.physicsBody?.restitution = 0.6
        hero.physicsBody?.usesPreciseCollisionDetection = true
        hero.physicsBody?.angularDamping = 1
        if isGameOver {
            hero.texture = heroTextureDead
        } else {
            hero.run(makeHeroMove)
        }
        animation = SKAction.animate(with: [heroTextures[0], heroTextures[1], heroTextures[2], heroTextures[3]], timePerFrame: 0.1)
        makeHeroMove = SKAction.repeatForever(animation)
        hero.texture = heroTexture1
        removeAllChildren()
        self.addChild(bg)
        self.addChild(characterChoiceButton)
        self.addChild(hero)
        self.addChild(ground)
        self.addChild(ball)
        self.addChild(scoreLableNode1)
        self.addChild(hscoreLableNode)
        self.addChild(instructions)

    }
    
    func resetGame() {
        let defaults = UserDefaults()
        let highScore = defaults.integer(forKey: "highScore")
        
        if (currentScore > highScore) {
            defaults.set(currentScore, forKey: "highScore")
        }
        let showHighScore = defaults.integer(forKey: "highScore")
        highscore = showHighScore
        hscoreLableNode.text = "Highscore: \(highscore)"
        impulse = 40
        gravity = -10
        physicsWorld.gravity = CGVector(dx: 0, dy: gravity)
        bg.texture = (TextureName: bgTexture) as! SKTexture
        isGameOver = false
        currentScore = 0
        scoreLableNode1.text = "\(currentScore)"
        let moveHero = SKAction.move(to: CGPoint(x: self.frame.midX, y: self.frame.midY + 1.5 * self.hero.size.height + self.hero.size.height), duration: 0.25)
        let spinHero = SKAction.rotate(toAngle: 0, duration: 0.25)
        self.removeAllChildren()
        self.hero.physicsBody?.isDynamic = false
        self.addChild(hero)
        self.hero.run(moveHero)
        self.hero.run(spinHero)
        self.addChild(ground)
        self.ball.position = CGPoint(x: self.frame.midX + self.ball.size.width / 150, y: self.frame.minY + ground.size.height)
        self.addChild(ball)
        self.addChild(scoreLableNode1)
        self.addChild(hscoreLableNode)
        self.addChild(bg)
        self.addChild(characterChoiceButton)
        self.addChild(instructions)
    }
}
