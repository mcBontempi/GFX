#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Line : NSObject 
{
	CGFloat xStart;
	CGFloat yStart;
	
	CGFloat xEnd;
	CGFloat yEnd;
	
	CLLocationCoordinate2D start;
	CLLocationCoordinate2D end;
	
}

@property CGFloat xStart;
@property CGFloat yStart;
@property CGFloat xEnd;
@property CGFloat yEnd;

@property CLLocationCoordinate2D start;
@property CLLocationCoordinate2D end;



@end
