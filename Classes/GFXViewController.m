//
//  GFXViewController.m
//  GFX
//
//  Created by daren taylor on 07/04/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "GFXViewController.h"

@implementation GFXViewController

@synthesize areaView;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {

	[self startUpdates];
	
	
	[super loadView];
}



- (void)startUpdates
{
	if(nil == locationManager)
	{
		locationManager = [[CLLocationManager alloc] init];
		
		locationManager.delegate = self;
		[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
		
		[locationManager startUpdatingLocation];
		
	}
}


- (void)locationManager:(CLLocationManager*) manager
	didUpdateToLocation:(CLLocation*)newLocation
		   fromLocation:(CLLocation*)oldLocation
{
	// Location has been found. Create Google Maps URL 
	CLLocationCoordinate2D loc = [newLocation coordinate];
	/*
	if(emulatedLocation.latitude == 0.0 && emulatedLocation.longitude == 0.0)
	{
		emulatedLocation = loc;
		
		[self startAccelerometer];
	}
	else
	{
	
	}
	*/
	
	((AreaView*)self.view).centreCoordinate = loc;
	
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}




-(void) startAccelerometer
{
	
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];	
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval: 1.0 / 50];
	
	
}


- (void)accelerometer:(UIAccelerometer *)accelerometer 
		didAccelerate:(UIAcceleration *)acceleration 
{ 

		emulatedLocation.latitude += [acceleration x]/1000; 
		emulatedLocation.longitude -= [acceleration y]/1000; 


	((AreaView*)self.view).centreCoordinate = emulatedLocation;}


@end
