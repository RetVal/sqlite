#!/usr/bin/awk -f
#
# This AWK script scans the opcodes.h file (which is itself generated by
# another awk script) and uses the information gleaned to create the
# opcodes.c source file.
#
# Opcodes.c contains strings which are the symbolic names for the various
# opcodes used by the VDBE.  These strings are used when disassembling a
# VDBE program during tracing or as a result of the EXPLAIN keyword.
#
BEGIN {
  print "/* Automatically generated.  Do not edit */"
  print "/* See the mkopcodec.h script for details. */"
  print "const char *const sqlite3OpcodeNames[] = { \"?\","
}
/^#define OP_/ {
  sub("OP_","",$2)
  print "  \"" $2 "\","
}
END {
  print "};"
}
