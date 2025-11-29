#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 zuiyuki-ctrl
# SPDX-License-Identifier: GPL-3.0-only

import sys

def main():
    """標準入力からテキストを読み取り、統計情報を標準出力に出力する"""
    try:
        lines = []
        total_chars = 0
        total_words = 0
        total_bytes = 0
        
        # 標準入力から読み取り
        for line in sys.stdin:
            lines.append(line)
            total_chars += len(line)
            total_words += len(line.split())
            total_bytes += len(line.encode('utf-8'))
        
        # 統計情報を計算
        line_count = len(lines)
        
        # 標準出力に結果を出力
        print(f"Lines: {line_count}")
        print(f"Words: {total_words}")
        print(f"Characters: {total_chars}")
        print(f"Bytes: {total_bytes}")
        
        return 0
        
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1

if __name__ == "__main__":
    sys.exit(main())

