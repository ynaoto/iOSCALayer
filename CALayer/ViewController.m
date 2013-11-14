//
//  ViewController.m
//  CALayer
//
//  Created by Naoto Yoshioka on 2013/11/14.
//  Copyright (c) 2013年 Naoto Yoshioka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *windowView;
@property (weak, nonatomic) IBOutlet UILabel *anchorXLabel;
@property (weak, nonatomic) IBOutlet UILabel *anchorYLabel;

@end

@implementation ViewController
{
    NSArray *images;
}

static NSArray *gravities = nil;

- (void)updateAnchorLabels
{
    CALayer *layer = self.windowView.layer;
    self.anchorXLabel.text = [NSString stringWithFormat:@"%f", layer.anchorPoint.x];
    self.anchorYLabel.text = [NSString stringWithFormat:@"%f", layer.anchorPoint.y];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    images = @[
               [UIImage imageNamed:@"grid64.png"],
               [UIImage imageNamed:@"grid.png"],
               ];
    CALayer *layer = self.windowView.layer;
    if (gravities == nil) {
        gravities = @[
                      kCAGravityCenter,
                      kCAGravityTop,
                      kCAGravityBottom,
                      kCAGravityLeft,
                      kCAGravityRight,
                      kCAGravityTopLeft,
                      kCAGravityTopRight,
                      kCAGravityBottomLeft,
                      kCAGravityBottomRight,
                      ];
    }
    layer.contentsGravity = gravities[0];
    layer.contents = (id)((UIImage*)images[0]).CGImage;
    [self updateAnchorLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gravityChanged:(UISegmentedControl *)sender {
    self.windowView.layer.contentsGravity = gravities[sender.selectedSegmentIndex];
}

- (IBAction)geometryFlippedChanged:(UISwitch *)sender {
    self.windowView.layer.geometryFlipped = sender.on;
}

- (IBAction)masksToBoundsChanged:(UISwitch *)sender {
    self.windowView.layer.masksToBounds = sender.on;
}

- (IBAction)imageChanged:(UISegmentedControl *)sender {
    self.windowView.layer.contents = (id)((UIImage*)images[sender.selectedSegmentIndex]).CGImage;
}

- (IBAction)anchorXChanged:(UISlider *)sender {
    CGPoint p = self.windowView.layer.anchorPoint;
    p.x = sender.value;
    self.windowView.layer.anchorPoint = p;
    [self updateAnchorLabels];
}

- (IBAction)anchorYChanged:(UISlider *)sender {
    CGPoint p = self.windowView.layer.anchorPoint;
    p.y = sender.value;
    self.windowView.layer.anchorPoint = p;
    [self updateAnchorLabels];
}

@end
