//
//  ViewController.m
//  Peek
//
//  Created by Neroscofee on 2021/10/25.
//

#import "ViewController.h"
#import "Scene.h"
#import "UIColor+DYTColor.h"

@interface ViewController () <ARSKViewDelegate>
{
    NSInteger num;
    NSArray *arr;
}

@property (nonatomic, strong) IBOutlet ARSKView *sceneView;



@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    num = 0;
    arr = [NSArray arrayWithObjects:@"鲤鱼",@"豆子",@"鲫鱼",@"阿吉",@"丁一",@"树",@"ming总",@"南西",@"佳馨",@"Julie",@"黄总",@"小茴",@"杨炀",@"娜娜",@"杉杉",@"慕士塔格峰筹备组", nil];
    // Set the view's delegate
    self.sceneView.delegate = self;
    
    // Show statistics such as fps and node count
    self.sceneView.showsFPS = YES;
    self.sceneView.showsNodeCount = YES;
    
    // Load the SKScene from 'Scene.sks'
    Scene *scene = (Scene *)[SKScene nodeWithFileNamed:@"Scene"];
    
    // Present the scene
    [self.sceneView presentScene:scene];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];

    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

#pragma mark - ARSKViewDelegate

- (SKNode *)view:(ARSKView *)view nodeForAnchor:(ARAnchor *)anchor {
    // Create and configure a node for the anchor added to the view's session.
    
    if (num >= arr.count) {
        num = 0;
    }

//    SKLabelNode *labelNode = nil;
//    for (int i = 0; i < arr.count; i++) {
//        labelNode = [SKLabelNode labelNodeWithText:[arr objectAtIndex:i]];
//        labelNode.fontSize = 12;
//        labelNode.fontColor = [UIColor redColor];
//        labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
////        return labelNode;
//    }
    SKLabelNode *labelNode = [SKLabelNode labelNodeWithText:[arr objectAtIndex:num]];
    labelNode.fontSize = 12;
//    labelNode.fontColor = [UIColor dytRandomColor];
    if (num < 6) {
        labelNode.fontColor = [UIColor blueColor];
    } else if (num >= 6 && num <= 14) {
        labelNode.fontColor = [UIColor redColor];
    } else {
        labelNode.fontColor = [UIColor orangeColor];
    }
    labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    num++;
    return labelNode;
//    SKLabelNode *labelNode = [SKLabelNode labelNodeWithText:@"Julie"];
//    labelNode.fontSize = 12;
//    labelNode.fontColor = [UIColor redColor];
//    labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//    labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
//    return labelNode;
}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end
