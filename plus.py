#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 zuiyuki-ctrl
# SPDX-License-Identifier: GPL-3.0-only

import sys
   
ans = 0.0
for line in sys.stdin:
    ans += float(line)
     
print(int(ans))