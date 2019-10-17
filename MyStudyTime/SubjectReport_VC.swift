//
//  SubjectReport_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 16/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Subject Report
class SubjectReport_VC: UIViewController {
    
    //Subject Report Outlets
    
    //Navigation Bar
    @IBOutlet weak var navbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navbarOutletItem: UIBarButtonItem!
    
    //Label Fields
    @IBOutlet weak var pickerOutletLabel: UILabel!
    @IBOutlet weak var pickerviewOutletPickerview: UIPickerView!
    @IBOutlet weak var totalStudyOutletLabel: UILabel!
    @IBOutlet weak var infoOutletLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var thisweekOutletButton: UIButton!
    @IBOutlet weak var prevweekOutletButton: UIButton!
    @IBOutlet weak var thismonthOutletButton: UIButton!
    @IBOutlet weak var prevmonthOutletButton: UIButton!
    
    //TableView View
    @IBOutlet weak var tableviewOutletTableview: UITableView!
    
    
    //Variables for holding array values
    var studyDateArray: [Date] = []
    var startTimeArray: [Date] = []
    var endTimeArray: [Date] = []
    var subjectArray: [String] = []
    var totalTimeArray: [Int32] = []
    
    //Variable to hold PickerView Array
    var pickerSubArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Custom from here
        formatVC() //Format View Controller
        conDelegateDatasource() //Connect PickerView
    }
    
    //Format ViewController
    func formatVC() {
        
        //Set Viewcontroller backgound and image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Image fill
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format Navgation bar
        navbarOutletNavbar.topItem?.title = "STUDY SUBJECT REPORT"
        navbarOutletNavbar.layer.shadowColor = UIColor.black.cgColor
        navbarOutletNavbar.layer.shadowOpacity = 1
        navbarOutletNavbar.layer.shadowRadius = 5
        navbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        navbarOutletItem.title = "Back"
        
        //Format label field
        pickerOutletLabel.textColor = UIColor.purple
        pickerOutletLabel.textAlignment = .center
        pickerOutletLabel.font = pickerOutletLabel.font.withSize(14)
        pickerOutletLabel.layer.borderColor = UIColor.gray.cgColor
        pickerOutletLabel.layer.borderWidth = 1.0
        
        pickerviewOutletPickerview.layer.borderColor = UIColor.gray.cgColor
        pickerviewOutletPickerview.layer.borderWidth = 1.0
        
        totalStudyOutletLabel.textColor = UIColor.systemYellow
        totalStudyOutletLabel.textAlignment = .left
        totalStudyOutletLabel.font = totalStudyOutletLabel.font.withSize(14)
        totalStudyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        totalStudyOutletLabel.layer.borderWidth = 1.0
        
        //Format Buttons
        thisweekOutletButton.setTitleColor(.white, for: .normal)
        thisweekOutletButton.backgroundColor = UIColor.gray
        thisweekOutletButton.layer.shadowOpacity = 1
        thisweekOutletButton.layer.shadowRadius = 5
        thisweekOutletButton.layer.shadowColor = UIColor.black.cgColor
        thisweekOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        prevweekOutletButton.setTitleColor(.white, for: .normal)
        prevweekOutletButton.backgroundColor = UIColor.gray
        prevweekOutletButton.layer.shadowOpacity = 1
        prevweekOutletButton.layer.shadowRadius = 5
        prevweekOutletButton.layer.shadowColor = UIColor.black.cgColor
        prevweekOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        thismonthOutletButton.setTitleColor(.white, for: .normal)
        thismonthOutletButton.backgroundColor = UIColor.brown
        thismonthOutletButton.layer.shadowOpacity = 1
        thismonthOutletButton.layer.shadowRadius = 5
        thismonthOutletButton.layer.shadowColor = UIColor.black.cgColor
        thismonthOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        prevmonthOutletButton.setTitleColor(.white, for: .normal)
        prevmonthOutletButton.backgroundColor = UIColor.brown
        prevmonthOutletButton.layer.shadowOpacity = 1
        prevmonthOutletButton.layer.shadowRadius = 5
        prevmonthOutletButton.layer.shadowColor = UIColor.black.cgColor
        prevmonthOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        
        
        
    }
    
    //Button Action
    @IBAction func thisWeekButton(_ sender: UIButton) {
        resetArray() //Reset Array
        getStudySubject(inSubject: pickerOutletLabel.text!)
    }
    
    
    //Function to set Date components
    
    //Week of year - Current and Previous
    func weekOfYear(inPeriod: String) -> Int {
        
        //Variable Week Choice
        let periodChoice = ["Current Week", "Previous Week","Current Month","Previous Month"]
    
    
        //Get the week of year
        let cal = Calendar.current
        let curWk = Date()
        let curMth = Date()
        
        let getWkOfYear = cal.component(.weekOfYear, from: curWk)
        let getMthOfYear = cal.component(.month, from: curMth)
        
        //Set Week of Year
        var periodOfYear = 0
        
        
        //Condition for Week of year (Week Choice and inWeek)
        if periodChoice[0] == inPeriod {
            
            periodOfYear = getWkOfYear
            
        } else if periodChoice[1] == inPeriod {
            periodOfYear = getWkOfYear - 1
            
            //Get Month Dates
        } else if periodChoice[2] == inPeriod {
            periodOfYear = getMthOfYear
            
        } else if periodChoice[3] == inPeriod {
            
            periodOfYear = getMthOfYear - 1
        }
        
        return periodOfYear
        
    }
    
    //Function to retreive data from CoreData
    func getStudySubject(inSubject: String) {
        
        
        
        
        
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set NSFetch
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")

        studyEntity.predicate = NSPredicate(format: "subjectSelection == %@", inSubject)
        
        //Set fault result
        studyEntity.returnsObjectsAsFaults = false
        
        //Retreive subject from CoreData
        
        do {
            
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    //Study Date
                    guard let reStudyDate = (result.value(forKey: "studyDate") as? Date) else {
                        print("Unable to retreive Study Date")
                        return
                    }
                    //Assign value to array date
                    studyDateArray.append(reStudyDate)
                    
                    //Start Time
                    guard let resStartTime = (result.value(forKey: "startTime") as? Date) else {
                        print("Unable to retreive Start Time")
                        return
                    }
                    //Assign value to start time array
                    startTimeArray.append(resStartTime)
                    
                    //End Time
                    guard let resEndTime = (result.value(forKey: "endTime") as? Date) else {
                        print("Unable to retreive End Time")
                        return
                    }
                    //Assign vale ti end time array
                    endTimeArray.append(resEndTime)
                    
                    //Subject
                    guard let resSubject = (result.value(forKey: "subjectSelection") as? String) else {
                        print("Unable to retreive Subject")
                        return
                    }
                    //Assign to Subject Array
                    subjectArray.append(resSubject)
                    
                    guard let resTotalTime = (result.value(forKey: "studyTimeTotal") as? Int32) else {
                        print("Unable to retrieve Study Time Total")
                        return
                    }
                    //Assign to Time Total Array
                    totalTimeArray.append(resTotalTime)
                    
                }
                
                print(startTimeArray)
                print(studyDateArray)
                print(endTimeArray)
                print(subjectArray)
            }
        } catch {
            print("Unable to retrive records")
        }
        
        
        
        
    }
    
    
    //Function to reset Arrays
    func resetArray() {
        //Reset Array
        studyDateArray.removeAll()
        startTimeArray.removeAll()
        endTimeArray.removeAll()
        subjectArray.removeAll()
        totalTimeArray.removeAll()
    }
    
    
    
    //Call Report Menu
    @IBAction func callReportMenu(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Call Report Menu
        let reportMenu = mainStoryboard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
            reportMenu.modalPresentationStyle = .fullScreen
        //Call Function
        self.present(reportMenu,animated: true,completion: nil)
    }
    
    //Function to set Pickerview Delegta and Datasource
    func conDelegateDatasource() {
        pickerviewOutletPickerview.delegate = self
        pickerviewOutletPickerview.dataSource = self
    }
    
    


}

//Extension for Pickerview
extension SubjectReport_VC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Number of section
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    //Number of Section
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerSubArray.count
    }
    
    //The title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerSubArray[row]
    }
    
    //The selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //Assign Array value to label
        pickerOutletLabel.textColor = UIColor.purple
        pickerOutletLabel.font = pickerOutletLabel.font.withSize(22)
        pickerOutletLabel.text = pickerSubArray[row]
    }
}
