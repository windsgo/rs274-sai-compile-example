#!/bin/bash
build/sai -g test.ngc | awk '{$1=""; print}'
exit ${PIPESTATUS[0]}
