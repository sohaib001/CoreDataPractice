//
//  CoreDataViewController.h
//  CoreDataPractice2
//
//  Created by Sohaib Muhammad on 18/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnFind;
- (IBAction)btnSavePressed:(UIButton *)sender;
- (IBAction)btnFindPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phoneNo;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;
@end
