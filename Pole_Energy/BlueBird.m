//
//  BlueBird.m
//  Birds
//
//  Created by Youngrok Lee on 10. 9. 5..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BlueBird.h"
@implementation BlueBird

- (id)init {
	self=[super init];
	if (self != nil) {
        
        //파랑새의 체력,피해량,포인트를 각각 1,10,100으로 설정합니다.
        HP = 1;
        damage = 10;
        point  = 100;
        
        //파랑새의 애니메이션 3가지를 설정합니다.
		NSMutableArray *flyFrames = [NSMutableArray array];
        for(NSInteger idx = 1; idx < 17; idx++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"blue_fly%04d.png",idx]];
            [flyFrames addObject:frame];
        }
		CCAnimation *flyAnimation = [CCAnimation animationWithSpriteFrames:flyFrames delay:0.05f];
        flyAnimate = [[CCAnimate alloc] initWithAnimation:flyAnimation];

		NSMutableArray *sitFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <61; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"blue_sit_%04d.png",idx]];
            [sitFrames addObject:frame];
        }
		CCAnimation *sitAnimation = [CCAnimation animationWithSpriteFrames:sitFrames delay:0.05f];
		sitAnimate = [[CCAnimate alloc] initWithAnimation:sitAnimation];
		
		NSMutableArray *tailFrames = [NSMutableArray array];
		for (NSInteger idx = 1; idx <16; idx++)  {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                    [NSString stringWithFormat:@"blue_tail_%04d.png",idx]];
            [tailFrames addObject:frame];
        }
		CCAnimation *tailAnimation = [CCAnimation animationWithSpriteFrames:tailFrames delay:0.05f];
		tailAnimate = [[CCAnimate alloc] initWithAnimation:tailAnimation];
		
    }
	return self;
}

@end
