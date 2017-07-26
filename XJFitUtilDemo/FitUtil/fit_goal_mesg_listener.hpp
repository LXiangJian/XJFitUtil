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


#if !defined(FIT_GOAL_MESG_LISTENER_HPP)
#define FIT_GOAL_MESG_LISTENER_HPP

#include "fit_goal_mesg.hpp"

namespace fit
{

class GoalMesgListener
{
public:
    virtual ~GoalMesgListener() {}
    virtual void OnMesg(GoalMesg& mesg) = 0;
};

} // namespace fit

#endif // !defined(FIT_GOAL_MESG_LISTENER_HPP)
