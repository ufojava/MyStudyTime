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
    
    //Array to hold Data
    var studyDateArray: [String] = []
    var startTimeArray: [String] = []
    var endTimeArray: [String] = []
    var subjectArray: [String] = []
    var timeTotalArray: [Int32] = []
    
  

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
        searchOutletButton.backgroundColor = UIColor.blue
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchOutletButton.layer.cornerRadius = 8
        
        //Format Button Todays Records
        todayStudyOutletButton.setTitleColor(.white, for: .normal)
        todayStudyOutletButton.backgroundColor = UIColor.blue
        todayStudyOutletButton.layer.shadowOpacity = 1
        todayStudyOutletButton.layer.shadowRadius = 5
        todayStudyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        todayStudyOutletButton.layer.cornerRadius = 8
        
        //Format Button Current Week
        currentWeekStudyOutletButton.setTitleColor(.white, for: .normal)
        currentWeekStudyOutletButton.backgroundColor = UIColor.blue
        currentWeekStudyOutletButton.layer.shadowOpacity = 1
        currentWeekStudyOutletButton.layer.shadowRadius = 5
        currentWeekStudyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        currentWeekStudyOutletButton.layer.cornerRadius = 8
        
        
        //Format Button Current Month
        currentMonthStudyOutletButton.setTitleColor(.white, for: .normal)
        currentMonthStudyOutletButton.backgroundColor = UIColor.blue
        currentMonthStudyOutletButton.layer.shadowOpacity = 1
        currentMonthStudyOutletButton.layer.shadowRadius = 5
        currentMonthStudyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        currentMonthStudyOutletButton.layer.cornerRadius = 8
        
        
    }
    
    //Get All Study Records
    @IBAction func allStudyRecordsButton(_ sender: UIButton) {
        allStudyRecords() //Get all study records
        self.tableviewOutletView.reloadData()
    }
    
    //Get Records of the Week
    @IBAction func weekOfTheYearButtonAction(_ sender: UIButton) {
        
        getWeeklyRecords() //Function to get weekly records
        self.tableviewOutletView.reloadData()
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
    
    
    //Import Study Entity from CoreDate
    func allStudyRecords() {
        
        
        //Reset Array
           studyDateArray.removeAll()
           startTimeArray.removeAll()
           endTimeArray.removeAll()
           subjectArray.removeAll()
           timeTotalArray.removeAll()
        
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
                    
                }
                
                print(studyDateArray)
                print(startTimeArray)
                print(endTimeArray)
                print(subjectArray)
        
            } else {
                print("No Data found")
            }
        } catch {
            print("Unable to get results")
        }
        
        
        
    }
    
    
    
    //Function to retreive periodic record request
    func getWeeklyRecords() {
        
        //Reset Array
        studyDateArray.removeAll()
        startTimeArray.removeAll()
        endTimeArray.removeAll()
        subjectArray.removeAll()
        timeTotalArray.removeAll()
        
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
        let curWeekOfYear = dateFomrmatter.string(from: curWeek)
        let curWkOfYrToDate = dateFomrmatter.date(from: curWeekOfYear)
        let defaultWeekOfYear = weekOfYearCal.component(.weekOfYear, from: curWkOfYrToDate!)
            
        
        
        
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
                    if restudyWeekOfYear == defaultWeekOfYear {
                        
                        //Assign to Array
                        
                            studyDateArray.append(formatStdyDate) //Study Time Value
                            startTimeArray.append(formatStartTime) //Start Time Value
                            endTimeArray.append(formatEndTime) //End Time Value
                            subjectArray.append(resSubject) //Subject Selection
                            timeTotalArray.append(resTimeTotal) //Total Study Time
                        
                        
                            
                
                    
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                print(studyDateArray)
                print(startTimeArray)
                print(endTimeArray)
                print(subjectArray)
                print(timeTotalArray)

                
                
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
        cell.totalTimeOutletLabel.text = "Study Time \(timeTotalArray[indexPath.row])"
        cell.totalTimeOutletLabel.textAlignment = .left
        cell.totalTimeOutletLabel.font = cell.totalTimeOutletLabel.font.withSize(14)
        
        return cell
    }
    
}
