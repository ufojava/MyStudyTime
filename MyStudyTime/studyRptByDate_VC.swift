//
//  studyRptByDate_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 06/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

//Study Report by Date
import UIKit
import CoreData

class studyRptByDate_VC: UIViewController {
    
    //Report Form Outlets
    @IBOutlet weak var navBarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navBarOutletItem: UIBarButtonItem!
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var tableviewOutletView: UITableView!
    @IBOutlet weak var todayStudyOutletButton: UIButton!
    @IBOutlet weak var currentWeekStudyOutletButton: UIButton!
    @IBOutlet weak var currentMonthStudyOutletButton: UIButton!
    @IBOutlet weak var rptTotalTimeOutletLabel: UILabel!
    @IBOutlet weak var preWeekOutletButton: UIButton!
    @IBOutlet weak var prevMonthOutletButton: UIButton!
    
    
    //Array to hold Data
    var studyDateArray: [String] = []
    var startTimeArray: [String] = []
    var endTimeArray: [String] = []
    var subjectArray: [String] = []
    var timeTotalArray: [Int32] = []
    
  //Variable to hold Report Total Study Time
    var reportTotalStudyTime = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom function
        formatVC() //Format ViewController
        ConnDelegateDataSouce() //Connect Delegat and Datasource
    }
    
    //Format ViewController
    func formatVC() {
        
        //Set Viewcontroller background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
            backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format navigation bar
        navBarOutletNavbar.topItem?.title = "STUDY REPORT BY DATE"
        navBarOutletNavbar.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navBarOutletNavbar.layer.shadowOpacity = 1
        navBarOutletNavbar.layer.shadowRadius = 5
        navBarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format navigation Item
        navBarOutletItem.title = "Back"
        
    
        
        //Format Button All Records
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton!.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        searchOutletButton.backgroundColor = UIColor.black
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
    
        
        //Format Button Todays Records
        todayStudyOutletButton.setTitleColor(.white, for: .normal)
        todayStudyOutletButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        todayStudyOutletButton.backgroundColor = UIColor.black
        todayStudyOutletButton.layer.shadowOpacity = 1
        todayStudyOutletButton.layer.shadowRadius = 5
        todayStudyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)

        
        //Format Button Current Week
        currentWeekStudyOutletButton.setTitleColor(.white, for: .normal)
        currentWeekStudyOutletButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        currentWeekStudyOutletButton.backgroundColor = UIColor.purple
        currentWeekStudyOutletButton.layer.shadowOpacity = 1
        currentWeekStudyOutletButton.layer.shadowRadius = 5
        currentWeekStudyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
    
        
        //Format Button Previous Week
        preWeekOutletButton.setTitleColor(.white, for: .normal)
        preWeekOutletButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        preWeekOutletButton.backgroundColor = UIColor.purple
        preWeekOutletButton.layer.shadowOpacity = 1
        preWeekOutletButton.layer.shadowRadius = 5
        preWeekOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
      
        
        
        //Format Button Current Month
        currentMonthStudyOutletButton.setTitleColor(.white, for: .normal)
        currentMonthStudyOutletButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        currentMonthStudyOutletButton.backgroundColor = UIColor.red
        currentMonthStudyOutletButton.layer.shadowOpacity = 1
        currentMonthStudyOutletButton.layer.shadowRadius = 5
        currentMonthStudyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        //Format Button Previous Month
        prevMonthOutletButton.setTitleColor(.white, for: .normal)
        prevMonthOutletButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevMonthOutletButton.backgroundColor = UIColor.red
        prevMonthOutletButton.layer.shadowOpacity = 1
        prevMonthOutletButton.layer.shadowRadius = 5
        prevMonthOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
    
        
        
    }
    
    //Get All or Todays Records
    
    
    
    @IBAction func allStudyRecordsButton(_ sender: UIButton) {
        
        allStudyRecords()
        self.tableviewOutletView.reloadData()
    }
    
    //Todays study records
    @IBAction func todayStudyRecordButton(_ sender: UIButton) {
        
        all_Today_StudyRecords(inDay: dayOfYear(inDay: todayRecords))
        print(dayOfYear(inDay: todayRecords))
        self.tableviewOutletView.reloadData()
    }
    
    
    //Get Records of the Week
    @IBAction func weekOfTheYearButtonAction(_ sender: UIButton) {
        
        getWeeklyRecords(inWeek: weekOfYear(inWeek: currentWeekOfYear))
        self.tableviewOutletView.reloadData()
        print(weekOfYear(inWeek: currentWeekOfYear))
    }
    
    @IBAction func prevWeekOfWeekYearButton(_ sender: UIButton) {
        
        getWeeklyRecords(inWeek: weekOfYear(inWeek: prevWeekOfYear))
        self.tableviewOutletView.reloadData()
        print(weekOfYear(inWeek: prevWeekOfYear))
    }
    
    //Get Month of Year
    @IBAction func currentMonthOfYear(_ sender: UIButton) {
        
        
        getMonthlyRecords(inMonth: monthOfYear(inMonth: currentMonthOfYear))
        self.tableviewOutletView.reloadData()
        print((monthOfYear(inMonth: currentMonthOfYear)))
        
    }
    
    //Get previous Month
    @IBAction func prevMonthOfYearButton(_ sender: UIButton) {
        
        getMonthlyRecords(inMonth: monthOfYear(inMonth: prevMonthOfYear))
        self.tableviewOutletView.reloadData()
        print((monthOfYear(inMonth: prevMonthOfYear)))
    }
    
    

    
    
    //Menu call
    @IBAction func backToRptMenu(_ sender: UIBarButtonItem) {
        
        //Storybaord
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let reportMenu = mainStoryBoard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
        reportMenu.modalPresentationStyle = .fullScreen
        
        //Call M
        self.present(reportMenu,animated: true,completion: nil)
    }
    
    
    //Import Study Entity from CoreData
    func allStudyRecords() {
        
        
        //Reset Array
           studyDateArray.removeAll()
           startTimeArray.removeAll()
           endTimeArray.removeAll()
           subjectArray.removeAll()
           timeTotalArray.removeAll()
        
        //Reset Report Study Total
        reportTotalStudyTime = 0
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Study Entity
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")

        //Chack fault reports
        studyEntity.returnsObjectsAsFaults = false
        
        //Serach Core Data database
        
        //Format Date and Time
        let dateFomrmatter = DateFormatter()
            dateFomrmatter.timeStyle = .short
            dateFomrmatter.dateStyle = .medium
        
        let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
        
        
        do {
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    guard  let resStudyDate = result.value(forKey: "studyDate") as? Date else {
                        print("unable to retreive study date")
                        return
                    }
                    
                    //Assign to Array
                    let mystdyDateFormat = dateFomrmatter.string(from: resStudyDate)
                    studyDateArray.append(mystdyDateFormat)
                    
                    guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                        print("Unable to retreive start time")
                        return
                    }
                    //Assign result to array
                    let myStartTimeFormat = timeFormatter.string(from: resStartTime)
                    startTimeArray.append(myStartTimeFormat)
                    
                    guard let resEndTime = result.value(forKey: "endTime") as? Date else {
                        print("Unable to retreive end time")
                        return
                    }
                    //Assign result to array
                    let myEndTimeFormat = timeFormatter.string(from: resEndTime)
                    endTimeArray.append(myEndTimeFormat)
                    
                    guard let resSubject = result.value(forKey: "subjectSelection") as? String else {
                        print("Unable to retreive subject")
                        return
                    }
                    //Assign result to array
                    subjectArray.append(resSubject)
                    
                    guard let resTotalTime = result.value(forKey: "studyTimeTotal") as? Int32 else {
                        print("Unable to retrieve total study time")
                        return
                    }
                    //Assign result to Total Study Time
                    timeTotalArray.append(resTotalTime)
                    reportTotalStudyTime += Int(resTotalTime)
                    
                }
                
                print(studyDateArray)
                print(startTimeArray)
                print(endTimeArray)
                print(subjectArray)
                rptTotalTimeOutletLabel.textColor = UIColor.yellow
                rptTotalTimeOutletLabel.text = "Total Hours \(reportTotalStudyTime)"
        
            } else {
                print("No Data found")
            }
        } catch {
            print("Unable to get results")
        }
        
        
        
    }
    
    
  
    
    //Function to get All or Todays records from Study
    func all_Today_StudyRecords(inDay: Int) {
        
        //Reset Array
               studyDateArray.removeAll()
               startTimeArray.removeAll()
               endTimeArray.removeAll()
               subjectArray.removeAll()
               timeTotalArray.removeAll()
               
               //Reset Report Study Total
               reportTotalStudyTime = 0
               
               //Format Date and Time
               let dateFomrmatter = DateFormatter()
                   dateFomrmatter.timeStyle = .none
                   dateFomrmatter.dateStyle = .medium
                   
               let timeFormatter = DateFormatter()
                   timeFormatter.dateStyle = .none
                   timeFormatter.timeStyle = .short
               
               
               //Set Current Week
                     let dayOfYearCal = Calendar.current
                   
               
             
                   
               
               //Set Context
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
               
               //Get Study Entity
               let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
               
               //Set Fault result
               studyEntity.returnsObjectsAsFaults = false
               
               //Get all records from Database
               
               do {
                   
                   let results = try context.fetch(studyEntity)
                   if results.count > 0 {
                       for result in results as! [NSManagedObject] {
                           
                           guard let resStudyDate = result.value(forKey: "studyDate")  as? Date else {
                               print("Unable to retreive study Date")
                               return
                           }
                           
                           guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                               print("Unable to retrieve start time")
                               return
                           }
                           
                           guard let resEndTime = result.value(forKey: "endTime") as? Date else {
                               print("Unable to retreive end time")
                               return
                           }
                           
                           guard let resSubject = result.value(forKey: "subjectSelection") as? String else {
                               print("Unable to retreive subject selection")
                               return
                           }
                           
                           guard let resTimeTotal = result.value(forKey: "studyTimeTotal") as? Int32 else {
                               print("Unable to retreive Total Study Time")
                               return
                           }
                           
                           //Convert Start Time from Date to String amd Medium format
                           let formatStartTime = timeFormatter.string(from: resStartTime)
                           
                           //Convert End Time from Date to String amd Medium format
                           let formatEndTime = timeFormatter.string(from: resEndTime)
                           
                           //Convert Subject from Date to String and Medium format
                           
                           
                           //Shorten Date format to medium
                           let resStudyDateConvert = dateFomrmatter.string(from: resStudyDate)
                           
                           //Convert date back to date to get Week Of Year
                           let stdyDateFromStringToDate = dateFomrmatter.date(from: resStudyDateConvert)
                           
                           //Convert Study Date back to String
                           let formatStdyDate = dateFomrmatter.string(from: resStudyDate)
                           
                           
                           
                           
                           //Get Week Of Year
                        let restudyDayOfYear = dayOfYearCal.component(.day, from: stdyDateFromStringToDate!)
                            
                           //Compare Week of year with Default Week of Year
                           if (restudyDayOfYear == inDay) {
                            
                   
                               //Assign to Array
                               
                                   studyDateArray.append(formatStdyDate) //Study Time Value
                                   startTimeArray.append(formatStartTime) //Start Time Value
                                   endTimeArray.append(formatEndTime) //End Time Value
                                   subjectArray.append(resSubject) //Subject Selection
                                   timeTotalArray.append(resTimeTotal) //Total Study Time
                               
                           //Total Study Time
                           reportTotalStudyTime += Int(resTimeTotal)
                               
                                 
                           }
                           
                           
                       print(restudyDayOfYear)
                           
                       }
                       print(studyDateArray)
                       print(startTimeArray)
                       print(endTimeArray)
                       print(subjectArray)
                       print(timeTotalArray)
                    
                       rptTotalTimeOutletLabel.textColor = UIColor.yellow
                       rptTotalTimeOutletLabel.text = "Total Hours \(reportTotalStudyTime)"

                       
                       
                   }
               } catch {
                   print("Unable to retreive record")
               }
        
              
              
        
        
    }
    
    
    
    //Variable for Times of the year
    var currentWeekOfYear = "Current Week"
    var prevWeekOfYear = "Previous Week"
    var currentMonthOfYear = "Current Month"
    var prevMonthOfYear = "Previous Month"
    
    
    //Function to get Week of year
    func weekOfYear(inWeek: String) -> Int {
        
        let weekChoice = ["Current Week", "Previous Week"]
        
        //Format Date and Time
        let dateFomrmatter = DateFormatter()
            dateFomrmatter.timeStyle = .none
            dateFomrmatter.dateStyle = .medium
                
        let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
        
     //Set Current Week
          let weekOfYearCal = Calendar.current
          let curWeek = Date()
          let defaultWeekOfYear = weekOfYearCal.component(.weekOfYear, from: curWeek)

          var weekOfYear = 0
        
            //Condition to run week of year
            
        if (weekChoice[0] == inWeek) {
            
            weekOfYear = defaultWeekOfYear
            
        } else if (weekChoice[1] == inWeek) {
            
            weekOfYear = defaultWeekOfYear - 1
            
        }
        
        return weekOfYear
      
    }
    
    
    var allRecords = "All Records"
      var todayRecords = "Todays Records"
      //Function to records for today
      func dayOfYear(inDay: String) -> Int {
          
          let studyDay = "Todays Records"
          
          //Format Date and Time
          let dateFomrmatter = DateFormatter()
              dateFomrmatter.dateStyle = .medium
                  
          
       //Set Current Week
            let dayOfYearCal = Calendar.current
            let curDay = Date()
        let defaultDayOfYear = dayOfYearCal.component(.day, from: curDay)

            var dayOfYear = 0
          
              //Condition to run week of year
              
          if (studyDay == inDay) {
              
              dayOfYear = defaultDayOfYear
              
          }
          
          return dayOfYear
        
      }

    
    
    
    //Function to get Month of the Year
    func monthOfYear(inMonth: String) -> Int {
        
        let monthChoice = ["Current Month", "Previous Month"]
        
        //Format Date and Time
        let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
        //Set Current Week
        let calComponent = Calendar.current
        let curMonth = Date()
        let monthComponent = calComponent.component(.month, from: curMonth)
        var monthOfYear = 0
        
        //Set condition for the month of the year
        if monthChoice[0] == inMonth {
            
            monthOfYear = monthComponent
        } else if monthChoice[1] == inMonth {
            
            monthOfYear = monthComponent - 1
        }
        
        return monthOfYear
    }
    
    
    
    //Function to retreive periodic record request
    func getWeeklyRecords(inWeek: Int) {
        
        //Reset Array
        studyDateArray.removeAll()
        startTimeArray.removeAll()
        endTimeArray.removeAll()
        subjectArray.removeAll()
        timeTotalArray.removeAll()
        
        //Reset Report Study Total
        reportTotalStudyTime = 0
        
        //Format Date and Time
        let dateFomrmatter = DateFormatter()
            dateFomrmatter.timeStyle = .none
            dateFomrmatter.dateStyle = .medium
            
        let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
        
        
        //Set Current Week
              let weekOfYearCal = Calendar.current
            
        
      
            
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Get Study Entity
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
        //Set Fault result
        studyEntity.returnsObjectsAsFaults = false
        
        //Get all records from Database
        
        do {
            
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    guard let resStudyDate = result.value(forKey: "studyDate")  as? Date else {
                        print("Unable to retreive study Date")
                        return
                    }
                    
                    guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                        print("Unable to retrieve start time")
                        return
                    }
                    
                    guard let resEndTime = result.value(forKey: "endTime") as? Date else {
                        print("Unable to retreive end time")
                        return
                    }
                    
                    guard let resSubject = result.value(forKey: "subjectSelection") as? String else {
                        print("Unable to retreive subject selection")
                        return
                    }
                    
                    guard let resTimeTotal = result.value(forKey: "studyTimeTotal") as? Int32 else {
                        print("Unable to retreive Total Study Time")
                        return
                    }
                    
                    //Convert Start Time from Date to String amd Medium format
                    let formatStartTime = timeFormatter.string(from: resStartTime)
                    
                    //Convert End Time from Date to String amd Medium format
                    let formatEndTime = timeFormatter.string(from: resEndTime)
                    
                    //Convert Subject from Date to String and Medium format
                    
                    
                    //Shorten Date format to medium
                    let resStudyDateConvert = dateFomrmatter.string(from: resStudyDate)
                    
                    //Convert date back to date to get Week Of Year
                    let stdyDateFromStringToDate = dateFomrmatter.date(from: resStudyDateConvert)
                    
                    //Convert Study Date back to String
                    let formatStdyDate = dateFomrmatter.string(from: resStudyDate)
                    
                    
                    
                    
                    //Get Week Of Year
                    let restudyWeekOfYear = weekOfYearCal.component(.weekOfYear, from: stdyDateFromStringToDate!)
                     
                    //Compare Week of year with Default Week of Year
                    if (restudyWeekOfYear == inWeek) {
                        
                        //Assign to Array
                        
                            studyDateArray.append(formatStdyDate) //Study Time Value
                            startTimeArray.append(formatStartTime) //Start Time Value
                            endTimeArray.append(formatEndTime) //End Time Value
                            subjectArray.append(resSubject) //Subject Selection
                            timeTotalArray.append(resTimeTotal) //Total Study Time
                        
                    //Total Study Time
                    reportTotalStudyTime += Int(resTimeTotal)
                        
                          
                    } else if (restudyWeekOfYear == inWeek) {
                        
                        //Assign to Array
                            
                                studyDateArray.append(formatStdyDate) //Study Time Value
                                startTimeArray.append(formatStartTime) //Start Time Value
                                endTimeArray.append(formatEndTime) //End Time Value
                                subjectArray.append(resSubject) //Subject Selection
                                timeTotalArray.append(resTimeTotal) //Total Study Time
                            
                        //Total Study Time
                        reportTotalStudyTime += Int(resTimeTotal)
                        
                    }
                    
                    
                    
                    
                }
                print(studyDateArray)
                print(startTimeArray)
                print(endTimeArray)
                print(subjectArray)
                print(timeTotalArray)
                rptTotalTimeOutletLabel.textColor = UIColor.yellow
                rptTotalTimeOutletLabel.text = "Total Hours \(reportTotalStudyTime)"

                
                
            }
        } catch {
            print("Unable to retreive record")
        }
        
        
    }
    
    //Connect Tableviw Delegate and Datasource
    func ConnDelegateDataSouce() {
        
        tableviewOutletView.delegate = self
        tableviewOutletView.dataSource = self
    }
    
    
    //Function to get Current Month and Previous Month Records
    func getMonthlyRecords(inMonth: Int) {
        
        //Reset all arrays
        studyDateArray.removeAll()
        startTimeArray.removeAll()
        endTimeArray.removeAll()
        subjectArray.removeAll()
        timeTotalArray.removeAll()
        
        //Reset Report Time Total
        reportTotalStudyTime = 0
        
        //Format Date and Time
        let dateFomrmatter = DateFormatter()
            dateFomrmatter.timeStyle = .none
            dateFomrmatter.dateStyle = .medium
            
        let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
        
        
        //Set Current Week
              let MonthOfYearCal = Calendar.current
        
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Get Study Entity
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
        //Set Fault result
        studyEntity.returnsObjectsAsFaults = false
        
        //Get all records from Database
        
        do {
            
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    guard let resStudyDate = result.value(forKey: "studyDate")  as? Date else {
                        print("Unable to retreive study Date")
                        return
                    }
                    
                    guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                        print("Unable to retrieve start time")
                        return
                    }
                    
                    guard let resEndTime = result.value(forKey: "endTime") as? Date else {
                        print("Unable to retreive end time")
                        return
                    }
                    
                    guard let resSubject = result.value(forKey: "subjectSelection") as? String else {
                        print("Unable to retreive subject selection")
                        return
                    }
                    
                    guard let resTimeTotal = result.value(forKey: "studyTimeTotal") as? Int32 else {
                        print("Unable to retreive Total Study Time")
                        return
                    }
                    
                    //Convert Start Time from Date to String amd Medium format
                    let formatStartTime = timeFormatter.string(from: resStartTime)
                    
                    //Convert End Time from Date to String amd Medium format
                    let formatEndTime = timeFormatter.string(from: resEndTime)
                    
                    //Convert Subject from Date to String and Medium format
                    
                    
                    //Shorten Date format to medium
                    let resStudyDateConvert = dateFomrmatter.string(from: resStudyDate)
                    
                    //Convert date back to date to get Week Of Year
                    let stdyDateFromStringToDate = dateFomrmatter.date(from: resStudyDateConvert)
                    
                    //Convert Study Date back to String
                    let formatStdyDate = dateFomrmatter.string(from: resStudyDate)
                    
                    
                    
                    
                    //Get Week Of Year
                    let restudyMonthOfYear = MonthOfYearCal.component(.month, from: stdyDateFromStringToDate!)
                     
                    //Compare Week of year with Default Week of Year
                    if (restudyMonthOfYear == inMonth) {
                        
                        //Assign to Array
                        
                            studyDateArray.append(formatStdyDate) //Study Time Value
                            startTimeArray.append(formatStartTime) //Start Time Value
                            endTimeArray.append(formatEndTime) //End Time Value
                            subjectArray.append(resSubject) //Subject Selection
                            timeTotalArray.append(resTimeTotal) //Total Study Time
                        
                    //Total Study Time
                    reportTotalStudyTime += Int(resTimeTotal)
                        
                          
                    } else if (restudyMonthOfYear == inMonth) {
                        
                        //Assign to Array
                            
                                studyDateArray.append(formatStdyDate) //Study Time Value
                                startTimeArray.append(formatStartTime) //Start Time Value
                                endTimeArray.append(formatEndTime) //End Time Value
                                subjectArray.append(resSubject) //Subject Selection
                                timeTotalArray.append(resTimeTotal) //Total Study Time
                            
                        //Total Study Time
                        reportTotalStudyTime += Int(resTimeTotal)
                        
                    }
                    
                    
                    
                    
                }
                print(studyDateArray)
                print(startTimeArray)
                print(endTimeArray)
                print(subjectArray)
                print(timeTotalArray)
                rptTotalTimeOutletLabel.textColor = UIColor.yellow
                rptTotalTimeOutletLabel.text = "Total Hours \(reportTotalStudyTime)"

                
                
            }
        } catch {
            print("Unable to retreive record")
        }
        
        
        
        
        
        
    }
    

    
    
    
    
    
    
    
    
    
    
    

}

