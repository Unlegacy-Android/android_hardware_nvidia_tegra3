/*
 * Copyright (C) 2013 The Android Open Source Project
 * Copyright (C) 2018 Unlegacy Android Project
 * Copyright (C) 2018 Svyatoslav Ryhel
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <errno.h>

#include <hardware/memtrack.h>

#include "memtrack_tegra3.h"

int tegra3_memtrack_init(const struct memtrack_module *module)
{
    if (!module)
        return -1;

    return 0;
}

int tegra3_memtrack_get_memory(const struct memtrack_module *module __unused,
                               pid_t pid __unused,
                               int type __unused,
                               struct memtrack_record *records __unused,
                               size_t *num_records __unused)
{
    if (type == MEMTRACK_TYPE_GL || type == MEMTRACK_TYPE_GRAPHICS) {
        return nvmap_memtrack_get_memory(pid, type, records, num_records);
    } 

    return -EINVAL;
}

static struct hw_module_methods_t memtrack_module_methods = {
    .open = NULL,
};

struct memtrack_module HAL_MODULE_INFO_SYM = {
    .common = {
        .tag = HARDWARE_MODULE_TAG,
        .module_api_version = MEMTRACK_MODULE_API_VERSION_0_1,
        .hal_api_version = HARDWARE_HAL_API_VERSION,
        .id = MEMTRACK_HARDWARE_MODULE_ID,
        .name = "Tegra 3 Memory Tracker HAL",
        .author = "Svyatoslav Ryhel",
        .methods = &memtrack_module_methods,
    },

    .init = tegra3_memtrack_init,
    .getMemory = tegra3_memtrack_get_memory,
};
