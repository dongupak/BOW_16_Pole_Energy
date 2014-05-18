//
//  BirdsSprite.m
//  GameDemo
//
//  Created by Youngrok Lee on 10. 9. 5..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Bird.h"

@implementation Bird

//헤더파일(Bird.h)에서 프로퍼티로 선언했던 변수들의 setter와 getter를 자동으로 생성시켜 줍니다.
@synthesize flyAnimate;
@synthesize sitAnimate;
@synthesize tailAnimate;
@synthesize sitPoint;
@synthesize startPoint;
@synthesize isDead;
@synthesize delegate;
@synthesize HP;
@synthesize damage;
@synthesize point;

- (void)dealloc {
	if (flyAnimate != nil)	[self setFlyAnimate:nil];
	if (sitAnimate != nil)	[self setSitAnimate:nil];
	if (tailAnimate != nil)	[self setTailAnimate:nil];
    [super dealloc];	
}	

//새가 flyAnimate를 무한반복하게 하고 sitPoint로 이동하여 onLine이라는 메소드를 수행하도록 하는 메소드 onEnter 입니다.
- (void)onEnter{
    [super onEnter];
	id actionFly    = [CCRepeatForever actionWithAction:flyAnimate];
    id actionMove   = [CCMoveTo actionWithDuration:ccpDistance(self.position, sitPoint)/150 position:sitPoint];
    id moveComplete = [CCCallFunc actionWithTarget:self selector:@selector(onLine)];
    [self runAction:actionFly];
    [self runAction:[CCSequence actions:actionMove, moveComplete, nil]];
}

//전선 위의 새가 모든 액션을 중지하고 sitAnimate를 수행하며 1초 간격으로 onTimer라는 메소드를 수행합니다.(스케쥴러 이용)
- (void)onLine {
	id actionSit=[CCRepeatForever actionWithAction:sitAnimate];
    [self stopAllActions];
    [self runAction:actionSit];
    [self schedule:@selector(onTimer) interval:1.0f];
}

//Bird 가 죽지 않으면 damage를 인자로 하는 birdAttack 함수를 호출하는 메소드입니다.
- (void)onTimer {
    
	if(!isDead) [self.delegate birdAttack:self.damage];	
}

//새의 체력(HP) 를 1씩 감소시키고 HP가 0이 되면 die라는 메소드를 수행합니다.
- (void)hit {
    HP -=1;
    if (HP==0) {
        [self die];
    }
}

// 변수 isDead를 YES로 정의하고, 모든 액션을 중지합니다.
//deadComplete 메소드를 호출하는 액션인 deadComplete를 정의하고 새가 tailAnimate와 deadComplete를 순차적으로 수행하도록 합니다.
- (void)die {
    isDead = YES;
    [self stopAllActions];
    id deadComplete = [CCCallFunc actionWithTarget:self selector:@selector(deadComplete)];
    [self runAction:[CCSequence actions:tailAnimate, deadComplete, nil]];
}


- (void)deadComplete {
    [self.delegate deadComplete:self];
}

@end