//Extension for tableview
extension studyRptByDate_VC: UITableViewDataSource, UITableViewDelegate {
    
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyDateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOutletView.dequeueReusableCell(withIdentifier: "reportCell", for: indexPath) as! stdyRptByDateCell_VC
        
        //Assign cell values from arrays and format font and color
        
        //Study Date
        cell.studyDateOutletLabel.text  = "Study Date: \(studyDateArray[indexPath.row])"
        cell.studyDateOutletLabel.textColor = UIColor.blue
        cell.studyDateOutletLabel.textAlignment = .left
        cell.studyDateOutletLabel.font = cell.studyDateOutletLabel.font.withSize(14)
        
        
        //Start Time
        cell.startTimeOutletLabel.text =  "Start Time: \(startTimeArray[indexPath.row])"
        cell.startTimeOutletLabel.textAlignment = .left
        cell.startTimeOutletLabel.font = cell.startTimeOutletLabel.font.withSize(14)
        
        //End Time
        cell.endTimeOutletLabel.text = "End Time: \(endTimeArray[indexPath.row])"
        cell.endTimeOutletLabel.textAlignment = .left
        cell.endTimeOutletLabel.font = cell.endTimeOutletLabel.font.withSize(14)
        
        //Study Subject
        cell.subjectOutletLabel.text = "Subject: \(subjectArray[indexPath.row])"
        cell.subjectOutletLabel.textAlignment = .left
        cell.subjectOutletLabel.font = cell.subjectOutletLabel.font.withSize(14)
        
        //Total Time
        cell.totalTimeOutletLabel.text = "Study Time \(timeTotalArray[indexPath.row]) Hrs"
        cell.totalTimeOutletLabel.textAlignment = .left
        cell.totalTimeOutletLabel.font = cell.totalTimeOutletLabel.font.withSize(14)
        
        return cell
    }
    
}
