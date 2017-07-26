//
//  FitEncoder.m
//  FitUtil
//
//  Created by 刘祥建 on 2017/7/21.
//  Copyright © 2017年 LXJ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FitEncoder.h"

#include <list>
#include "fit_file_id_mesg.hpp"
#include "fit_mesg_broadcaster.hpp"


@interface FitEncoder()

@end

FILE *file;


@implementation FitEncoder

-(id) init{
    self = [super init];
    if(self)
    {
        super.fileName = @"TestFile.fit";
    }
    return self;
}


-(FIT_UINT8) encode{
    std::list<fit::RecordMesg> records;
    super.fe = [[FitEncode alloc] initWithVersion:fit::ProtocolVersion::V10];
    
    if( ( file = [self openFileWithParams:[super writeOnlyParam]] ) == NULL)
    {
        NSLog(@"Error opening file %@", super.fileName);
        return -1;
    }
    
    
    fit::DeveloperDataIdMesg devId;
    for (FIT_UINT8 i = 0; i < 16; i++)
    {
        devId.SetApplicationId(i, i);
    }
    devId.SetDeveloperDataIndex(0);
    
    [self generateFileHead];
    
    return 0;
}

#pragma mark fit文件属性
-(void) generateFileHead{
    fit::FileIdMesg fileId; // Every FIT file requires a File ID message
    fileId.SetType(FIT_FILE_WORKOUT);
    fileId.SetManufacturer(FIT_MANUFACTURER_DYNASTREAM);
    fileId.SetProduct(100);
    fileId.SetSerialNumber(12345);
    fileId.SetGarminProduct(1);
    fileId.SetLocalNum(1);
    std::wstring wstring_name(L"MEGEAR");
    fileId.SetProductName(wstring_name);
    [super.fe WriteMesg:fileId];
    
    fit::FileCreatorMesg creatorMesg;
    creatorMesg.SetSoftwareVersion(1);
    [super.fe WriteMesg:creatorMesg];
    
    
    [self generateUser];
    [self generateEventBegin];

}



-(void) generateUser{
    fit::UserProfileMesg upm;
    upm.SetAge(25);
    upm.SetGender(FIT_GENDER_MALE);
    upm.SetHeight((FIT_FLOAT32)170);
    upm.SetWeight((FIT_FLOAT32)65);
    
    [super.fe WriteMesg:upm];
}


-(void) generateEventBegin{
    fit::EventMesg eventMesg;
    eventMesg.SetLocalNum(2);
    //    eventMesg.SetTimestamp()
    eventMesg.SetTimerTrigger(FIT_TIMER_TRIGGER_MANUAL);
    eventMesg.SetData((FIT_FLOAT32)1);
    eventMesg.SetEvent(FIT_EVENT_TIMER);
    eventMesg.SetEventType(FIT_EVENT_TYPE_START);
    eventMesg.SetEventGroup((FIT_UINT8)0);
    
    [super.fe WriteMesg:eventMesg];
}


#pragma mark 添加运动数据

-(void) generateSession{
    fit::SessionMesg sessionMsg;
    sessionMsg.SetLocalNum(5);
    sessionMsg.SetMessageIndex(0);
//    sessionMsg.SetStartTime(<#FIT_DATE_TIME startTime#>);
//    sessionMsg.SetTotalTimerTime(<#FIT_FLOAT32 totalTimerTime#>);
    sessionMsg.SetFirstLapIndex(0);
    sessionMsg.SetNumLaps(1);
    sessionMsg.SetEvent(FIT_EVENT_SESSION);
    sessionMsg.SetEventType(FIT_EVENT_TYPE_STOP);
    sessionMsg.SetSport(FIT_SPORT_CYCLING);
    sessionMsg.SetSubSport(FIT_SUB_SPORT_ROAD);
    sessionMsg.SetTrigger(FIT_SESSION_TRIGGER_ACTIVITY_END);
    
    //添加运动数据
    sessionMsg.SetMaxSpeed(30);
    
    [super.fe WriteMesg:sessionMsg];
}

-(void) generateActivity{
    fit::ActivityMesg activityMesg;
    activityMesg.SetLocalNum(6);
//    activityMesg.SetTimestamp(<#FIT_DATE_TIME timestamp#>);
//    activityMesg.SetTotalTimerTime(<#FIT_FLOAT32 totalTimerTime#>);
    activityMesg.SetNumSessions(1);
    activityMesg.SetType(FIT_ACTIVITY_MANUAL);
    activityMesg.SetEvent(FIT_EVENT_ACTIVITY);
    activityMesg.SetEventType(FIT_EVENT_TYPE_STOP);
    
    [super.fe WriteMesg:activityMesg];
}

-(void) generateEventEnd{
    fit::EventMesg eventMesg;
    eventMesg.SetLocalNum(3);
//    eventMesg.SetTimestamp(<#FIT_DATE_TIME timestamp#>);
    eventMesg.SetTimerTrigger(FIT_TIMER_TRIGGER_AUTO);
    eventMesg.SetEvent(FIT_EVENT_TIMER);
    eventMesg.SetEventType(FIT_EVENT_TYPE_STOP_ALL);
    eventMesg.SetEventGroup((FIT_UINT8)0);
    
    [super.fe WriteMesg:eventMesg];
}


-(void)getGarminDate{
    
}


-(void) close{
    if (![super.fe Close])
    {
        NSLog(@"Error closing file %@", super.fileName);
    }
    [self generateEventEnd];
    [self generateSession];
    [self generateActivity];
    
    fclose(file);
    file=NULL;
    
}

@end

