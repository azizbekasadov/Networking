//
//  ViewController.m
//  Networking
//
//  Created by Azizbek Asadov on 11.11.2025.
//

#import "ViewController.h"
#import "NetworkService.h"
#import "Networking.h"

@interface ViewController()

@property (weak, nonatomic) IBOutlet NSImageView *imageView;
@property (strong, nonatomic) NetworkService *networkService;

@end

@implementation ViewController

- (NetworkService *)networkService {
    if (!_networkService) {
        _networkService = [[NetworkService alloc] init];
    }
    
    return _networkService;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [[[NSColor redColor] colorWithAlphaComponent:0.5] CGColor];
    
    [self loadImage];
}

- (void) loadImage {
    NSInteger width = (long)self.imageView.bounds.size.width;
    NSInteger height = (long)self.imageView.bounds.size.height;
    
    NSString* urlString = [NSString
                           stringWithFormat:@"https://placekitten.com/%li/%li", width, height];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        ViewController * __weak weakSelf = self;
        [self.networkService loadImageFromURL:url withCompletionHandler:^(NSImage * image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[weakSelf imageView] setImage:image];
            });
        }];
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    if (self.imageView) {
        self.imageView.image = nil;
    }
}

@end
