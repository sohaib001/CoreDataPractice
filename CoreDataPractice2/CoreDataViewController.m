//
//  CoreDataViewController.m
//  CoreDataPractice2
//
//  Created by Sohaib Muhammad on 18/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CoreDataViewController.h"
#import "AppDelegate.h"
@interface CoreDataViewController ()

@end

@implementation CoreDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)btnFindPressed:(UIButton *)sender{
    
    // get the shared object of UIApplication
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    NSManagedObjectContext  *context = [appDelegate managedObjectContext];
    
  
    NSEntityDescription *contacts;
    
    contacts = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:context];
    
    
    // fetch the request by initializing the object and then give the entity description
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:contacts];
    
    // predicate string 
    NSString *predicteStr= [NSString stringWithFormat:@"(name = \"%@\")",self.name.text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicteStr];
    
    // set the predicate in the request
    [request setPredicate:predicate];
    
    NSManagedObject *matches = nil;
    
    NSError *error;
    //execute the request by using current context
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count] == 0) {
        self.lblStatus.text = @"No matches";
    } else {
        matches = [objects objectAtIndex:0];
        self.address.text = [matches valueForKey:@"address"];
        self.phoneNo.text = [matches valueForKey:@"phone"];
        self.lblStatus.text = [NSString stringWithFormat:@"%d matches found", [objects count]];
    }
    
    
}
-(void)btnSavePressed:(UIButton *)sender{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    
    [newContact setValue:self.name.text forKey:@"name"];
    [newContact setValue:self.address.text forKey:@"address"];
    [newContact setValue:self.phoneNo.text forKey:@"phone"];
    
    self.name.text = @"";
    self.address.text = @"";
    self.phoneNo.text = @"";
    
    NSError *error;
    
    
    [context save:&error];
	
    if (error) {
        self.lblStatus.text = @"Contact not saved successfully";
        
    }
    else
    self.lblStatus.text = @"Contact saved";
}
@end
