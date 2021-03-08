#!/bin/bash
find /scratch -type f -print0 | xargs -0 chmod 666
find /scratch -type d -print0 | xargs -0 chmod 777
find /scratch -type f -name "*.sh" -print0 | xargs -0 chmod +x
find /scratch/scripts -type f -print0 | xargs -0 chmod 777

