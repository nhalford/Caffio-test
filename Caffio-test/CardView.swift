//
//  CardView.swift
//  Caffio-test
//
//  Created by Noah Halford on 8/4/14.
//  Copyright (c) 2014 Noah Halford. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var fullPhoto: Bool!
    var photo: UIImage!
    var authorPhoto: UIImage!
    
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var labelsView: UIView!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var authorPhotoView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var fullImageView: UIImageView!
    @IBOutlet var upperImageView: UIImageView!
    
    var date: NSDate!
    convenience init(frame: CGRect, image: UIImage, fullPhoto: Bool, category: String, title: String, subtitle: String, author: String, authorPhoto: UIImage, date: NSDate) {
        self.init(frame: frame)
        
        NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)
        
        self.backgroundColor = .whiteColor()
        
        self.fullPhoto = fullPhoto
        
        let proximaNova13 = UIFont(name: "ProximaNova-Regular", size: 13)
        let proximaNova14 = UIFont(name: "ProximaNova-Regular", size: 14)
        let proximaNova18 = UIFont(name: "ProximaNova-Regular", size: 18)
        
        var categoryText = NSMutableAttributedString(string: category.uppercaseString)
        let categoryLength = countElements(category)
        let categoryRange = NSRange(location: 0, length: categoryLength)
        categoryText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.toRaw(), range: categoryRange)
        categoryText.addAttribute(NSFontAttributeName, value: proximaNova14, range: categoryRange)
        self.categoryLabel.attributedText = categoryText
        
        var titleText = NSMutableAttributedString(string: title)
        let titleLength = countElements(title)
        let titleRange = NSRange(location: 0, length: titleLength)
        titleText.addAttribute(NSFontAttributeName, value: proximaNova18, range: titleRange)
        self.titleLabel.attributedText = titleText
        
        var subtitleText = NSMutableAttributedString(string: subtitle)
        let subtitleLength = countElements(subtitle)
        let subtitleRange = NSRange(location: 0, length: subtitleLength)
        subtitleText.addAttribute(NSFontAttributeName, value: proximaNova14, range: subtitleRange)
        self.subtitleLabel.attributedText = subtitleText
        
        var authorText = NSMutableAttributedString(string: author)
        let authorLength = countElements(author)
        let authorRange = NSRange(location: 0, length: authorLength)
        authorText.addAttribute(NSFontAttributeName, value: proximaNova13, range: authorRange)
        self.authorLabel.attributedText = authorText
        
        self.authorPhoto = authorPhoto
        self.authorPhotoView.image = authorPhoto
        self.authorPhotoView.contentMode = .ScaleAspectFit
        self.authorPhotoView.layer.cornerRadius = authorPhotoView.frame.size.height / 2
        self.authorPhotoView.layer.masksToBounds = true
        self.authorPhotoView.layer.borderWidth = 0
        
        self.date = date
        self.dateLabel!.textColor = .lightGrayColor()
        
        let dayComponent = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: date)
        let dayCount = NSCalendar.currentCalendar().components(.CalendarUnitDay, fromDate: date, toDate: NSDate(), options: nil)
        let days = dayCount.day
        
        var dateString = dateStringFromDays(days)
        if dateString == nil {
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "LLLL d"
            dateString = dateFormatter.stringFromDate(date)
        }
        
        var dateText = NSMutableAttributedString(string: dateString!.uppercaseString)
        let dateLength = countElements(dateString!)
        let dateRange = NSRange(location: 0, length: dateLength)
        dateText.addAttribute(NSFontAttributeName, value: proximaNova13, range: dateRange)
        self.dateLabel.attributedText = dateText
        
        // does the photo take up the full card or part of the card?
        if fullPhoto {
            self.fullImageView!.image = image
            self.fullImageView!.clipsToBounds = true
            self.fullImageView!.hidden = false
            self.upperImageView!.hidden = true
            
            titleLabel!.textColor = .whiteColor()
            subtitleLabel!.textColor = .whiteColor()
            authorLabel!.textColor = .whiteColor()
        } else {
            self.upperImageView!.image = image
            self.upperImageView!.clipsToBounds = true
            self.upperImageView!.hidden = false
            self.fullImageView!.hidden = true
            
            titleLabel!.textColor = .blackColor()
            subtitleLabel!.textColor = .grayColor()
            self.layer.borderColor = UIColor.grayColor().CGColor
            self.layer.borderWidth = 0.5
        }
        
        self.addSubview(labelsView)
      
    }
    
    func dateStringFromDays(days: Int) -> String? {
        switch days {
        case 0:
            return "today"
        case 1:
            return "1 day ago"
        case 2..<7:
            return "\(days) days ago"
        case 7..<14:
            return "last week"
        case 14..<21:
            return "2 weeks ago"
        case 21..<28:
            return "3 weeks ago"
        default:
            return nil
        }
        
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    
}
