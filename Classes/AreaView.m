#import "AreaView.h"


@implementation AreaView

@synthesize lines, currentLine;
//@synthesize left,top,right,bottom;

-(CLLocationCoordinate2D) centreCoordinate
{
	return centreCoordinate;
}

-(void) setCentreCoordinate:(CLLocationCoordinate2D) inCentreCoordinate
{
	centreCoordinate = inCentreCoordinate;
	
	left = inCentreCoordinate.longitude - 0.01;
	right = inCentreCoordinate.longitude + 0.01;
	
	top = inCentreCoordinate.latitude + 0.01;
	bottom = inCentreCoordinate.latitude - 0.01;
	
	width = right-left;
	
	height = top-bottom;
	
	[self setNeedsDisplay];
}

- (id)init {
    if (self = [super init]) {
//        self.userInteractionEnabled = YES;
    }
    return self;
}


- (id)initWithCoder:(NSCoder*)coder
{
	if(self = [super initWithCoder:coder])
	{
		self.userInteractionEnabled = YES;
		
		NSMutableArray* array = [[NSMutableArray alloc] init];
		self.lines = array;
		[array release];
	}
	
	return self;
}








- (void)drawRect:(CGRect)rect 
{
	Line* line;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetStrokeColorWithColor(context,  [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor);
	
	CGContextSetLineJoin(context, kCGLineJoinRound);
	
	
		CGContextSetLineWidth(context, 5.0);
	for(NSInteger i = 0 ; i < [lines count] ; i++)
	{
		line = [lines objectAtIndex:i];
		
		CGPoint start = [self coordinateToPoint:line.start];
		CGPoint end = [self coordinateToPoint:line.end];
		
	//	CGContextMoveToPoint(context, line.xStart,line.yStart);		
	//	CGContextAddLineToPoint(context, line.xEnd, line.yEnd);		

		CGContextMoveToPoint(context, start.x,start.y);		
		CGContextAddLineToPoint(context, end.x, end.y);		
	
		
	}
	
	CGContextStrokePath(context);
	
}


- (void)dealloc {
    [super dealloc];
}



- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	CGPoint pt = [[touches anyObject] locationInView:self];
	
	Line* line = [[Line alloc] init];
	self.currentLine = line;
	[line release];
	
	

	
	currentLine.start = [self pointToCoordinate:pt];
	
	currentLine.xStart = pt.x;
	currentLine.yStart = pt.y;
	
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
	CGPoint pt = [[touches anyObject] locationInView:self];
	currentLine.xEnd = pt.x;
	currentLine.yEnd = pt.y;
	currentLine.end = [self pointToCoordinate:pt];
	
	[lines addObject:currentLine];
	
	
	
	Line* line = [[Line alloc] init];
	self.currentLine = line;
	[line release];
	
	currentLine.xStart = pt.x;
	currentLine.yStart = pt.y;
	currentLine.start = [self pointToCoordinate:pt];

	
	[self setNeedsDisplay];
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint pt = [[touches anyObject] locationInView:self];
	
	currentLine.xEnd = pt.x;
	currentLine.yEnd = pt.y;
	currentLine.end = [self pointToCoordinate:pt];

	[lines addObject:currentLine];
	
	[self setNeedsDisplay];
	
	
}




-(CGPoint) coordinateToPoint:(CLLocationCoordinate2D) inLocation
{
	
	
	

	/*
	 aDrawRect.Height() - ((intLat
	 - bottomLat)* aDrawRect.Height())
	 / ((topLat - bottomLat));
	
*/
	CGPoint retVal;
	
	CLLocationDegrees latpc = (((CLLocationDegrees)100/width) * inLocation.latitude)/100;
	CLLocationDegrees lngpc = (((CLLocationDegrees)100/height) * inLocation.longitude)/100;
	
	retVal.y =  (latpc * 480);
	retVal.x =  (lngpc * 320);
	
	retVal.y = ((inLocation.latitude - left ) * 480) / width;
	retVal.x = ((inLocation.longitude - bottom) * 320) / height;
	
	
//	((inLocation.longitude - left ) * 480) / width;
	
	
	return retVal;
	
	
	
	/*
	CGPoint retVal;
	
	retVal.y = (CLLocationDegrees)(width / (inLocation.latitude - left)) *480;
	retVal.x = (CLLocationDegrees)(height / (inLocation.longitude - top)) *320;
	
	
	return retVal;
*/

}
-(CLLocationCoordinate2D) pointToCoordinate:(CGPoint) inPoint
{
	CLLocationCoordinate2D retVal;
	
	CLLocationDegrees latpc = (((CLLocationDegrees)100/480) * inPoint.y)/100;
	CLLocationDegrees lngpc = (((CLLocationDegrees)100/320) * inPoint.x)/100;
	
	retVal.latitude = left + (latpc * width);
	retVal.longitude = bottom + (lngpc * height);

	return retVal;
}


@end
