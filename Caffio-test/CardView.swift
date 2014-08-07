//
//  CardView.swift
//  Caffio-test
//
//  Created by Noah Halford on 8/4/14.
//  Copyright (c) 2014 Noah Halford. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var fullPhoto: Bool?
    var photo: UIImage?
    var authorPhoto: UIImage?
    
    @IBOutlet var categoryLabel: UILabel?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var labelsView: UIView?
    @IBOutlet var subtitleLabel: UILabel?
    @IBOutlet var authorLabel: UILabel?
    @IBOutlet var authorPhotoView: UIImageView?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var fullImageView: UIImageView?
    @IBOutlet var upperImageView: UIImageView?
    
    var date: NSDate?
    convenience init(frame: CGRect, image: UIImage, fullPhoto: Bool, category: String, title: String, subtitle: String, author: String, authorPhoto: UIImage, date: NSDate) {
        self.init(frame: frame)
        
        NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)
        
        self.backgroundColor = .whiteColor()
        
        self.fullPhoto = fullPhoto
        
        
        var categoryText = NSMutableAttributedString(string: category.uppercaseString)
        let categoryLength = countElements(category)
        let range = NSRange(location: 0, length: categoryLength)
        categoryText.addAttribute(String(NSUnderlineStyleAttributeName), value: NSUnderlineStyle.StyleSingle.toRaw(), range: range)
        
        self.categoryLabel!.attributedText = categoryText
        self.titleLabel!.text = title
        self.subtitleLabel!.text = subtitle
        
        let authorText = NSAttributedString(string: author)
        self.authorLabel!.attributedText = authorText
        
        self.authorPhoto = authorPhoto
        self.authorPhotoView!.image = authorPhoto
        self.authorPhotoView!.contentMode = .ScaleAspectFit
        self.authorPhotoView!.layer.cornerRadius = authorPhotoView!.frame.size.height / 2
        self.authorPhotoView!.layer.masksToBounds = true
        self.authorPhotoView!.layer.borderWidth = 0
        
        self.date = date
        self.dateLabel!.textColor = .lightGrayColor()
        
        var dayComponent = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: date)
        let days = dayComponent.day
        var dateString = dateStringFromDays(days)
        if !dateString {
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "LLLL d"
            dateString = dateFormatter.stringFromDate(date)
        }
        
        self.dateLabel!.text = dateString!.uppercaseString
        
        
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
        case (days == 0):
            return "today"
        case (days == 1):
            return "1 day ago"
        case (days < 7):
            return "\(days) days ago"
        case (days < 14):
            return "last week"
        case (days < 21):
            return "two weeks ago"
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
