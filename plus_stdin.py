#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Zuisei Sai
# SPDX-License-Identifier: GPL-3.0-only

import sys
   
ans = 0.0
for line in sys.stdin:
    ans += float(line)
     
print(ans)