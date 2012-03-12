//
//  AreaView.h
//  GFX
//
//  Created by daren taylor on 07/04/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"
#import <CoreLocation/CoreLocation.h>

@interface AreaView : UIView 
{
	NSMutableArray* lines;
	
	Line* currentLine;
	
	CLLocationCoordinate2D centreCoordinate;
	CLLocationDegrees left;
	CLLocationDegrees top;
	CLLocationDegrees right;
	CLLocationDegrees bottom;
	
	CLLocationDegrees width;
	CLLocationDegrees height;
	
}

@property (nonatomic, retain) NSMutableArray* lines;
@property (nonatomic, retain) Line* currentLine;
@property CLLocationCoordinate2D centreCoordinate;

-(CGPoint) coordinateToPoint:(CLLocationCoordinate2D) inLocation;
-(CLLocationCoordinate2D) pointToCoordinate:(CGPoint) inPoint;


//@property CLLocationDegrees left;
//@property CLLocationDegrees top;
//@property CLLocationDegrees right;
//@property CLLocationDegrees bottom;

@end
