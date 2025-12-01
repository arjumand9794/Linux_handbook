#!/bin/bash
find /var/log/myapp -type f -mtime +14 -delete
