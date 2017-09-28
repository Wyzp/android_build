#
# Copyright (C) 2017 TeamNexus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Cleanup
my_optimized_cflags :=

# CPU/Architecture-specific optimizations
ifneq ($(TARGET_OPTIMIZED_ARCH_VARIANT),)
  my_optimized_cflags += \
      -march=$(TARGET_OPTIMIZED_ARCH_VARIANT)
endif

ifneq ($(TARGET_OPTIMIZED_CPU_VARIANT),)
  my_optimized_cflags += \
      -mtune=$(TARGET_OPTIMIZED_CPU_VARIANT)
endif

# General compiler-optimizations
ifeq ($(TARGET_USE_FAST_OPTIMIZATION),true)
  my_optimized_cflags += \
      -Ofast
endif

# Override set flags
LOCAL_CFLAGS := $(my_optimized_cflags) $(LOCAL_CFLAGS)
