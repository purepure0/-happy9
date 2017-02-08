//
//  FamilyServerForChildVC.swift
//  HPY9Pasture
//
//  Created by purepure on 17/2/6.
//  Copyright © 2017年 xiaocool. All rights reserved.
//

import UIKit

class FamilyServerForChildVC: UIViewController,UITableViewDelegate,UITableViewDataSource {


    let familyServerTableView = UITableView()
    let headerImageArray = ["ic_baojie","ic_zhouqibaojie"]
    let tableHeaderUpLabelText = ["日常保洁","周期保洁"]
    let tableHeaderDownLabelText = ["家庭保洁 预约随心","一次下单 保洁无忧"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyServerTableView.delegate = self
        familyServerTableView.dataSource = self
        familyServerTableView.backgroundColor = LGBackColor
        familyServerTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64-40*px)
        familyServerTableView.separatorStyle = .None
//        familyServerTableView.sectionFooterHeight = 10*px
        self.view.addSubview(familyServerTableView)
        self.creatUI()

        // Do any additional setup after loading the view.
    }
    
    func creatUI(){
        let tableHeaderBackView = UIView.init(frame: CGRectMake(0, 0, WIDTH, 115*px))
        for index in 0...1 {
            let dayCleanView = UIView.init(frame: CGRectMake(CGFloat(index)*WIDTH/2, 9*px, WIDTH/2, 97*px))
            dayCleanView.backgroundColor = UIColor.whiteColor()
            let leftImageView = UIImageView.init(frame: CGRectMake(10*px, 0, 50*px, 97*px))
            leftImageView.image = UIImage(named: headerImageArray[index])
            leftImageView.contentMode = .Center
            dayCleanView.addSubview(leftImageView)
            
            let upLabel = UILabel.init(frame: CGRectMake(60*px, 30*px, 100*px, 20*px))
            upLabel.text = self.tableHeaderUpLabelText[index]
            upLabel.font = MainFont
            upLabel.textColor = MainTextColor
            upLabel.textAlignment = .Left
            dayCleanView.addSubview(upLabel)
            
            let downLabel = UILabel.init(frame: CGRectMake(60*px, 50*px, WIDTH/2-63*px, 20*px))
            downLabel.text = self.tableHeaderDownLabelText[index]
            downLabel.font = UIFont.systemFontOfSize(12)
            downLabel.textColor = MainTextBackColor
            downLabel.textAlignment = .Left
            dayCleanView.addSubview(downLabel)
            
            let backClearButton = UIButton.init(frame: dayCleanView.frame)
            backClearButton.backgroundColor = UIColor.clearColor()
            backClearButton.tag = index
            backClearButton.addTarget(self, action: #selector(self.backClearButton(_:)), forControlEvents: .TouchUpInside)
            
            tableHeaderBackView.addSubview(dayCleanView)
            tableHeaderBackView.addSubview(backClearButton)
            
            
            
        }
        let lineBackView = UIView.init(frame: CGRectMake(WIDTH/2-0.5, 5+9*px, 1, 97*px-10))
        lineBackView.backgroundColor = RGBACOLOR(160, g: 160, b: 160, a: 1)
        
        tableHeaderBackView.addSubview(lineBackView)
        
        self.familyServerTableView.tableHeaderView = tableHeaderBackView
        
        
        
    }
    
    //MARK: ------UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 44*px
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
            
    }
    
    //MARK: ------TableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        return cell
    }
    //MARK:ACTION
    func backClearButton(sender:UIButton){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
