//
//  ViewController.swift
//  QuizApp3
//
//  Created by 井上圭一 on 2016/02/14.
//  Copyright © 2016年 keiichi, inoue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    
    var audioPlayer1: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!
    
    var timer: NSTimer?
    var countNumber = 1;
    var countAnswer = 0;
    var countTime = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textLabel3.text = "第1問"
        textView.text = "\n\n 東京ディズニーランドがあるのは東京都である。\n\n\n ◯ or X"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        timer!.invalidate()
        
        let audioPath1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("maru", ofType: "mp3")!)
        audioPlayer1 = try! AVAudioPlayer(contentsOfURL: audioPath1, fileTypeHint: nil)
        let audioPath2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("batu", ofType: "mp3")!)
        audioPlayer2 = try! AVAudioPlayer(contentsOfURL: audioPath2, fileTypeHint: nil)
    }

    @IBAction func ansewr1Action(sender: UIButton) {
        if  timer!.valid == true {
            return;
        } else if countNumber == 1 {
            audioPlayer2.prepareToPlay()
            audioPlayer2.play()
            textLabel1.text = "不 正 解"
            textLabel2.text = "3秒後に次の問題です。"
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if countNumber == 2 {
            audioPlayer1.prepareToPlay()
            audioPlayer1.play()
            textLabel1.text = "正 解"
            textLabel2.text = "3秒後に次の問題です。"
        countAnswer = countAnswer+20
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if countNumber == 3 {
            audioPlayer2.prepareToPlay()
            audioPlayer2.play()
            textLabel1.text = "不 正 解"
            textLabel2.text = "3秒後に次の問題です。"
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if countNumber == 4 {
            audioPlayer1.prepareToPlay()
            audioPlayer1.play()
            textLabel1.text = "正 解"
            textLabel2.text = "3秒後に次の問題です。"
            countAnswer = countAnswer+20
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if countNumber == 5 {
            textLabel1.text = "不 正 解"
            audioPlayer2.prepareToPlay()
            audioPlayer2.play()
            textLabel2.text = "3秒後に次の問題です。"
            countNumber++
            textView.text = "あなたの正解率は \(countAnswer) %です。\n\n もう一度挑戦するには◯ \n 終了はXを押してください。"
        } else if countNumber == 6 {
            countNumber = 1
            countAnswer = 0
            textLabel3.text = "第1問"
            textView.text = "\n\n 東京ディズニーランドがあるのは東京都である。\n\n\n ◯ or X"
            textLabel1.text = ""
        }
    }

    @IBAction func ansewr2Action(sender: UIButton) {
        if  timer!.valid == true {
            return;
            
        } else if countNumber == 1 {
            audioPlayer1.prepareToPlay()
            audioPlayer1.play()
            textLabel1.text = "正 解"
            textLabel2.text = "3秒後に次の問題です。"
            countAnswer = countAnswer+20
            countNumber++;
        } else if (countNumber == 2){
            
            textLabel1.text = "不 正 解"
            audioPlayer2.prepareToPlay()
            audioPlayer2.play()
            textLabel2.text = "3秒後に次の問題です。"
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if (countNumber == 3){
            textLabel1.text = "正 解"
            audioPlayer1.prepareToPlay()
            audioPlayer1.play()
            textLabel2.text = "3秒後に次の問題です。"
            countAnswer = countAnswer+20
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if (countNumber == 4){
            textLabel1.text = "不 正 解"
            audioPlayer2.prepareToPlay()
            audioPlayer2.play()
            textLabel2.text = "3秒後に次の問題です。"
            countNumber++
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        } else if (countNumber == 5){
            textLabel1.text = "正 解"
            audioPlayer1.prepareToPlay()
            audioPlayer1.play()
            textLabel2.text = ""
            countAnswer = countAnswer+20
            countNumber++
            textView.text = "あなたの正解率は \(countAnswer) %です。\n\n もう一度挑戦するには◯ \n 終了はXを押してください。"
        } else if (countNumber == 6){
            countNumber = 10
            countAnswer = 0
            countTime = 0
            textLabel1.text = ""
            textLabel2.text = ""
            textView.text = "お疲れさまでした。"
        }
        
    }
    
    func update() {
        countTime++
        if countNumber == 2 && countTime == 3 {
            textLabel1.text = ""
            textLabel3.text = "第2問"
            textView.text = "\n\n 塩はカロリー0である。\n\n\n ◯ or X"
            textLabel2.text = ""
            timer!.invalidate()
            //timer = nil
            countTime = 0
        } else if (countNumber == 3 && countTime == 3){
            textLabel1.text = ""
            textLabel3.text = "第3問"
            textView.text = "\n\n 100円玉と10円玉、大きいのは100円玉?　\n\n\n ◯ or X"
            textLabel2.text = ""
            timer!.invalidate()
            //timer = nil
            countTime = 0
        } else if (countNumber == 4 && countTime == 3){
            textLabel1.text = ""
            textLabel3.text = "第4問"
            textView.text = "\n\n ガチャピンとムック、恐竜の子供はガチャピン?　\n\n\n ◯ or X"
            textLabel2.text = ""
            timer!.invalidate()
            //timer = nil
            countTime = 0
        } else if (countNumber == 5 && countTime == 3){
            textLabel1.text = ""
            textLabel3.text = "第5問"
            textView.text = "\n\n タラちゃんの苗字は磯野?　\n\n\n ◯ or X"
            textLabel2.text = ""
            timer!.invalidate()
            //timer = nil
            countTime = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

