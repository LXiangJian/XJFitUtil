////////////////////////////////////////////////////////////////////////////////
// The following FIT Protocol software provided may be used with FIT protocol
// devices only and remains the copyrighted property of Dynastream Innovations Inc.
// The software is being provided on an "as-is" basis and as an accommodation,
// and therefore all warranties, representations, or guarantees of any kind
// (whether express, implied or statutory) including, without limitation,
// warranties of merchantability, non-infringement, or fitness for a particular
// purpose, are specifically disclaimed.
//
// Copyright 2017 Dynastream Innovations Inc.
////////////////////////////////////////////////////////////////////////////////
// ****WARNING****  This file is auto-generated!  Do NOT edit this file.
// Profile Version = 20.38Release
// Tag = production/akw/20.38.00-0-geccbce3
////////////////////////////////////////////////////////////////////////////////


#import <Foundation/Foundation.h>
#import "FitFieldDefinition.h"

#include "fit.hpp"

@interface FitFieldDefinition ()

@end

@implementation FitFieldDefinition

- (FIT_UINT8) Write:(FILE *) file forMesgDefn:(const fit::FieldDefinition *)fieldDefinition
{
    FIT_UINT8 byte;
    byte = fieldDefinition->GetNum();
    fwrite(&byte, 1, 1, file);
    byte = fieldDefinition->GetSize();
    fwrite(&byte, 1, 1, file);
    byte = fieldDefinition->GetType();
    fwrite(&byte, 1, 1, file);
    return 3;
}

@end
