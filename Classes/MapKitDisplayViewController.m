//
//  MapKitDisplayViewController.m
//  MapKitDisplay
//
//  Created by Chakra on 12/07/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import "MapKitDisplayViewController.h"
#import "DisplayMap.h"

@implementation MapKitDisplayViewController

@synthesize mapView;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.mapView setMapType:MKMapTypeStandard];
	[self.mapView setZoomEnabled:YES];
	[self.mapView setScrollEnabled:YES];
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	/*region.center.latitude = 22.569722 ;
	region.center.longitude = 88.369722; */
    region.center.latitude = 23.039568 ;
	region.center.longitude = 72.566004;
	
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[self.mapView setRegion:region animated:YES]; 
	
	[mapView setDelegate:self];

	DisplayMap *ann = [[DisplayMap alloc] init];
	ann.title = @"Ahmedabad";
	ann.subtitle = @"GTU"; 
	ann.coordinate = region.center;
    
    region.center.latitude = 53.039568 ;
	region.center.longitude = 27.566004;
    DisplayMap *ann1 = [[DisplayMap alloc] init];
	ann1.title = @"abc";
	ann1.subtitle = @"GTU";
	ann1.coordinate = region.center;
    
    region.center.latitude = 13.039568 ;
	region.center.longitude = 22.566004;
    DisplayMap *ann2 = [[DisplayMap alloc] init];
	ann2.title = @"def";
	ann2.subtitle = @"GTU";
	ann2.coordinate = region.center;
    
    
    NSArray* annotationArray = [[NSArray alloc] initWithObjects:ann, ann1, ann2, nil];
    
	[mapView addAnnotations:annotationArray];
 
}



-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
 (id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinView = nil; 
	if(annotation != mapView.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil ) pinView = [[[MKPinAnnotationView alloc]
										  initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];

		pinView.pinColor = MKPinAnnotationColorRed; 
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
		} 
	else {
		[mapView.userLocation setTitle:@"I am here"];
	}
	return pinView;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


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
	[mapView release];
    [super dealloc];
}

@end
