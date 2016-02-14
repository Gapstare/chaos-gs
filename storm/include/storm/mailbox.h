// Abstract: Mailbox structures
// Author: Per Lundberg <per@chaosdev.io>

// © Copyright 2000, 2013 chaos development.

#pragma once

#include <storm/types.h>

// Those parameters are passed to the mailbox system calls.
typedef struct
{
    unsigned int protocol;
    unsigned int message_class;

    unsigned int length;

    bool block;

    void *data;
} message_parameter_type;
