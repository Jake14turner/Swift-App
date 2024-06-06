//
//  ViewController.swift
//  pasty
//
//  Created by jake turner on 11/25/23.
//

//  ViewController.swift
//  First Try
//
//  Created by jake turner on 11/25/23.
//

import Foundation

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hoursLeft: UILabel!
    @IBOutlet weak var minutesLeft: UILabel!
    @IBOutlet weak var secondsLeft: UILabel!
    @IBOutlet weak var yonksLeft: UILabel!
    @IBOutlet var imgDoggo: UIImageView!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var daysAwayLabel: UILabel!
    @IBOutlet weak var hoursAwayLabel: UILabel!
    @IBOutlet weak var minsAwayLabel: UILabel!
    @IBOutlet weak var secsAwayLabel: UILabel!
    
    var timer: Timer?
    
    let selectedDateKey = "selectedDate"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTime()
        datePicker.minimumDate = Date()
        
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        if let savedDate = UserDefaults.standard.object(forKey: selectedDateKey) as? Date {
            datePicker.date = savedDate
        }
        
        updateCountdownLabel()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdownLabel), userInfo: nil, repeats: true)
        
        changeDatePickerTextColor(datePicker: datePicker, color: .black)
    }
    
    
    
    func changeDatePickerTextColor(datePicker: UIDatePicker, color: UIColor) {
           for subview in datePicker.subviews {
               if let label = findLabelInView(subview) {
                   label.textColor = color
               }
           }
       }
    
    func findLabelInView(_ view: UIView) -> UILabel? {
           if let label = view as? UILabel {
               return label
           }
           
           for subview in view.subviews {
               if let label = findLabelInView(subview) {
                   return label
               }
           }
           
           return nil
       }
    
    
    
    
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
       
        
        UserDefaults.standard.set(datePicker.date, forKey: selectedDateKey)
        
        
        updateCountdownLabel()
    }
    
    
    func startTimer() {
           timer?.invalidate()
           timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdownLabel), userInfo: nil, repeats: true)
       }
    

    @objc func updateCountdownLabel() {
           let currentDate = Date()
           let selectedDate = datePicker.date
           
           let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: selectedDate)
        let days = components.day ?? 0
           let hours = components.hour ?? 0
           let minutes = components.minute ?? 0
           let seconds = components.second ?? 0
           
           if let remainingTime = calendar.date(byAdding: components, to: currentDate), remainingTime > currentDate {
               daysAwayLabel.text = String(describing: components.day ?? 0)
                          // Update hours label
                          hoursAwayLabel.text = String(describing: components.hour ?? 0)
                          // Update minutes label
                          minsAwayLabel.text = String(describing: components.minute ?? 0)
                          // Update seconds label
                          secsAwayLabel.text = String(describing: components.second ?? 0)
            
               }
     else {
               // Reset timer to next year with same date and time
                          if let nextYear = calendar.date(byAdding: .year, value: 1, to: selectedDate) {
                              let components = calendar.dateComponents([.hour, .minute, .second], from: nextYear, to: selectedDate)
                              if let nextYearDate = calendar.date(byAdding: components, to: nextYear) {
                                  datePicker.date = nextYearDate
                                  UserDefaults.standard.set(nextYearDate, forKey: selectedDateKey)
                                  // Restart the timer for the next year's countdown
                                  startTimer()
                              }
                          }
           }
       }
    
    
    
    
    
    
    /*
    func updateDaysAwayLabel() {
           let currentDate = Date()
           let selectedDate = datePicker.date
           
           let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: selectedDate)
           let daysDifference = components.day ?? 0
        let hoursDifference = components.hour ?? 0
        let minutesDifference = components.minute ?? 0
        let secondsDifference = components.second ?? 0
           
        daysAwayLabel.text = "Days Away: \(abs(daysDifference))"
        hoursAwayLabel.text = "\(abs(hoursDifference)) hours"
        minsAwayLabel.text = "\(abs(minutesDifference)) minutes"
        secsAwayLabel.text = "\(abs(secondsDifference)) seconds"
       }
    
    */
    
    
    
    
    
    
    
    let months:[String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    
    
    
    public func startTime() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss a"
            
            
            
            
            
            
            let currentTime = dateFormatter.string(from: date)
            
            //Getting hours to seconds
            let char1 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 0)]
            
            
            let char2 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 1)]
            
            
            let hourss = (((char1.wholeNumberValue!) * 10 + char2.wholeNumberValue!))
            
            var hourToSecs = (((char1.wholeNumberValue!) * 10 + char2.wholeNumberValue!) * 60) * 60
            
            //Getting minutes to seconds
            let char3 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 3)]
            
            let char4 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 4)]
            
            let minsToSecs = ((char3.wholeNumberValue!) * 10 + char4.wholeNumberValue!) * 60
            
            //Getting seconds to seconds
            let char5 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 6)]
            
            let char6 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 7)]
            
            let secsToSecs = ((char5.wholeNumberValue! * 10) + char6.wholeNumberValue!)
            
            
            
            // 86400 pr day
            //24 hour
            let char7 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 9)]
            let char8 = currentTime[currentTime.index(currentTime.startIndex, offsetBy: 10)]
            
            let newStrr = String(char7) + String(char8)
            
            
            
            if newStrr == "AM" && hourss == 12{
                hourToSecs = 0
            }
            
            
            
            
            
            var totalAddedAmt = hourToSecs + minsToSecs + secsToSecs
            
            if newStrr == "PM" {
                totalAddedAmt = totalAddedAmt + 43200
            }
            
            
            
            //total added amt is current time
            
            var userInputtedAmount = 4062390 //12:00 am
            
            var almostDifference = 0
            
            
            var newHours = 0
            var newMins = 1
            var newSecs = 3
            var theMessage = ""
            if totalAddedAmt - userInputtedAmount < 0
            {
                almostDifference = totalAddedAmt - userInputtedAmount
                let difference = abs(almostDifference)
                print(difference)
                
                
                let almostNewHours =  ((difference / 60) / 60)
                //
                newHours = abs(almostNewHours)
                // var nnewHours = abs(almostNewHours)
                //
                let almostNewMins = ((difference / 60) - (newHours * 60))
                newMins = abs(almostNewMins)
                
                let almostNewSecs = difference - ((newHours * 60) * 60)
                newSecs = (abs(almostNewSecs) - (newMins * 60))
                
            }
            else
            {
                
                almostDifference = totalAddedAmt - userInputtedAmount
                let difference = abs(almostDifference)
                print(difference)
                
                
                //
                newHours = 0
                // var nnewHours = abs(almostNewHours)
                //
                
                newMins = 0
                
                
                newSecs = 0
                
                
                
                theMessage = "Stop"
                print("FAIl")
                
                
            }
            
            // var almostDifference = totalAddedAmt - userInputtedAmount
            
            
            //9100
            
            
            /*
             if totalAddedAmt + userInputtedAmount > 86400
             {
             almostDifference = (86400 - abs(totalAddedAmt)) + userInputtedAmount - (86400 - abs(totalAddedAmt))
             almostDifference = almostDifference - 1
             }
             else {
             almostDifference = userInputtedAmount
             }
             */
            
            
            //total amount
            
            
            
            
            
           /*
            func daysBetweenDates(from startDate: Date, to endDate: Date) -> Int {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day], from: startDate, to: endDate)
                return components.day ?? 0
            }
            
            let currentDate1 = Date()
            let selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: currentDate1)!
            
            
            let daysDifference = daysBetweenDates(from: currentDate1, to: selectedDate)
            
            print("days between: \(daysDifference)")
          */
            
            //Testing
            // print(currentTime)
            
            
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            // let currentDate = dateFormatter.string(from: date)
            
            let calender = Calendar.current
            let month = calender.component(.month, from: date)
            let day = calender.component(.day, from: date)
            let monthInWords = self.months[month-1]
            
            var dayString = String(day)
            
            let lastChar = dayString.last!
            
            if lastChar == "1" {
                dayString = dayString + "st"
            }
            else if lastChar == "2" {
                dayString = dayString + "nd"
            }
            else if lastChar == "3" {
                dayString = dayString + "rd"
            }
            else{
                dayString = dayString + "th"
            }
            
            let year = calender.component(.year, from: date)
            
            let currentDate = "\(dayString) \(monthInWords), \(year)"
            
            
            
            
            
            
            
            
            //find number of days and months left
            
            
            
            
            
            let yonk = dateFormatter.string(from: date)
            
            
            //get month
            let thing1 = yonk[yonk.index(yonk.startIndex, offsetBy: 3)]
            let thing2 = yonk[yonk.index(yonk.startIndex, offsetBy: 4)]
            
            _ = String(thing1) + String(thing2)
            
            
            //get day
            _ = yonk[yonk.index(yonk.startIndex, offsetBy: 0)]
            _ = yonk[yonk.index(yonk.startIndex, offsetBy: 1)]
            _ = "06"
            
            
            
            let newHourss = newHours / 24
            
            
            
            
           // self.timeLabel.text = currentTime
          //  self.dateLabel.text = currentDate
           // self.hoursLeft.text = String(newHours)
            //self.minutesLeft.text = String(newMins)
            //self.secondsLeft.text = String(newSecs)
           // self.yonksLeft.text = String(newHourss)
           // self.message.text = theMessage
            
        }
        
    }
    
    
    

    
    
    
        //startTime()
        // imgDoggo.layer.cornerRadius = 30
        /*
        let date2 = Date()
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "dd/MM/yyyy"
        
        
        
        dateField.text = formatter2.string(from:date2)


        let datePicker2 = UIDatePicker()
        datePicker2.datePickerMode = .date
        
        datePicker2.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for:UIControl.Event.valueChanged)
        
        
        datePicker2.frame.size = CGSize(width: 0, height: 250)
        
        dateField.inputView = datePicker2
        */
    
    /*
    @objc func datePickerValueChanged(sender: UIDatePicker)
    {
        print(sender.date)
    }
    */
    
    
   
    
}
