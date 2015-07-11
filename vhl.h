/*
 * Copyright (C) 2015 VHL Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef _VHL_SDK_H_
#define _VHL_SDK_H_


typedef enum{
  VARIABLE_EXIT_MASK = 1,
  VARIABLE_SUSPEND_MASK = 2
} INT_VARIABLE_OPTIONS;

int vhl_GetIntSetting(INT_VARIABLE_OPTIONS option);
int vhl_SetIntSetting(INT_VARIABLE_OPTIONS option, int value);

#endif
