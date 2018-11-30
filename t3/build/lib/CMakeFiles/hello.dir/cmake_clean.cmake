FILE(REMOVE_RECURSE
  "CMakeFiles/hello.dir/hello.o"
  "../bin/libhello.pdb"
  "../bin/libhello.so"
  "../bin/libhello.so.1.2"
  "../bin/libhello.so.1"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang C)
  INCLUDE(CMakeFiles/hello.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
