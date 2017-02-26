//
//  StopwatchViewController.swift
//  StopWatch
//
//  Created by Junyu Wang on 2/16/17.
//  Copyright © 2017 Junyu Wang. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {

    @IBOutlet weak var stopWatchLabel: UILabel!
    
    var watch: Stopwatch = Stopwatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopWatchLabel.text = "123"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        let ti = NSInteger(interval)
        let ms = Int((interval.truncatingRemainder(dividingBy: 1)) * 100)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        
        return String(format: "%0.2d:%0.2d.%02d",minutes,seconds,ms)
    }
    
    
    func updateTimerLabel(_ timer: Timer) {
        let timeElapsed = (-1) * self.watch.getElapsedTime()
        
        let timeString = stringFromTimeInterval(interval: timeElapsed)
        self.stopWatchLabel.text = timeString
    }

    @IBAction func startButtonWasPressed(_ sender: UIButton) {
        self.watch.stopTimer()
        let newTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                target: self,
                                selector: #selector(updateTimerLabel),
                                userInfo: nil,
                                repeats: true)
        self.watch.startTimer(timer: newTimer)
    }
    
    
    @IBAction func stopButtonWasPressed(_ sender: UIButton) {
        self.watch.stopTimer()
    }
}
